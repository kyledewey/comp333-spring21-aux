// Program does some computation
// Need to know:
//   -Where should the output of the computation be written? (console / file)
//   -If writing to a file, which file?
//
public class Example {
    public static void writeThing(boolean userWantsConsole,
                                  String destinationFile,
                                  int thingToWrite) {
        if (userWantsConsole) {
            System.out.println(thingToWrite);
        } else {
            File file = new File(destinationFile);
            FileOutputStream stream = new FileOutputStream(file);
            stream.writeln(intermediateResult);
            stream.close();
        }
    }
    
    public static void doComputation(boolean userWantsConsole,
                                     String destinationFile) {
        // does something

        int intermediateResult = ...;
        
        // print intermediate result
        // print it out
        writeThing(userWantsConsole,
                   destinationFile,
                   intermediateResult);
    }
    
    public static void main(String[] args) {
        // parsing command line arguments
        boolean userWantsConsole = doesUserWantConsole(args);
        String destinationFile = getDestinationFile(args);

        // do some computation
        int result = doComputation(userWantsConsole,
                                   destinationFile);

        // print it out
        writeThing(userWantsConsole,
                   destinationFile,
                   result);
    }
}
