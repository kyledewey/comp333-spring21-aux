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

// in JavaScript:
// let addFive = a => a + 5;
// "in" (Swift) does the same thing as "=>" (JavaScript)
//let addFive: (Int) -> Int = { a in a + 5 }

//let addFive = { a in a + 5 }
//print(addFive(2))

// in JavaScript:
// let returnsParameter = a => a
let returnsParameter: (Int) -> Int = { a in a }
//print(returnsParameter(5))


let b = false

if b {
    //print("hi")
} else {
    //print("bye")
}

// function addAmount(amount) {
//   return x => x + amount
// }

func addAmount(amount: Int) -> (Int) -> Int {
  // memory allocated:
  // - space for an integer (amount)
  // - space for a function pointer
  return { x in amount + x }
}

let addFive: (Int) -> Int = addAmount(amount: 5)
let addThree = addAmount(amount: 3)

print(addFive(2))
print(addThree(3))
