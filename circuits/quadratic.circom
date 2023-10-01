pragma circom  2.0.0; //compiler version

//function to square a value
function sqr(x) {
    return x*x;
}

//main component for the circuit
//checks that the input x does indeed solve the equation
// x^2 + x + 5 = 11
// ANS: x = 2
template quadratic() {
    //input x (private by default)
    signal input x;
    //output, the right side of the equals sign
    signal output right;

    //square x for x^2
    var first = sqr(x);
    // x for x
    var second = x;
    // 5 for 5
    var third = 5;
    // Add them all together to get right side of the quation
    var sum = first + second + third;
    //assign the right side of the equation to the output side
    // <== is an assignment + constraint
    right <== sum;
    //constrains the right to be 11
    // === is a constraint
    right === 11;
}

//entry point into the circuit
component main = quadratic();