namespace DeutschJozsaAlgorithm {
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    // Marking oracle implementing a balanced function f(x) = 1 if x has odd number of 1s, and 0 otherwise
    operation MarkingOracleOddNumberOfOnes (x : Qubit[], y : Qubit) : Unit {
        ApplyToEachA(CNOT(_, y), x);
    }

    operation ApplyMarkingOracleAsPhaseOracle (
        markingOracle : ((Qubit[], Qubit) => Unit), 
        inputRegister : Qubit[]
    ) : Unit {
        use target = Qubit();
        within {
            // Put the target into the |-⟩ state
            X(target);
            H(target);
        } apply {
            // Apply the marking oracle; since the target is in the |-⟩ state,
            // this will apply a -1 factor to the states that satisfy the oracle condition
            markingOracle(inputRegister, target);
        }
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
        let measurementResults = MultiM(qubits);
        // If any of measurement results are 1, the function is balanced
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

    operation RunDeutschJozsaAlgorithm (N : Int) : Bool {
        let phaseOracle = ApplyMarkingOracleAsPhaseOracle(MarkingOracleOddNumberOfOnes, _);
        return IsFunctionConstant(N, phaseOracle);
    }
}
