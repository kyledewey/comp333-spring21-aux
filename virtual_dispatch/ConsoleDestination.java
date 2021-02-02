public class ConsoleDestination implements OutputDestination {
    public void writeThing(int thingToWrite) {
        System.out.println(thingToWrite);
    }

    public void close() {}
}
