// This programming assignment is focused on debugging Deutsch-Jozsa algorithm.
// The code contains exactly 7 bugs. Find them all!

// Marking oracle implementing a balanced function f(x) = 1 if x has odd number of 1s, and 0 otherwise
operation MarkingOracleOddNumberOfOnes (x : Qubit[], y : Qubit) : Unit {
    ApplyToEachA(CNOT(_, y), x);
}

operation ApplyMarkingOracleAsPhaseOracle (
    markingOracle : ((Qubit[], Qubit) => Unit), 
    inputRegister : Qubit[]
) : Unit {
    use target = Qubit();
    // Put the target into the |-⟩ state
    X(target);
    H(target);
    // Apply the marking oracle; since the target is in the |-⟩ state,
    // this will apply a -1 factor to the states that satisfy the oracle condition
    markingOracle(inputRegister, target);
    H(target);
    X(target);
}

operation IsFunctionConstant (nQubits : Int, phaseOracle : (Qubit[] => Unit)) : Bool {
    mutable isConstant = true;
    use qubits = Qubit[nQubits];
    // Apply the H gates, the oracle and the H gates again
    within {
        ApplyToEachA(H, qubits);
    } apply {
        phaseOracle(qubits);
    }
    // Measure all qubits
    let measurementResults = MResetEachZ(qubits);
    for m in measurementResults {
        if m == One {
            set isConstant = false;
        }
    }
    return isConstant;
}

function ConstantOrBalanced (value : Bool) : String {
    return value ? "constant" | "balanced";
}

@EntryPoint()
operation RunDeutschJozsaAlgorithm () : Unit {
    let N = 10;
    let phaseOracle = ApplyMarkingOracleAsPhaseOracle(MarkingOracleOddNumberOfOnes, _);
    let isConstant = IsFunctionConstant(N, phaseOracle);
    Message($"f(x) classified as {ConstantOrBalanced(isConstant)}");
}
