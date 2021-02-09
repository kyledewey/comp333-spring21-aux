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
} // ImmutableList
