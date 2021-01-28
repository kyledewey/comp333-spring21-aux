// Program does some computation
// Need to know:
//   -Where should the output of the computation be written? (console / file)
//   -If writing to a file, which file?
//
public class Example {
    public static void doComputation() {
        // does something

        int intermediateResult = ...;
        
        // print intermediate result
        // print it out
        if (userWantsConsole) {
            System.out.println(intermediateResult);
        } else {
            File file = new File(destinationFile);
            FileOutputStream stream = new FileOutputStream(file);
            stream.writeln(intermediateResult);
            stream.close();
        }
    }
    
    public static void main(String[] args) {
        // parsing command line arguments
        boolean userWantsConsole = doesUserWantConsole(args);
        String destinationFile = getDestinationFile(args);

        // do some computation
        int result = doComputation();

        // print it out
        if (userWantsConsole) {
            System.out.println(result);
        } else {
            File file = new File(destinationFile);
            FileOutputStream stream = new FileOutputStream(file);
            stream.writeln(result);
            stream.close();
        }
    }
}
