function Rectangle(width, height) {
    this.__proto__ = Rectangle.prototype; // Happens implicitly
    
    this.width = width;
    this.height = height;
}

Rectangle.prototype = {}; // Happens implicity

// adding the getArea field to the Rectangle.prototype object
Rectangle.prototype.getArea = function() {
    return this.width * this.height;
};
