// no let: global variable
// let: local variable, scoped to enclosing curly braces
// var: local variable, scoped to enclosing function
function foo() {
    let x = 10;
}

function bar() {
    let x = 20;
    {
        var y = 0;
    }
    return y;
}
