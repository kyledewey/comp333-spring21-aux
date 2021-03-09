let rectanglePrototype = {
    'getArea': function() {
        // `this` gets bound to rec1
        return this.width * this.height;
    }
};

function Rectangle(width, height) {
    this.width = width;
    this.height = height;
    this.__proto__ = rectanglePrototype;
}
