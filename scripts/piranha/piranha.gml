function piranha(){
// Time, Start, duration, hover
var t = argument[0]; // time
var b = argument[1]; // start
var c = argument[2]; // change
var d = argument[3]; // duration
var h = argument[4]; // hover
t /= d;
return c * t + b;
}