// Copyright (C) 2016 Pelagicore
//
// You may use this file under the terms of the GPLv3 license.
// See the file LICENSE from this package for details.
//
// SPDX-License-Identifier: GPL-3.0
#include "ParseException.h"
#include "krulevisitor.h"
#include <gen/Printer.H>
#include <QPointer>
#include <QRegExp>

QPointer<RetType> KRuleVisitor::visitRuleSet(RuleSet *) {} //abstract class
QPointer<RetType> KRuleVisitor::visitRule(Rule *) {} //abstract class
QPointer<RetType> KRuleVisitor::visitASTScope(ASTScope *) {} //abstract class
QPointer<RetType> KRuleVisitor::visitRuleCause(RuleCause *) {} //abstract class
QPointer<RetType> KRuleVisitor::visitExplanation(Explanation *) {} //abstract class
QPointer<RetType> KRuleVisitor::visitTag(Tag *) {} //abstract class
QPointer<RetType> KRuleVisitor::visitSeverity(Severity *) {} //abstract class
QPointer<RetType> KRuleVisitor::visitIAtom(IAtom *) {} //abstract class
QPointer<RetType> KRuleVisitor::visitSAtom(SAtom *) {} //abstract class
QPointer<RetType> KRuleVisitor::visitExpr(Expr *) {} //abstract class
QPointer<RetType> KRuleVisitor::visitPathQuantifier(PathQuantifier *) {}
QPointer<RetType> KRuleVisitor::visitQuantifier(Quantifier *) {}


QPointer<RetType> KRuleVisitor::visitRSet(RSet *rset) {
    return rset->listrule_->accept(this);
}

QPointer<RetType> KRuleVisitor::visitRRule(RRule *rrule) {
    try {
        currentRuleTag = extractQString(rrule->tag_->accept(this));
        currentRuleSeverity = extractQString(rrule->severity_->accept(this));
        currentRuleCause = extractQString(rrule->rulecause_->accept(this));
        currentRuleASTScope = extractQString(rrule->astscope_->accept(this));
        currentRuleExplanation = extractQString(rrule->explanation_->accept(this));

        qDebug() << "#########################################################";
        qDebug() << "            Verifying rule "<<currentRuleTag;
        qDebug() << "#########################################################";
        NodeWrapper* rootNode = node;
        NodeWrapper* rootClone = new NodeWrapper(rootNode);
        node = rootClone;
        blameNode = node;
        while (!extractBool(rrule->quantifier_->accept(this))) {
            qDebug() << "FAILURE at node" << blameNode->getId();
            KRuleOutput* outp;
            if (failedRules.contains(currentRuleTag)) {
                outp = failedRules[currentRuleTag];
            } else {
                outp = new KRuleOutput(currentRuleTag, currentRuleSeverity,
                                       currentRuleASTScope, currentRuleCause, currentRuleExplanation);
            }
            outp->addCodeOccurrance(CodeOccurrance(blameNode->getSource(),
                                                   blameNode->getFileName().absoluteFilePath(),
                                                   blameNode->getRow(),
                                                   blameNode->getCol()));
            failedRules.insert(currentRuleTag, outp);
            rootClone->dropNode(blameNode);
            blameNode = node;
        }
        node = rootNode;
        delete rootClone;
    }
    catch(NotImplemented &) {}
    return QPointer<RetType>();
}

QPointer<RetType> KRuleVisitor::visitASTGlobally(ASTGlobally *) {
    return new RetTypeString(QString("Globally"));
}

QPointer<RetType> KRuleVisitor::visitASTFile(ASTFile *) {
    return new RetTypeString(QString("File"));
}

QPointer<RetType> KRuleVisitor::visitASTImported(ASTImported *) {
    return new RetTypeString(QString("Imported"));
}

QPointer<RetType> KRuleVisitor::visitRCLang(RCLang *) {
    return new RetTypeString(QString("Language restriction"));
}

QPointer<RetType> KRuleVisitor::visitRCPolicy(RCPolicy *) {
    return new RetTypeString(QString("Policy"));
}

QPointer<RetType> KRuleVisitor::visitExplan(Explan *explan) {
    return new RetTypeString(QString(explan->string_.c_str()));
}

QPointer<RetType> KRuleVisitor::visitNoexplan(Noexplan *) {
    return new RetTypeBool(false);
}

QPointer<RetType> KRuleVisitor::visitTTag(TTag *ttag) {
    return new RetTypeString(QString(ttag->string_.c_str()));
}

QPointer<RetType> KRuleVisitor::visitSevInfo(SevInfo *) {
    return new RetTypeString(QString("Info"));
}

QPointer<RetType> KRuleVisitor::visitSevWarning(SevWarning *) {
    return new RetTypeString(QString("Warning"));
}

QPointer<RetType> KRuleVisitor::visitSevCritical(SevCritical *) {
    return new RetTypeString(QString("Critical"));
}

QPointer<RetType> KRuleVisitor::visitQExpr(QExpr *exp) {
    return exp->expr_->accept(this);
}

QPointer<RetType> KRuleVisitor::visitQFor(QFor *exp) {

    const QList<NodeWrapper*> ls = node->getNodes(QString(exp->string_.c_str()));
    NodeWrapper* startNode = node;
    foreach(NodeWrapper* n, ls) {
        quantifiedNode = n;

        QPointer<RetType> r = exp->expr_->accept(this);
        bool b = extractBool(r);

        if (!b) {
            node = n;
            return new RetTypeBool(false);
        }
        node = startNode;
        quantifiedNode = nullptr;
    }

    return new RetTypeBool(true);
}

const bool KRuleVisitor::handleBreakCondition(const bool breakCondition) {
    return breakCondition ? true : false;
}

QPointer<RetType> KRuleVisitor::visitAF(AF *p) {
    ENot *v = new ENot(new EPQ(new EG(new ENot(p->expr_->clone()))));
    QPointer<RetType> r = v->accept(this);
    delete v;
    return r;
}

QPointer<RetType> KRuleVisitor::visitAG(AG *p) {
    ENot *v = new ENot(new EPQ(new EF(new ENot(p->expr_->clone()))));
    QPointer<RetType> r = v->accept(this);
    delete v;
    return r;
}

QPointer<RetType> KRuleVisitor::visitAX(AX *p) {
    ENot *v = new ENot(new EPQ(new EX(new ENot(p->expr_->clone()))));
    QPointer<RetType> r = v->accept(this);
    delete v;
    return r;
}

QPointer<RetType> KRuleVisitor::visitAU(AU *p) {
    Expr *e1 = p->expr_1->clone();
    Expr *e21 = p->expr_2->clone();
    Expr *e22 = p->expr_2->clone();
    Expr *e23 = p->expr_2->clone();
    ENot *v = new ENot(new EOr(
                           new EPQ(new EU(new ENot(e21),
                                          new ENot(new EOr(e1, e22)))),
                           new EPQ(new EG(new ENot(e23)))));
    QPointer<RetType> r = v->accept(this);
    delete v;
    return r;
}

QPointer<RetType> KRuleVisitor::visitEF(EF *p) {
    EU *v = new EU(new ETrue, p->expr_->clone());
    QPointer<RetType> r = v->accept(this);
    delete v;
    return r;
}

QPointer<RetType> KRuleVisitor::visitEG(EG *eg) {
    bool success = false;

    if (!extractBool(eg->expr_->accept(this))) {
        success = false;
    } else {
        const QList<NodeWrapper*> childrn = node->getChildren();
        if (!childrn.isEmpty()) {
            bool breakCondition = false;
            indent += "  ";
            NodeWrapper* n = node;
            foreach(NodeWrapper *child, childrn) {
                node = child;
                blameNode = child;
                qDebug() << indent << child->getId();

                bool res = extractBool(visitEG(eg));
                node = n;
                if (res) {
                        breakCondition = true;
                        break;
                }
            }
            indent.chop(2);
            success = handleBreakCondition(breakCondition);

        } else {
            success = true;
        }
    }

    return new RetTypeBool(success);
}

QPointer<RetType> KRuleVisitor::visitEU(EU *eu) {
    bool success = false;

    const bool result2 = extractBool(eu->expr_2->accept(this));
    if (result2) {
        success = true;
    } else {
        const bool result1 = extractBool(eu->expr_1->accept(this));
        if (result1) {
            const QList<NodeWrapper*> childrn = node->getChildren();
            if (!childrn.isEmpty()) {
                bool breakCondition = false;
                indent += "  ";
                NodeWrapper* n = node;
                foreach(NodeWrapper *child, childrn) {
                    node = child;
                    blameNode = child;
                    qDebug() << indent << child->getId();

                    bool res = extractBool(visitEU(eu));
                    node = n;
                    if (res) {
                            breakCondition = true;
                            break;
                    }
                }
                indent.chop(2);
                success = handleBreakCondition(breakCondition);
            } else {
                success = false;
            }
        } else {
            success = false;
        }
    }

    return new RetTypeBool(success);
}

QPointer<RetType> KRuleVisitor::visitEX(EX *ex) {
    bool success = true;

    const QList<NodeWrapper*> childrn = node->getChildren();
    if (!childrn.isEmpty()) {
        bool breakCondition = false;
        indent += "  ";
        NodeWrapper* n = node;
        foreach(NodeWrapper *child, childrn) {
            node = child;
            blameNode = child;
            qDebug() << indent << child->getNodeType();
            bool res = extractBool(ex->expr_->accept(this));
            node = n;
            if (res) {
                    breakCondition = true;
                    break;
            }
        }
        indent.chop(2);
        success = handleBreakCondition(breakCondition);
    } else {
        success = false;
    }

    return new RetTypeBool(success);
}

QPointer<RetType> KRuleVisitor::visitIInt(IInt *ieint) {
    return visitInteger(ieint->integer_);
}

QPointer<RetType> KRuleVisitor::visitINrChildren(INrChildren *) {
    return new RetTypeUInt((quint32) node->getChildren().length());
}

QPointer<RetType> KRuleVisitor::visitIFRow(IFRow *) {
    if (quantifiedNode != nullptr) {
        return new RetTypeUInt(quantifiedNode->getRow());
    }
    throw NoQuantification();
}

QPointer<RetType> KRuleVisitor::visitIFCol(IFCol *) {
    if (quantifiedNode != nullptr) {
        return new RetTypeUInt(quantifiedNode->getCol());
    }
    throw NoQuantification();
}

QPointer<RetType> KRuleVisitor::visitIRow(IRow *) {
    return new RetTypeUInt(node->getRow());
}

QPointer<RetType> KRuleVisitor::visitICol(ICol *) {
    return new RetTypeUInt(node->getCol());
}

QPointer<RetType> KRuleVisitor::visitEILtEq(EILtEq *ielteq) {
    quint32 i1 = extractUInt(ielteq->iatom_1->accept(this));
    quint32 i2 = extractUInt(ielteq->iatom_2->accept(this));
    return new RetTypeBool(i1 <= i2);
}

QPointer<RetType> KRuleVisitor::visitEIGtEq(EIGtEq *iegteq) {
    quint32 i1 = extractUInt(iegteq->iatom_1->accept(this));
    quint32 i2 = extractUInt(iegteq->iatom_2->accept(this));
    return new RetTypeBool(i1 >= i2);
}

QPointer<RetType> KRuleVisitor::visitEILt(EILt *ielt) {
    quint32 i1 = extractUInt(ielt->iatom_1->accept(this));
    quint32 i2 = extractUInt(ielt->iatom_2->accept(this));
    return new RetTypeBool(i1 < i2);
}

QPointer<RetType> KRuleVisitor::visitEIGt(EIGt *iegt) {
    quint32 i1 = extractUInt(iegt->iatom_1->accept(this));
    quint32 i2 = extractUInt(iegt->iatom_2->accept(this));
    return new RetTypeBool(i1 > i2);
}

QPointer<RetType> KRuleVisitor::visitEIEq(EIEq *ieq) {
    quint32 i1 = extractUInt(ieq->iatom_1->accept(this));
    quint32 i2 = extractUInt(ieq->iatom_2->accept(this));
    return new RetTypeBool(i1 == i2);
}

QPointer<RetType> KRuleVisitor::visitETrue(ETrue *) {
    return new RetTypeBool(true);
}

QPointer<RetType> KRuleVisitor::visitEFalse(EFalse *) {
    return new RetTypeBool(false);
}

QPointer<RetType> KRuleVisitor::visitSValue(SValue *) {
    return new RetTypeString(node->getValue());
}

QPointer<RetType> KRuleVisitor::visitSValueType(SValueType *) {
    return new RetTypeString(node->getValueType());
}

QPointer<RetType> KRuleVisitor::visitSNodeType(SNodeType *) {
    return new RetTypeString(node->getNodeType());
}

QPointer<RetType> KRuleVisitor::visitSString(SString *exp) {
    return new RetTypeString(QString(exp->string_.c_str()));
}

QPointer<RetType> KRuleVisitor::visitSFValue(SFValue *) {
    if (quantifiedNode != nullptr) {
        return new RetTypeString(quantifiedNode->getValue());
    }
    throw NoQuantification();
}

QPointer<RetType> KRuleVisitor::visitSConcat(SConcat *exp) {
    QString s1 = extractQString(exp->satom_1->accept(this));
    QString s2 = extractQString(exp->satom_2->accept(this));
    return new RetTypeString(s1 + s2);
}

QPointer<RetType> KRuleVisitor::visitEPossToken(EPossToken *exp) {
    bool b = node->getTokenMap().contains(QString(exp->string_.c_str()));
    return new RetTypeBool(b);
}

QPointer<RetType> KRuleVisitor::visitEExistToken(EExistToken *exp) {
    bool b = node->hasToken(QString(exp->string_.c_str()));
    return new RetTypeBool(b);
}

QPointer<RetType> KRuleVisitor::visitEMatch(EMatch *exp) {
    bool s = false;

    QRegExp regexp = QRegExp(QString(exp->string_.c_str()));
    QString toMatch = extractQString(exp->satom_->accept(this));
    if (regexp.exactMatch(toMatch)) {
        s = true;
    }
    qDebug() << indent << regexp.pattern() << " ? " << node->getValue() << s;
    return new RetTypeBool(s);
}

QPointer<RetType> KRuleVisitor::visitESEq(ESEq *exp) {

    QString s1 = extractQString(exp->satom_1->accept(this));
    QString s2 = extractQString(exp->satom_2->accept(this));
    qDebug() << indent << s1 << "=" << s2 << (s1 == s2);
    return new RetTypeBool(s1 == s2);
}

QPointer<RetType> KRuleVisitor::visitEParant(EParant *eparant) {
    return eparant->expr_->accept(this);
}

QPointer<RetType> KRuleVisitor::visitENot(ENot *enot) {
    return new RetTypeBool(!extractBool(enot->expr_->accept(this)));
}

QPointer<RetType> KRuleVisitor::visitEImpl(EImpl *eimpl) {
    const bool leftExpression = extractBool(eimpl->expr_1->accept(this));
    bool rtBool;
    if (leftExpression == true) {
        const bool rightExpression = extractBool(eimpl->expr_2->accept(this));
        rtBool = rightExpression == true;
    } else {
        rtBool = true;
    }
    return new RetTypeBool(rtBool);
}

QPointer<RetType> KRuleVisitor::visitEBEq(EBEq *eeq){
    const bool b1 = extractBool(eeq->expr_1->accept(this));
    const bool b2 = extractBool(eeq->expr_2->accept(this));
    return new RetTypeBool(b1 == b2);
}

QPointer<RetType> KRuleVisitor::visitEAnd(EAnd *eand) {
    const bool b1 = extractBool(eand->expr_1->accept(this));
    if (b1) {
        const bool b2 = extractBool(eand->expr_2->accept(this));
        return new RetTypeBool(b2);
    } else {
        return new RetTypeBool(false);
    }
}

QPointer<RetType> KRuleVisitor::visitEOr(EOr *eor) {
    const bool b1 = extractBool(eor->expr_1->accept(this));
    if (b1) {
        return new RetTypeBool(true);
    } else {
        const bool b2 = extractBool(eor->expr_2->accept(this));
        return new RetTypeBool(b2);
    }
}

QPointer<RetType> KRuleVisitor::visitEPQ(EPQ *epq) {
    return epq->pathquantifier_->accept(this);
}

/**
 * @brief KRuleVisitor::visitListRule Iterates over the defined rules.
 * @param listrule
 * @return
 */
QPointer<RetType> KRuleVisitor::visitListRule(ListRule* listrule) {
    for (ListRule::iterator i = listrule->begin() ; i != listrule->end() ; ++i) {
      (*i)->accept(this);
    }
    return new RetTypeBool(false);
}

QPointer<RetType> KRuleVisitor::visitListExpr(ListExpr* listexpr) {
    for (ListExpr::iterator i = listexpr->begin() ; i != listexpr->end() ; ++i) {
      (*i)->accept(this);
    }
    return new RetTypeBool(false);
}


QPointer<RetType> KRuleVisitor::visitInteger(Integer x) {
    return new RetTypeUInt((quint32)x);
}

QPointer<RetType> KRuleVisitor::visitString(String x) {
    return new RetTypeString(QString(x.c_str()));
}

QMap<QString, KRuleOutput*> KRuleVisitor::getFailures() {
    return failedRules;
}

void KRuleVisitor::assertType(const QPointer<RetType> &ret, RetType::RetTypeE type) {
    if (ret.isNull() || ret->getType() != type) {
        throw BadType();
    }
}

/**
 * @brief KRuleVisitor::extractBool Tries to extract boolean data from the provided RetType.
 *
 * Tries to extract boolean data from the provided RetType.
 * If this is successfull then the pointer will be deleted.
 * Else if this is not possible BadType will be thrown.
 *
 * @param ret The RetType to extract data from and finally delete.
 * @return The extracted boolean data.
 * @throws BadType if the provided RetType does not contain boolean data.
 */
const bool KRuleVisitor::extractBool(const QPointer<RetType> &ret) {
    assertType(ret, RetType::RetTypeE::RBool);
    const bool b = ((RetTypeBool*)ret.data())->getData();
    return b;
}

/**
 * @brief KRuleVisitor::extractQString Tries to extract QString data from the provided RetType.
 *
 * Tries to extract QString data from the provided RetType.
 * If this is successfull then the pointer will be deleted.
 * Else if this is not possible BadType will be thrown.
 *
 * @param ret The RetType to extract data from and finally delete.
 * @return The extracted QString data.
 * @throws BadType if the provided RetType does not contain QString data.
 */
const QString KRuleVisitor::extractQString(const QPointer<RetType> &ret) {
    assertType(ret, RetType::RetTypeE::RString);
    const QString str = ((RetTypeString*)ret.data())->getData();
    return str;
}

/**
 * @brief KRuleVisitor::extractUInt Tries to extract 32 bits unsigned integer data from the provided RetType.
 *
 * Tries to extract 32 bits unsigned integer data from the provided RetType.
 * If this is successfull then the pointer will be deleted.
 * Else if this is not possible BadType will be thrown.
 *
 * @param ret The RetType to extract data from and finally delete.
 * @return The extracted 32 bit unsigned integer.
 * @throws BadType if the provided RetType does not contain an integer.
 */
const quint32 KRuleVisitor::extractUInt(const QPointer<RetType> &ret) {
    assertType(ret, RetType::RetTypeE::RInt);
    const quint32 i = ((RetTypeUInt*)ret.data())->getData();
    return i;
}
