public interface ImmutableList {
    public boolean equals(final Object other);
    public int length();
    public int sum(); // empty list sum is defined as 0
    public ImmutableList append(final ImmutableList other);
    public boolean contains(final int value);
    public String toString();
    public int hashCode();

    public boolean isEmpty();

    // [7, 2, 4, 7, 1].numSevens() // 2
    // [1, 2, 3].numSevens()       // 0
    // [7, 7, 7, 8].numSevens()    // 3
    public int numSevens();

    // [].addAmount(1) // returns: []
    // [0].addAmount(1) // returns: [1]
    // [1, 2, 3].addAmount(4) // returns: [5, 6, 7]
    public ImmutableList addAmount(int amount);


    // [3, 1, 4, 2].valuesGreaterThanAmount(2); // [3, 4]
    // [3, 1, 4, 2].valuesGreaterThanAmount(5); // []
    // [3, 1, 4, 2].valuesGreaterThanAmount(0); // [3, 1, 4, 2]
    // [].valuesGreaterThanAmount(0);           // []
    public ImmutableList valuesGreaterThanAmount(int amount);
} // ImmutableList
