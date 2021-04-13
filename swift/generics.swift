// A is a type variable (generic)
// Use of a type variable in data: generics
indirect enum MyList<A> {
  case Nils
  case Cons(A, MyList<A>)
}

// A is a type variable
// Use of a type variable in operations: parametric polymorphism; often gets folded
// into generics

indirect enum MyIntList {
  case Nils
  case Cons(Int, MyIntList)
}

/*
func filter(_ list: MyIntList, f: (Int) -> Bool) -> MyIntList { ... }


func filter<A>(_ list: MyList<A>, _ f: (A) -> Bool) -> MyList<A> { ... }


                               // -> MyList<A>
func qwerty<A>(_ list: MyList<A>) -> A { ... }


func fhrihflerafjebkehwfbkjb<A>(_ list: MyList<A>) -> Int { ... }
*/

func length<A>(_ list: MyList<A>) -> Int {
  switch list {
    case .Cons(_, let tail):
    return 1 + length(tail);
    case .Nils:
    return 0;
  }
}

let intList: MyList<Int> = MyList.Cons(1, MyList.Cons(2, MyList.Nils))
let stringList: MyList<String> =
  MyList.Cons("foo", MyList.Cons("bar", MyList.Cons("baz", MyList.Nils)))

print(length(intList))
print(length(stringList))

let tuple1: (Int, String, Bool) = (1, "foo", true) // 3-tuple
let tuple2: (Int, Int, Int) = (1, 2, 3) // 3-tuple
let tuple3: (String, Int, Int) = ("foo", 3, 4)
let tuple4: (String, Int) = ("blah", 17) // 2-tuple (pair)
let tuple5: (Int, (Int) -> Int) = (18, { x in x + 1 })
let tuple6: ((Int, Int), (String, Bool)) = ((3, 4), ("foo", true))

func tupleStuff(tup: (Int, Int)) -> (String, String) {
    let (x, y) = tup
    print(x)
    print(y)
    return ("foo", "bar")
}

tupleStuff(tup: (3, 4))

// let emptyTuple = ()

//func returnFunction() -> ((Int, String) -> String) { ... }

func funcTwo<A,B>(_ a: A, _ b: B) -> (A,B) {
  return (a,b);
}

let temp1: (Int, Int) = funcTwo(1, 2)
let temp2: (Int, String) = funcTwo(1, "foo")
let temp3: (Int, Int) = funcTwo(3, 4)

// C++-style of handling generics - specialize the generic definition
// per whatever types you work with
func funcTwo_int_int(_ a: Int, _ b: Int) -> (Int, Int) {
  return (a,b);
}

func funcTwo_int_string(_ a: Int, _ b: String) -> (Int, String) {
  return (a,b);
}

let temp1: (Int, Int) = funcTwo_int_int(1, 2)
let temp2: (Int, String) = funcTwo_int_string(1, "foo")
let temp3: (Int, Int) = funcTwo_int_int(3, 4)


// Java-style of handling generics - boxing

// public static <A, B> Pair<A, B> funcTwo(A a, B b) {
//   return new Pair(a, b);
// }
//
// Pair<Int, Int> temp1 = funcTwo(1, 2);
// Int temp1Int = temp1.firstValue;
//
//
// public static Pair funcTwo(Object a, Object b) {
//   return new Pair(a, b);
// }
//
// Pair temp1 = funcTwo(1, 2);
// Int temp1Int = (Int)temp1.firstValue;


// Rust - gives you control

// Go - no generics / parametric polymorphism
