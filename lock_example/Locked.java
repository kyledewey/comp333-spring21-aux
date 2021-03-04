public class Locked implements Lock {
    public static final Locked LOCKED_STATE = new Locked();
    
    private Locked() {}
    
    public Lock unlock() {
        System.out.println("lock unlocked");
        return Unlocked.UNLOCKED_STATE;
    }

    // Lock myLock = new Locked();
    // Lock otherLock = myLock.lock();
    //                  this: myLock
    public Lock lock() {
        System.out.println("lock already locked");
        return this;
    }

    public boolean isLocked() {
        return true;
    }
}
