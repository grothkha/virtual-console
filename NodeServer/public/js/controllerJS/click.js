/**
 * Created by michaelschleiss on 29.10.15.
 */
$('.myButton').mousedown(function() {buttonwaspressed});
$('.myButton').mouseup(function() {buttonwasreleased});

function buttonwaspressed(){
    console.log(this);
}

function buttonwasreleased(){
    console.log("Ich bin losgelesassen worden");
}