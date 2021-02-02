public class FileDestination implements OutputDestination {
    private FileOutputStream stream;

    public FileDestination(String destinationFile) {
        File file = new File(destinationFile);
        stream = new FileOutputStream(file);
    }

    public void writeThing(int thingToWrite) {
        stream.writeln(thingToWrite);
    }

    public void close() {
        stream.close();
    }
}
