// algebraic data type
// common to functional programming languages

// type MyType = Constructor1 | Constructor2

// type Bool = true | false

let b: Bool = true

// NOT ALGEBRAIC DATA TYPES:
// class Bool
// class True extends Bool
// class False extends Bool

let b2: Bool = 5 < 2

if b2 {
    //print("true")
} else {
    //print("false")
}

// type StoplightColor = Red | Green | Yellow
// specific to booleans: if/else
// in general: pattern matching

enum StoplightColor {
    case red
    case green
    case yellow
}

let color: StoplightColor = StoplightColor.red

switch color {
case .red:
  print("red")
case .green:
  print("green")
case .yellow:
  print("yellow")
}

indirect enum IntegerList {
    case Nil
    case Cons(Int, IntegerList)
}

let list: IntegerList = IntegerList.Cons(1, IntegerList.Cons(2, IntegerList.Nil))

switch list {
    case .Cons(let head, let tail):
      print(head)
    case .Nil:
      print("EMPTY")
}

