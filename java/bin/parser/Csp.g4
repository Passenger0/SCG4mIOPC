grammar Csp;

spec
	: definition*
	;

definition
	: channelDecl
	| simpleDefinition // 我们的就是这个
	| assertDefinition
	| comment
	;
	
channelDecl
	: CHANNEL channelNames (channelColonType)? 
	;
	
channelNames											//it should return a  list (check this in the antlr book)
	: ID(COMMA ID)* 									//stores the IDs in a list (field)
	;
	
channelColonType										//it should return the type
	: COLLON  type	
	;
	
simpleDefinition
	: definitionLeft EQUAL any # DEFINITION // 这个就是A() = xxx那个形式，全文搜索关键字都可以找到
	;

assertDefinition
	: ASSERT definitionLeft COLLON LBRACKET checkConditionBody RBRACKET
	;
	
definitionLeft
	: defnCallLeft
	| defnCallLeft LPAREN any* RPAREN	
	;
	
defnCallLeft
	: ID
 	;

any 
	: proc // 我们的any一般就是proc，下面有proc的定义
	| boolExp
	| expr
	;
		
checkConditionBody
	: DEADLOCK FREE modelCheckType?
	| DIVERGENCE FREE modelCheckType?
	| DETERMINISTIC modelCheckType?
	;
	
modelCheckType
	: FAILUREDIVE
	| FAILURE
	| TRACE
	;
	
type
	: simple
	| type DOT type
	| set
	;

simple		//TODO: expand this rule
	: ID
	;
	
set										//TODO: expand this rule
	: LBRACE any* RBRACE
	;
	
proc									//TODO: came from rule _proc (try to make union of rules _proc and amb)
	: Skip # Skip								// SKIP和STOP本身都是proc的一种
	| Stop # Stop
	| proc ARROW proc # ARROW	//TODO:  A -> B,原本是event ARROW proc,但是这是错误的，在某些情况下不适用，如(A[]B -> SKIP)
	| proc ECHOICE proc # ECHOICE // A [] B
	| proc PARALL proc # PARALL // A || B
	| proc ICHOICE proc # ICHOICE
	| proc INTL proc # INTL
	| IF boolExp THEN proc ELSE proc # Bool	//TODO: revise
	| boolExp GUARD proc # GUARD
	| proc BACKSLASH set # BACKSLASH
	| proc LSYNC set RSYNC proc # Sync
	| proc TIMEOUT proc	# TIMEOUT					//timeout operator
	| proc INTR proc # INTR					//interrupt operator
	| proc SEMICOL proc	# SEMICOL				//sequential composition A; B
	| LPAREN proc RPAREN # Paren
	| event # ID							//TODO: revise
	| proc SEMICOL # End
	;
		

boolExp										//boolean expressions
	: NOT boolOrAmb
	| expr (LT | GT | LTEQ | GTEQ) expr
	| expr (EQ | NEQ) expr 
	| boolExp  (AND | OR) boolExp
	| TRUE
	| FALSE
	| ID
	| number
	;

boolOrAmb
	: boolExp
	| simple
	;
	
expr										//arith expressions
	: MINUS expr
	| expr MOD expr
	| expr (TIMES | DIV) expr
	| expr (PLUS | MINUS) expr
	| LPAREN expr RPAREN
	| number
	| ID	
	;
	
number
   : DIGIT+
   ;

comment	
	: LINECOMMENT	//TODO: include multiline comment and return the text of comment
	;

event
	: ID QUERY ID # Catch
	| ID PLING ID # Send
	;

AND : 'and';
OR  : 'or' ;
EQ	: '==';
NEQ : '!=';
LT	: '<';
GT	: '>';
LTEQ	: '<=';
GTEQ	: '>=';
NOT	: 'not';
PLUS	: '+';
TIMES	: '*';	
MINUS	: '-';
DIV		: '/';
MOD	: '%';
IF : 'if' ;
THEN : 'then' ;
ELSE : 'else' ;
Skip : 'SKIP' ;
Stop : 'STOP' ;
DIVERGE : 'div' ;
TRUE : 'true' ;
FALSE : 'false' ;
GUARD : '&' ;
LPAREN : '(' ;
RPAREN : ')' ;
LBRACKET: '[';
RBRACKET: ']';
LSYNC : '[|' ;
RSYNC : '|]' ;
INTL :	'|||';
ECHOICE :	'[]';
PARALL : '||';
ICHOICE :	'|~|';
COMMA	:	',';
COLLON	:	':';
SEMICOL	:	';';
ARROW	:	'->';
QUERY	:	'?';
PLING	:	'!';
CHANNEL	:	'channel';
DOT	:	'.';
LBRACE	: '{';
RBRACE	: '}';
EQUAL	: '=';
BACKSLASH : '\\';
TIMEOUT	: '[>';
INTR	: '/\\';
ASSERT : 'assert';
DEADLOCK : 'deadlock';
DETERMINISTIC : 'deterministic';
DIVERGENCE : 'divergence';
FAILUREDIVE : ' [FD]';
FAILURE : ' [F]';
TRACE: ' [T]';
FREE: ' free';


DIGIT
   : ('0' .. '9')
   ;
ID : [a-zA-Z]+					//TODO: revise - ids do not allow numbers or special chars
	;

LINECOMMENT
    : ('--') ~('\r'|'\n')* -> channel (HIDDEN)
    ;
	
WS
   : [ \r\n\t]+ -> channel (HIDDEN)
   ;