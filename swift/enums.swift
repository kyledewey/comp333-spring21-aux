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

enum MyBool {
    case no
    case yes
}

/*
if true {
    print("it's true")
} else {
    print("it's false")
}*/

// "totality checking" - program guaranteed to terminate with an answer
// "exhaustivity checking" - making sure all cases are covered

switch MyBool.yes {
    case .no:
        print("it's anything else");

    case .yes: // dead code
        print("it's true");
}

func takesABool(b: MyBool) {}

// Java:
// public class Node {
//   Node left;
//   int value;
//   Node right;
//
//  // null represents a leaf node
// }


// indirect: needed whenever we have a recursively-defined type
// (i.e., IntBinaryTree here is used to define IntBinaryTree)
indirect enum IntBinaryTree {
    case LeafNode
    case InternalNode(IntBinaryTree, Int, IntBinaryTree)
}

//      5
//    /  \
//   X    X
let tree1 = IntBinaryTree.InternalNode(IntBinaryTree.LeafNode,
                                       5,
                                       IntBinaryTree.LeafNode)

//    7
//   / \
//  X   3
//     /  \
//     X  X
let tree2 = IntBinaryTree.InternalNode(IntBinaryTree.LeafNode,
                                       7,
                                       IntBinaryTree.InternalNode(IntBinaryTree.LeafNode,
                                                                  3,
                                                                  IntBinaryTree.LeafNode))

indirect enum MyList {
  case Nils
  case Cons(Int, MyList)
}

// []
let emptyList = MyList.Nils
// [0]
let justZero = MyList.Cons(0, MyList.Nils)
// [1, 2, 3]
let list1 = MyList.Cons(1, MyList.Cons(2, MyList.Cons(3, MyList.Nils)));

let something: MyList? = nil

// x: Object OR null
// Object x = ...;

switch list1 {
    case .Cons(1, .Cons(2, let tail)):
        print("it's a list starting with 1, followed by 2")
    case .Cons(1, _):
        print("it's cons starting with 1")
    case .Cons(_, _):
        print("it's a cons not starting with 1")
    case .Nils:
        print("it's empty")
}
