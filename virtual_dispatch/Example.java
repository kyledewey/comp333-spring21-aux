// Program does some computation
// Need to know:
//   -Where should the output of the computation be written? (console / file)
//   -If writing to a file, which file?
//
public class Example {
    public static void doComputation(OutputDestination destination) {
        // does something

        int intermediateResult = ...;
        
        // print intermediate result
        // print it out
        destination.writeThing(intermediateResult);
    }

    public static OutputDestination makeDestination(boolean userWantsConsole,
                                                    String destinationFile) {
        if (userWantsConsole) {
            return new ConsoleDestination();
        } else {
            return new FileDestination(destinationFile);
        }
    }
    
    public static void main(String[] args) {
        // parsing command line arguments
        boolean userWantsConsole = doesUserWantConsole(args);
        String destinationFile = getDestinationFile(args);

        // do some computation
        OutputDestination destination = makeDestination(userWantsConsole,
                                                        destinationFile);
        int result = doComputation(destination);

        // print it out
        // virtual dispatch: runtime knows which method to call,
        // when at compile time it could be different methods
        destination.writeThing(result);

        // close it
        destination.close();
    }
}
