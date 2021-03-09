// Constructors in JavaScript

// let car = { 'color' : red, 'topSpeed': 45 }

function Car(myColor, topSpeed) {
    // this: refers to the object being constructed
    this.color = myColor;
    this.topSpeed = topSpeed;
}

// to call as a constructor:
// 1.) Automatically create a new empty empty object ({})
// 2.) Bind a reference to this new empty object to `this`
// 3.) Execute the code as written in the constructor
// 4.) Return the newly-created object (automatically)
