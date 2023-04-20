package parser;
// Generated from Csp.g4 by ANTLR 4.9
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link CspParser}.
 */
public interface CspListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link CspParser#spec}.
	 * @param ctx the parse tree
	 */
	void enterSpec(CspParser.SpecContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#spec}.
	 * @param ctx the parse tree
	 */
	void exitSpec(CspParser.SpecContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#definition}.
	 * @param ctx the parse tree
	 */
	void enterDefinition(CspParser.DefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#definition}.
	 * @param ctx the parse tree
	 */
	void exitDefinition(CspParser.DefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#channelDecl}.
	 * @param ctx the parse tree
	 */
	void enterChannelDecl(CspParser.ChannelDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#channelDecl}.
	 * @param ctx the parse tree
	 */
	void exitChannelDecl(CspParser.ChannelDeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#channelNames}.
	 * @param ctx the parse tree
	 */
	void enterChannelNames(CspParser.ChannelNamesContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#channelNames}.
	 * @param ctx the parse tree
	 */
	void exitChannelNames(CspParser.ChannelNamesContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#channelColonType}.
	 * @param ctx the parse tree
	 */
	void enterChannelColonType(CspParser.ChannelColonTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#channelColonType}.
	 * @param ctx the parse tree
	 */
	void exitChannelColonType(CspParser.ChannelColonTypeContext ctx);
	/**
	 * Enter a parse tree produced by the {@code DEF}
	 * labeled alternative in {@link CspParser#simpleDefinition}.
	 * @param ctx the parse tree
	 */
	void enterDEF(CspParser.DEFContext ctx);
	/**
	 * Exit a parse tree produced by the {@code DEF}
	 * labeled alternative in {@link CspParser#simpleDefinition}.
	 * @param ctx the parse tree
	 */
	void exitDEF(CspParser.DEFContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#assertDefinition}.
	 * @param ctx the parse tree
	 */
	void enterAssertDefinition(CspParser.AssertDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#assertDefinition}.
	 * @param ctx the parse tree
	 */
	void exitAssertDefinition(CspParser.AssertDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#definitionLeft}.
	 * @param ctx the parse tree
	 */
	void enterDefinitionLeft(CspParser.DefinitionLeftContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#definitionLeft}.
	 * @param ctx the parse tree
	 */
	void exitDefinitionLeft(CspParser.DefinitionLeftContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#defnCallLeft}.
	 * @param ctx the parse tree
	 */
	void enterDefnCallLeft(CspParser.DefnCallLeftContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#defnCallLeft}.
	 * @param ctx the parse tree
	 */
	void exitDefnCallLeft(CspParser.DefnCallLeftContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#any}.
	 * @param ctx the parse tree
	 */
	void enterAny(CspParser.AnyContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#any}.
	 * @param ctx the parse tree
	 */
	void exitAny(CspParser.AnyContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#checkConditionBody}.
	 * @param ctx the parse tree
	 */
	void enterCheckConditionBody(CspParser.CheckConditionBodyContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#checkConditionBody}.
	 * @param ctx the parse tree
	 */
	void exitCheckConditionBody(CspParser.CheckConditionBodyContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#modelCheckType}.
	 * @param ctx the parse tree
	 */
	void enterModelCheckType(CspParser.ModelCheckTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#modelCheckType}.
	 * @param ctx the parse tree
	 */
	void exitModelCheckType(CspParser.ModelCheckTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#type}.
	 * @param ctx the parse tree
	 */
	void enterType(CspParser.TypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#type}.
	 * @param ctx the parse tree
	 */
	void exitType(CspParser.TypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#simple}.
	 * @param ctx the parse tree
	 */
	void enterSimple(CspParser.SimpleContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#simple}.
	 * @param ctx the parse tree
	 */
	void exitSimple(CspParser.SimpleContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#set}.
	 * @param ctx the parse tree
	 */
	void enterSet(CspParser.SetContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#set}.
	 * @param ctx the parse tree
	 */
	void exitSet(CspParser.SetContext ctx);
	/**
	 * Enter a parse tree produced by the {@code INTR}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void enterINTR(CspParser.INTRContext ctx);
	/**
	 * Exit a parse tree produced by the {@code INTR}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void exitINTR(CspParser.INTRContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Stop}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void enterStop(CspParser.StopContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Stop}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void exitStop(CspParser.StopContext ctx);
	/**
	 * Enter a parse tree produced by the {@code SEMICOL}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void enterSEMICOL(CspParser.SEMICOLContext ctx);
	/**
	 * Exit a parse tree produced by the {@code SEMICOL}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void exitSEMICOL(CspParser.SEMICOLContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ARROW}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void enterARROW(CspParser.ARROWContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ARROW}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void exitARROW(CspParser.ARROWContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Bool}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void enterBool(CspParser.BoolContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Bool}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void exitBool(CspParser.BoolContext ctx);
	/**
	 * Enter a parse tree produced by the {@code GUARD}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void enterGUARD(CspParser.GUARDContext ctx);
	/**
	 * Exit a parse tree produced by the {@code GUARD}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void exitGUARD(CspParser.GUARDContext ctx);
	/**
	 * Enter a parse tree produced by the {@code BACKSLASH}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void enterBACKSLASH(CspParser.BACKSLASHContext ctx);
	/**
	 * Exit a parse tree produced by the {@code BACKSLASH}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void exitBACKSLASH(CspParser.BACKSLASHContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Skip}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void enterSkip(CspParser.SkipContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Skip}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void exitSkip(CspParser.SkipContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ECHOICE}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void enterECHOICE(CspParser.ECHOICEContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ECHOICE}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void exitECHOICE(CspParser.ECHOICEContext ctx);
	/**
	 * Enter a parse tree produced by the {@code End}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void enterEnd(CspParser.EndContext ctx);
	/**
	 * Exit a parse tree produced by the {@code End}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void exitEnd(CspParser.EndContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ID}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void enterID(CspParser.IDContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ID}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void exitID(CspParser.IDContext ctx);
	/**
	 * Enter a parse tree produced by the {@code TIMEOUT}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void enterTIMEOUT(CspParser.TIMEOUTContext ctx);
	/**
	 * Exit a parse tree produced by the {@code TIMEOUT}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void exitTIMEOUT(CspParser.TIMEOUTContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Sync}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void enterSync(CspParser.SyncContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Sync}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void exitSync(CspParser.SyncContext ctx);
	/**
	 * Enter a parse tree produced by the {@code PARALL}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void enterPARALL(CspParser.PARALLContext ctx);
	/**
	 * Exit a parse tree produced by the {@code PARALL}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void exitPARALL(CspParser.PARALLContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ICHOICE}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void enterICHOICE(CspParser.ICHOICEContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ICHOICE}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void exitICHOICE(CspParser.ICHOICEContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Paren}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void enterParen(CspParser.ParenContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Paren}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void exitParen(CspParser.ParenContext ctx);
	/**
	 * Enter a parse tree produced by the {@code INTL}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void enterINTL(CspParser.INTLContext ctx);
	/**
	 * Exit a parse tree produced by the {@code INTL}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 */
	void exitINTL(CspParser.INTLContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#boolExp}.
	 * @param ctx the parse tree
	 */
	void enterBoolExp(CspParser.BoolExpContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#boolExp}.
	 * @param ctx the parse tree
	 */
	void exitBoolExp(CspParser.BoolExpContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#boolOrAmb}.
	 * @param ctx the parse tree
	 */
	void enterBoolOrAmb(CspParser.BoolOrAmbContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#boolOrAmb}.
	 * @param ctx the parse tree
	 */
	void exitBoolOrAmb(CspParser.BoolOrAmbContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExpr(CspParser.ExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExpr(CspParser.ExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#number}.
	 * @param ctx the parse tree
	 */
	void enterNumber(CspParser.NumberContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#number}.
	 * @param ctx the parse tree
	 */
	void exitNumber(CspParser.NumberContext ctx);
	/**
	 * Enter a parse tree produced by {@link CspParser#comment}.
	 * @param ctx the parse tree
	 */
	void enterComment(CspParser.CommentContext ctx);
	/**
	 * Exit a parse tree produced by {@link CspParser#comment}.
	 * @param ctx the parse tree
	 */
	void exitComment(CspParser.CommentContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Catch}
	 * labeled alternative in {@link CspParser#event}.
	 * @param ctx the parse tree
	 */
	void enterCatch(CspParser.CatchContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Catch}
	 * labeled alternative in {@link CspParser#event}.
	 * @param ctx the parse tree
	 */
	void exitCatch(CspParser.CatchContext ctx);
	/**
	 * Enter a parse tree produced by the {@code Send}
	 * labeled alternative in {@link CspParser#event}.
	 * @param ctx the parse tree
	 */
	void enterSend(CspParser.SendContext ctx);
	/**
	 * Exit a parse tree produced by the {@code Send}
	 * labeled alternative in {@link CspParser#event}.
	 * @param ctx the parse tree
	 */
	void exitSend(CspParser.SendContext ctx);
}