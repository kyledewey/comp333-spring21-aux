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
} // Cons
