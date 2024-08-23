// This file contains parts of the testing harness for the tasks that need it.
// You should not modify anything in this file.

import Std.Arrays.Zipped;
import Std.Convert.*;
import Std.Diagnostics.*;
import Std.Math.*;
import Std.Random.*;
import Measurement.Task2;
import MarkingOracle.Task4;

////////////////////////////////////////////////////////////////////////////

// Helper operation that prepares the W state, starting from the |0⟩ state.
operation WStatePrep(qs : Qubit[]) : Unit is Adj + Ctl {
    let N = Length(qs);

    if N == 1 {
        // base case of recursion: |1⟩
        X(qs[0]);
    } else {
        // |W_N⟩ = |0⟩|W_(N-1)⟩ + |1⟩|0...0⟩
        // do a rotation on the first qubit to split it into |0⟩ and |1⟩ with proper weights
        // |0⟩ -> sqrt((N-1)/N) |0⟩ + 1/sqrt(N) |1⟩
        let theta = ArcSin(1.0 / Sqrt(IntAsDouble(N)));
        Ry(2.0 * theta, qs[0]);

        // do a zero-controlled W-state generation for qubits 1..N-1
        X(qs[0]);
        Controlled WStatePrep(qs[0..0], qs[1..N - 1]);
        X(qs[0]);
    }
}


// Helper operation that either leaves the qubits in the |0⟩ state or prepares W state on them.
operation StatePrep_AllZerosOrWState(
    qs : Qubit[],
    state : Int
) : Unit is Adj {
    if state == 1 {
        // Prepare W state
        WStatePrep(qs);
    }
}


// Framework operation that takes a list of orthogonal quantum states and the code that is supposed to distinguish them
// and checks that this code performs the task correctly.
operation DistinguishStates_MultiQubit(
    nQubits : Int,
    nStates : Int,
    statePrep : (Qubit[], Int) => Unit is Adj,
    testImpl : Qubit[] => Int,
    stateNames : String[]
) : Bool {

    let nTotal = 100;
    // misclassifications will store the number of times state i has been classified as state j (dimension nStates^2)
    mutable misclassifications = [0, size = nStates * nStates];
    // unknownClassifications will store the number of times state i has been classified as some invalid state (index < 0 or >= nStates)
    mutable unknownClassifications = [0, size = nStates];

    use qs = Qubit[nQubits];
    for _ in 1 .. nTotal {
        // get a random integer to define the state of the qubits
        let state = DrawRandomInt(0, nStates - 1);

        // do state prep: convert |0...0⟩ to outcome with return equal to state
        statePrep(qs, state);

        // get the solution's answer and verify that it's a match, if not, increase the exact mismatch count
        let ans = testImpl(qs);
        if ans >= 0 and ans < nStates {
            // classification result is a valid state index - check if is it correct
            if ans != state {
                set misclassifications w/= ((state * nStates) + ans) <- (misclassifications[(state * nStates) + ans] + 1);
            }
        }
        else {
            // classification result is an invalid state index - file it separately
            set unknownClassifications w/= state <- (unknownClassifications[state] + 1);
        }

        // we're not checking the state of the qubit after the operation
        ResetAll(qs);
    }

    mutable totalMisclassifications = 0;
    for i in 0 .. nStates - 1 {
        for j in 0 .. nStates - 1 {
            if misclassifications[(i * nStates) + j] != 0 {
                set totalMisclassifications += misclassifications[i * nStates + j];
                Message($"Misclassified {stateNames[i]} as {stateNames[j]} in {misclassifications[(i * nStates) + j]} test runs.");
            }
        }
        if unknownClassifications[i] != 0 {
            set totalMisclassifications += unknownClassifications[i];
            Message($"Misclassified {stateNames[i]} as Unknown State in {unknownClassifications[i]} test runs.");
        }
    }
    totalMisclassifications == 0
}


// The test logic for task 2 (distinguishing orthogonal states).
operation Test2() : Bool {
    for n in 2 .. 6 {
        let isCorrect = DistinguishStates_MultiQubit(
            n, 2,
            StatePrep_AllZerosOrWState,
            Task2,
            ["|0...0⟩", "|W⟩"]);

        if not isCorrect {
            Message($"Test failed for n = {n}.");
            return false;
        }
    }
    true
}

////////////////////////////////////////////////////////////////////////////

// Helper function to convert a boolean array to its ket state representation
function BoolArrayAsKetState (bits : Bool[]) : String {
    mutable stateName = "|";
    for i in 0 .. Length(bits) - 1 {
        set stateName += (bits[i] ? "1" | "0");
    }

    return stateName + "⟩";
}


// Helper operation that, given a marking oracle acting on N inputs, and a classical function acting on N bits, 
// checks whether the oracle effect matches that of the function on every classical input.
operation CheckOracleImplementsFunction (
    N : Int, 
    oracle : (Qubit[], Qubit) => Unit, 
    f : Bool[] -> Bool
) : Bool {
    let size = 1 <<< N;
    use (input, target) = (Qubit[N], Qubit());
    for k in 0 .. size - 1 {
        // Prepare k-th bit vector
        let binaryLE = IntAsBoolArray(k, N);
        
        // "binary" is little-endian notation, so the second vector tried has qubit 0 in state 1 and the rest in state 0
        ApplyPauliFromBitString(PauliX, true, binaryLE, input);
        
        // Apply the operation
        oracle(input, target);
        
        // Calculate the expected classical result
        let val = f(binaryLE);

        // Apply operations that will revert the qubits to the 0 state if the oracle acted correctly.
        if val {
            X(target);
        }
        ApplyPauliFromBitString(PauliX, true, binaryLE, input);

        if not CheckAllZero(input + [target]) {
            Message($"Unexpected result on input {BoolArrayAsKetState(binaryLE)}.");
            if not CheckAllZero(input) {
                Message("The state of the input qubits changed, or they ended up entangled with the target qubit.");
                Message("The state of the system after oracle application:");
                DumpMachine();
            } else {
                Message($"Expected result `{val}`, got `{not val}`.");
            }
            ResetAll(input + [target]);
            return false;
        }
    }
    return true;
}


// Classical function that has to be implemented by the oracle in task 4.
function F_MatchesPattern(args : Bool[], r : Bool[]) : Bool {
    for i in 0 .. Length(args) - 1 {
        if args[i] != r[i] {
            return false;
        }
    }
    return true;
}


// The test logic for task 4 (implementing marking oracle for a function).
operation Test4() : Bool {
    for n in 1 .. 3 {
        for k in 0 .. 2^n - 1 {
            let pattern = IntAsBoolArray(k, n);

            let isCorrect = CheckOracleImplementsFunction(n, Task4(_, _, pattern), F_MatchesPattern(_, pattern));

            if not isCorrect {
                return false;
            }
        }
    }
    true
}
