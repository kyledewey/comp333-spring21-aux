function Base() {}
function Sub1() {}
function Sub2() {}

Base.prototype.method = function () {
    console.log("base");
};
Sub1.prototype = new Base(); // Implicitly: this new object's __proto__ is Base.prototype
//Sub1.prototype = Base.prototype;
Sub1.prototype.method = function () {
    console.log("sub1");
}
Sub2.prototype = new Base();
//Sub2.prototype = Base.prototype;

// Base
//   -Sub1
//   -Sub2

let base = new Base();
let sub1 = new Sub1();
let sub2 = new Sub2();

base.method();  // prints "base"
sub1.method();  // prints "sub1"
sub2.method();  // prints "base"

console.log(base instanceof Base); // prints "true"
console.log(sub1 instanceof Base); // prints "true"
console.log(sub2 instanceof Base); // prints "true"
