public class Unlocked implements Lock {
    public Unlocked() {}

    public Lock lock() {
        System.out.println("lock locked");
        return new Locked();
    }
    
    public Lock unlock() {
        System.out.println("lock already unlocked");
        return this;
    }
    
    public boolean isLocked() {
        return false;
    }
}
