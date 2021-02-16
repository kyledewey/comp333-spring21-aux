public class Cons implements ImmutableList {
    // ---BEGIN INSTANCE VARIABLES---
    public final int head;
    public final ImmutableList tail;
    // ---END INSTANCE VARIABLES---

    public Cons(final int head, final ImmutableList tail) {
        this.head = head;
        this.tail = tail;
    } // Cons

    public boolean equals(final Object other) {
        if (other instanceof Cons) {
            final Cons otherCons = (Cons)other;
            return head == otherCons.head && tail.equals(otherCons.tail);
        } else {
            return false;
        }
    } // equals
    
    public String toString() {
        return "Cons(" + head + ", " + tail.toString() + ")";
    } // toString

    public int hashCode() {
        return sum();
    } // hashCode

    // sum stub
    public int sum() {
        return 0;
    }

    public boolean isEmpty() {
        return false;
    }

    // int recursiveFunction(data) {
    //   if (data does something) {
    //      doBaseCase();
    //   } else {
    //      doRecursiveCase();
    //      recursiveFunction(smallerData);
    //   }
    // }

    // recursive case
    // [1, 2, 3].numSevens() // `this` refers to whole list
    public int numSevens() {
        // infinite recursion
        // numSevens(); // implicitly `this`.numSevens()

        // C++ version: tail->numSevens()
        int numSevensInRest = tail.numSevens(); // will eventually terminate
        
        if (head == 7) {
            // add 1
            return numSevensInRest + 1;
        } else {
            // don't add 1
            return numSevensInRest;
        }
    }

    // [1, 2, 3].addAmount(4) // returns: [5, 6, 7]
    public ImmutableList addAmount(int amount) {
        // recursive case
        // this: ImmutableList
        // this.addAmount(...);
        // addAmount(...);
        // tail: ImmutableList ([2, 3])

        // [2, 3].addAmount(4) // rest: [6, 7]
        ImmutableList rest = tail.addAmount(amount);

        // target return value: [5, 6, 7]
        // amount: 4
        // head: 1
        int newValueHere = amount + head;

        return new Cons(newValueHere, rest);
    }

    // shorter version
    // public ImmutableList addAmount(int amount) {
    //     return new Cons(amount + head, tail.addAmount(amount));
    // }

    public static int addFive(int x) { return x + 5; }
    public static String addFive(String x) { return x + 5; }


    // [3, 1, 4, 2].valuesGreaterThanAmount(2); // [3, 4]
    // [3, 1, 4, 2].valuesGreaterThanAmount(5); // []
    // [3, 1, 4, 2].valuesGreaterThanAmount(0); // [3, 1, 4, 2]
    public ImmutableList valuesGreaterThanAmount(int amount) {
        // this: Cons
        // head: 3
        // tail: [1, 4, 2]
        // amount: 2

        // rest: [4]
        // return value: [3, 4]
        ImmutableList rest = tail.valuesGreaterThanAmount(amount);
        
        if (head > amount) {
            // do one thing
            //ImmutableList newList = new Cons(3, rest); // [3, 4]
            return new Cons(head, rest);
        } else {
            // do another thing
            return rest;
        }
    }
} // Cons
