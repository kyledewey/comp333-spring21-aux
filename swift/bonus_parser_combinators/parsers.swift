// digit ::= `0` | `1` | `2` | `3` | `4` | `5` | `6` | `7` | `8` | `9`
// integer ::= digit | digit integer

enum Token {
    case zero; case one; case two; case three; case four; case five; case six; case seven; case eight; case nine;
}

typealias Digit = Token;

extension Token {
    func toString() -> String {
        switch self {
            case .zero: return "0"
            case .one: return "1"
            case .two: return "2"
            case .three: return "3"
            case .four: return "4"
            case .five: return "5"
            case .six: return "6"
            case .seven: return "7"
            case .eight: return "8"
            case .nine: return "9"
        }
    }
}

indirect enum List<A> {
    case empty
    case cons(A, List<A>)
}

enum ParseResult<A> {
    case success(A, List<Token>)
    case failure(String)
}

typealias Parser<A> = (List<Token>) -> ParseResult<A>;


// - Parse a single token
func tokenParser(_ expectedToken: Token) -> Parser<Token> {
    return { tokens in
      switch tokens {
          case .cons(let receivedToken, let tail):
            if expectedToken == receivedToken {
                return ParseResult.success(receivedToken, tail)
            } else {
                return ParseResult.failure("expected " + expectedToken.toString() + " got " + receivedToken.toString())
            }
          case .empty:
            return ParseResult.failure("expected " + expectedToken.toString() + " got empty tokens")
      }
    }
}

/*
let parseOne = tokenParser(Token.one)
print(parseOne(List.cons(Token.one, List.empty)))
print(parseOne(List.cons(Token.two, List.empty)))
print(parseOne(List.empty))
*/

// - Parse one thing followed by another
func parseAnd<A, B>(_ first: @escaping @autoclosure () -> Parser<A>,
                    _ second: @escaping @autoclosure () -> Parser<B>) -> Parser<(A, B)> {
    return { tokens in
      switch first()(tokens) {
          case .success(let a, let rest):
            switch second()(rest) {
                case .success(let b, let finalRest):
                    return ParseResult.success((a, b), finalRest)
                case .failure(let error):
                    return ParseResult.failure(error)
            }
          case .failure(let error):
            return ParseResult.failure(error)
      }
    }
}

/*
let parseOneAndTwo = parseAnd(tokenParser(Token.one), tokenParser(Token.two))
print(parseOneAndTwo(List.cons(Token.one, List.cons(Token.two, List.empty)))) // [1, 2]
print(parseOneAndTwo(List.cons(Token.two, List.cons(Token.one, List.empty)))) // [2, 1]
print(parseOneAndTwo(List.cons(Token.one, List.empty))) // [1]
*/


// - Parse one thing OR another thing
func parseOr<A>(_ first: @escaping @autoclosure () -> Parser<A>,
                _ second: @escaping @autoclosure () -> Parser<A>) -> Parser<A> {
    return { tokens in
        switch first()(tokens) {
            case .success(let a, let rest):
                return ParseResult.success(a, rest)
            case .failure(_):
                return second()(tokens)
        }
    }
}

/*
let parseOneOrTwo = parseOr(tokenParser(Token.one), tokenParser(Token.two))
print(parseOneOrTwo(List.cons(Token.one, List.empty))) // [1]
print(parseOneOrTwo(List.cons(Token.two, List.empty))) // [2]
print(parseOneOrTwo(List.cons(Token.three, List.empty))) // [3]
*/

// - Define production rule

// digit ::= `0` | `1` | `2` | `3` | `4` | `5` | `6` | `7` | `8` | `9`
func parseDigit() -> Parser<Digit> {
    return parseOr(tokenParser(Token.zero),
    parseOr(tokenParser(Token.one),
    parseOr(tokenParser(Token.two),
    parseOr(tokenParser(Token.three),
    parseOr(tokenParser(Token.four),
    parseOr(tokenParser(Token.five),
    parseOr(tokenParser(Token.six),
    parseOr(tokenParser(Token.seven),
    parseOr(tokenParser(Token.eight),
            tokenParser(Token.nine))))))))))
}

/*
let digitParser = parseDigit()
print(digitParser(List.cons(Token.one, List.cons(Token.two, List.empty))))
*/

func parseMap<A, B>(_ parser: @escaping @autoclosure () -> Parser<A>,
                    _ f: @escaping (A) -> B) -> Parser<B> {
    return { tokens in 
        switch (parser())(tokens) {
            case .success(let a, let rest):
                return ParseResult.success(f(a), rest)
            case .failure(let error):
                return ParseResult.failure(error)
        }
    }
}

/*
let parseMapTest = parseMap(tokenParser(Token.one), { token in token.toString() })
print(parseMapTest(List.cons(Token.one, List.empty)))
*/

// integer ::= digit | digit integer // ORIGINAL
// integer ::= digit integer | digit // REWRITTEN
func parseDigits() -> Parser<List<Digit>> {
    return parseOr(parseMap(parseAnd(parseDigit(), parseDigits()),
                            { pair in
                              let (digit, digits) = pair
                              return List.cons(digit, digits) }),
                   parseMap(parseDigit(),
                            { digit in
                              return List.cons(digit, List.empty) }))
    // parseDigit(): Digit
    // want: convert Parser<Digit> -> Parser<List<Digit>>
    // parseAnd(parseDigit(), parseDigits()): List<Digit> // WANT
    // parseAnd(parseDigit(), parseDigits()): (Digit, List<Digit>)
}

let parseDigitsTest = parseDigits()
print(parseDigitsTest(List.cons(Token.one, List.cons(Token.two, List.cons(Token.three, List.empty)))))

/*
func parseInteger() -> Parser<Int> {
    return parseMap(parseDigits(), { digits in ... })
}
 */
