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
// function pointer - C has these!
//

//let lessThanFive = function (x) { return x < 5; }
function lessThanFive(x) {
    return x < 5;
}

function printAllLessThanFive(array) {
    //printAllMatching(array, function (x) { return x < 5; })
    //printAllMatching(array, x => x < 5);
    printAllMatching(array, lessThanFive);
}

function notFoobar(x) {
    return x !== "foobar";
}

function printAllNotFoobar(array) {
    //printAllMatching(array, x => x !== "foobar");
    printAllMatching(array, notFoobar);
}

// function greaterThan(x, value) {
//     return x > value;
// }

function printAllGreaterThan(array, value) {
    // this function closes over `value`
    printAllMatching(array, x => x > value);
    //printAllMatching(array, greaterThan, value);
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
