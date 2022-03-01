namespace DeutschJozsaAlgorithm {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    // Phase oracle implementing a constant function f(x) = 0
    operation PhaseOracleZero (inputRegister : Qubit[]) : Unit {
        // Do nothing!
    }

    // Marking oracle implementing a balanced function f(x) = xₖ (the value of k-th bit)
    operation MarkingOracleKthBit (inputRegister : Qubit[], target : Qubit, k : Int) : Unit {
        Controlled X(inputRegister[k], target);
    }

    operation ApplyMarkingOracleAsPhaseOracle (
        markingOracle : ((Qubit[], Qubit) => Unit), 
        inputRegister : Qubit[]
    ) : Unit {
        use target = Qubit(1);
        // Put the target into the |-⟩ state
        X(target);
        H(target);
        // Apply the marking oracle; since the target is in the |-⟩ state,
        // this will apply a -1 factor to the states that satisfy the oracle condition
        markingOracle(inputRegister, target);
    }
    
    operation IsFunctionConstant (nQubits : Int, phaseOracle : (Qubit[] => Unit)) : Bool {
        mutable isConstant = true;
        use qubits = Qubit[nQubits];
        // Apply the H gates, the oracle and the H gates again
        within {
            ApplyToEach(H, qubits);
        } apply {
            phaseOracle(qubits);
        }
        // Measure all qubits
        let measurementResults = MultiM(qubits);
        for m in measurementResults {
            if m == Zero {
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
        // for constant function
        let isZeroConstant = IsFunctionConstant(2, PhaseOracleZero);
        Message($"f(x) = 0 classified as {ConstantOrBalanced(isZeroConstant)}");

        // for balanced function
        let markingOracleSecondBit = MarkingOracleKthBit(_, _, 2);
        let phaseOracleSecondBit = ApplyMarkingOracleAsPhaseOracle(markingOracleSecondBit, _);
        let isSecondBitConstant = IsFunctionConstant(2, phaseOracleSecondBit);
        Message("f(x) = x₂ classified as {ConstantOrBalanced(isSecondBitConstant)}");
    }
}
