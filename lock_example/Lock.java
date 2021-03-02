// Lock (abstract class / interface)
//   - Locked
//   - Unlocked
public interface Lock {
    public Lock unlock();
    public Lock lock();
    public boolean isLocked();
}
