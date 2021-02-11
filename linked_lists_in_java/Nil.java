public class Nil implements ImmutableList {
    public Nil() {}

    public boolean equals(final Object other) {
        return other instanceof Nil;
    } // equals
    
    public String toString() {
        return "Nil";
    } // toString

    public int hashCode() {
        return 0;
    } // hashCode

    // sum stub
    public int sum() {
        return 0;
    }

    public boolean isEmpty() {
        return true;
    }

    // base case
    public int numSevens() {
        return 0;
    }

    // [].addAmount(5) // this: [] (Nil)
    public ImmutableList addAmount(int amount) {
        //return new Nil(); // works, but not the best

        return this;
    }
} // Nil
    
