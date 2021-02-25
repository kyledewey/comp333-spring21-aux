// combineAllIntoOneString(['foo', 'bar', 'baz']) == 'foobarbaz'
function combineAllIntoOneString(list) {
    // let temp = '';
    // let x;
    // for (x = 0; x < list.length; x++) {
    //     temp = temp + list[x];
    // }
    // return temp;

    //return myReduce(list, '', (accum, element) => accum + element);

    return list.reduce((accum, element) => accum + element, '');
}

// getSum([1, 2, 3]) == 6
function getSum(list) {
    // let temp = 0;
    // let x;
    // for (x = 0; x < list.length; x++) {
    //     temp = temp + list[x];
    // }
    // return temp;

    //return myReduce(list, 0, (accum, element) => accum + element);

    return list.reduce((accum, element) => accum + element, 0);
}

// getProduct([1, 2, 3, 4]) == 24
function getProduct(list) {
    // let temp = 1;
    // let x;
    // for (x = 0; x < list.length; x++) {
    //     temp = temp * list[x];
    // }
    // return temp;

    //return myReduce(list, 1, (accum, element) => accum * element);

    return list.reduce((accum, element) => accum * element, 1);
}

// accumulator is the temporary variable
// someFunction(currentAccumulator, listElement) === newAccumulator
function myReduce(list, startingAccumulator, someFunction) {
    let accumulator = startingAccumulator;
    let x;
    for (x = 0; x < list.length; x++) {
        accumulator = someFunction(accumulator, list[x]);
    }
    return accumulator;
}
