public class Unlocked implements Lock {
    public static final Unlocked UNLOCKED_STATE = new Unlocked();
    
    private Unlocked() {}

    public Lock lock() {
        System.out.println("lock locked");
        return Locked.LOCKED_STATE;
    }
    
    public Lock unlock() {
        System.out.println("lock already unlocked");
        return this;
    }
    
    public boolean isLocked() {
        return false;
    }
}
