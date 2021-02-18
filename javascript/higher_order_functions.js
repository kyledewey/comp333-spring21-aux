// higher-order functions
// ...in constrast to first-order functions
//

// anonymous functions: a function with no name
// higher-order functions: functions are data
// lambdas: functions are data (lambda calculus)
// closures: a higher-order function that _closes over_ data
// functors: C++ wants to be different
// callback: specific kind of higher-order function
// arrow functions / arrow type: => / -> 
//
// function pointer
//

function printAllLessThanFive(array) {
    //printAllMatching(array, function (x) { return x < 5; })
    printAllMatching(array, x => x < 5);
}

function printAllNotFoobar(array) {
    printAllMatching(array, x => x !== "foobar");
}

function printAllGreaterThan(array, value) {
    printAllMatching(array, x => x > value);
}

// array: Array[Int]
// shouldIPrintIt: Int => Bool
function printAllMatching(array, shouldIPrintIt) {
    let x;
    for (x = 0; x < array.length; x++) {
        if (shouldIPrintIt(array[x])) {
            console.log(array[x]);
        }
    }
}
