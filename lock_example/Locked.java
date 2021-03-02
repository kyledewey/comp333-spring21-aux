public class Locked implements Lock {
    public Locked() {}
    
    public Lock unlock() {
        System.out.println("lock unlocked");
        return new Unlocked();
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
