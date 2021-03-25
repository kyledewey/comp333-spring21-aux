// "purely functional language" - no mutable state.  Period.
// Example: Haskell (uses global type inference)
//
// add: (a: Number) => a -> a -> a
// add x y = x + y
//
// Why Swift?
// - Popular
// - Coherent

// Swift: type inference
// x: Int = Int + Int
// let: declare a constant
// var: declare a regular variable
//
// Scala (type inference is WONKY)
//
let x = 1 + 2

// Java syntax:
// public static int getFirstArgument(int x, String y) { return x; }

// Swift: local type inference
func getFirstArgument(first: Int, second: String) -> Int {
    return x
}

// getFirstArgument(3, "foo") // INVALID
getFirstArgument(first: 3, second: "foo")

func getSecondArgument(_ first: Int, second: String) -> String {
    return second
}

getSecondArgument(4, second: "bar")

func blah(x: Int) -> Int { return x }
func blah(y: Int) -> Int { return y }

blah(x: 5)
blah(y: 7)
