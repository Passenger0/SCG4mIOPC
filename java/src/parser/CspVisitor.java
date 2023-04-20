package parser;
// Generated from Csp.g4 by ANTLR 4.9
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link CspParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface CspVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link CspParser#spec}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSpec(CspParser.SpecContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#definition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDefinition(CspParser.DefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#channelDecl}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitChannelDecl(CspParser.ChannelDeclContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#channelNames}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitChannelNames(CspParser.ChannelNamesContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#channelColonType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitChannelColonType(CspParser.ChannelColonTypeContext ctx);
	/**
	 * Visit a parse tree produced by the {@code DEF}
	 * labeled alternative in {@link CspParser#simpleDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDEF(CspParser.DEFContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#assertDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssertDefinition(CspParser.AssertDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#definitionLeft}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDefinitionLeft(CspParser.DefinitionLeftContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#defnCallLeft}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDefnCallLeft(CspParser.DefnCallLeftContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#any}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAny(CspParser.AnyContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#checkConditionBody}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCheckConditionBody(CspParser.CheckConditionBodyContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#modelCheckType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitModelCheckType(CspParser.ModelCheckTypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#type}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitType(CspParser.TypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#simple}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSimple(CspParser.SimpleContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#set}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSet(CspParser.SetContext ctx);
	/**
	 * Visit a parse tree produced by the {@code INTR}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitINTR(CspParser.INTRContext ctx);
	/**
	 * Visit a parse tree produced by the {@code Stop}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStop(CspParser.StopContext ctx);
	/**
	 * Visit a parse tree produced by the {@code SEMICOL}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSEMICOL(CspParser.SEMICOLContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ARROW}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitARROW(CspParser.ARROWContext ctx);
	/**
	 * Visit a parse tree produced by the {@code Bool}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBool(CspParser.BoolContext ctx);
	/**
	 * Visit a parse tree produced by the {@code GUARD}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGUARD(CspParser.GUARDContext ctx);
	/**
	 * Visit a parse tree produced by the {@code BACKSLASH}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBACKSLASH(CspParser.BACKSLASHContext ctx);
	/**
	 * Visit a parse tree produced by the {@code Skip}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSkip(CspParser.SkipContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ECHOICE}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitECHOICE(CspParser.ECHOICEContext ctx);
	/**
	 * Visit a parse tree produced by the {@code End}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEnd(CspParser.EndContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ID}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitID(CspParser.IDContext ctx);
	/**
	 * Visit a parse tree produced by the {@code TIMEOUT}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTIMEOUT(CspParser.TIMEOUTContext ctx);
	/**
	 * Visit a parse tree produced by the {@code Sync}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSync(CspParser.SyncContext ctx);
	/**
	 * Visit a parse tree produced by the {@code PARALL}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPARALL(CspParser.PARALLContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ICHOICE}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitICHOICE(CspParser.ICHOICEContext ctx);
	/**
	 * Visit a parse tree produced by the {@code Paren}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParen(CspParser.ParenContext ctx);
	/**
	 * Visit a parse tree produced by the {@code INTL}
	 * labeled alternative in {@link CspParser#proc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitINTL(CspParser.INTLContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#boolExp}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBoolExp(CspParser.BoolExpContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#boolOrAmb}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBoolOrAmb(CspParser.BoolOrAmbContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr(CspParser.ExprContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#number}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNumber(CspParser.NumberContext ctx);
	/**
	 * Visit a parse tree produced by {@link CspParser#comment}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitComment(CspParser.CommentContext ctx);
	/**
	 * Visit a parse tree produced by the {@code Catch}
	 * labeled alternative in {@link CspParser#event}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCatch(CspParser.CatchContext ctx);
	/**
	 * Visit a parse tree produced by the {@code Send}
	 * labeled alternative in {@link CspParser#event}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSend(CspParser.SendContext ctx);
}