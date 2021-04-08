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
