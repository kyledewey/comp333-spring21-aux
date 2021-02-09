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

    // ---begin method overloading---
    //
    // virtual dispatch: determination done at runtime
    // overloading: determination done at compile time
    // 
    // doSomething(42) // calls first one
    // doSomething(false) // call second one
    //
    public static void doSomething(int x) {}
    public static void doSomething(boolean b) {}
    public static void doSomething(int x, int y) {}
    // ---end method overloading---
    
    // Uses subtyping
    // - (sub)type polymorphism
    // - polymorphism
    public static OutputDestination makeDestination(boolean userWantsConsole,
                                                    String destinationFile) {
        if (userWantsConsole) {
            // ConsoleDestination is a subtype of OutputDestination
            return new ConsoleDestination();
        } else {
            // FileDestination is a subtype of OutputDestination
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
        // virtual dispatch is the same thing as
        // - dynamic dispatch
        // - ad-hoc polymorphism
        // - polymorphism
        destination.writeThing(result);

        // close it
        destination.close();
    }
}
