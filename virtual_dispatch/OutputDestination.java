public class OutputDestination {
    private FileOutputStream stream;

    public OutputDestination(boolean userWantsConsole,
                             String destinationFile) {
        if (!userWantsConsole) {
            File file = new File(destinationFile);
            stream = new FileOutputStream(file);
        } else {
            stream = null;
        }
    }

    public void writeThing(int thingToWrite) {
        if (userWantsConsole) {
            System.out.println(thingToWrite);
        } else {
            stream.writeln(thingToWrite);
        }
    }

    public void close() {
        if (stream != null) {
            stream.close();
        }
    }
}
