module lex

/*
mydir:
 - mysubdir:
    - https://myurl.domain/file as myfile
*/
enum Tokens {
	Identifier // any word
	DoubleDot  // :
	Tire       // -
	String     // string, starts with " and ends with "
	As         // this will change basename, like a as b
	Unknown    // unknown token(not wanted)
	Eol        // end of line
}

pub struct Token {
	token  Tokens
	ctx    string
	line   int
	column int
}

pub fn tokenize(ctx string) []Token {
	mut tokens = []Token{}

	return tokens
}

