// Copyright (c) Microsoft Corporation. All rights reserved.

namespace Quantum.OraclesProblems {
    
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    
    //////////////////////////////////////////////////////////////////
    // This is the demo set of programming assignments for the topic "Oracles".
    //////////////////////////////////////////////////////////////////

    // The tasks cover the following topics:
    //  - implementing marking oracles and phase oracles,
    //  - conversions between different types of oracles.
    //
    // We recommend to solve the following katas and tutorials before doing these assignments:
    //  - Oracles tutorial
    //  - ExploringDeutschJozsaAlgorithm tutorial
    //  - DeutschJozsaAlgorithm kata (part 1)
    //  - GroversAlgorithm kata (part 1)
    //  - SolveSATWithGrover kata (parts 1 and 2)
    //  - GraphColoring kata (except task 2.3)
    // from https://github.com/Microsoft/QuantumKatas


    // Task 1. Marking oracle for a function marking an arbitrary bit string
    // Inputs:
    //      1. N qubits in an arbitrary state |x⟩  (input/query register).
    //      2. A qubit in an arbitrary state  |y⟩  (target qubit).
    //      3. A boolean array of length N representing a basis state; true and false elements correspond to |1⟩ and |0⟩, respectively.
    // Goal:
    //      Flip the state of the qubit |y⟩ if the input register matches the basis state represented by the pattern.
    operation ArbitraryBitPatternMarkingOracle (
        x : Qubit[], 
        y : Qubit, 
        pattern : Bool[]
    ) : Unit is Adj + Ctl {
        // ...
    }


    // Task 2. Phase oracle for a function marking an arbitrary bit string
    // Inputs:
    //      1. N qubits in an arbitrary state |x⟩  (input/query register).
    //      2. A boolean array of length N representing a basis state; true and false elements correspond to |1⟩ and |0⟩, respectively.
    // Goal:
    //      Flip the sign of the input state |x⟩ if the input register matches the basis state represented by the pattern.
    //      Implement this oracle without using auxiliary qubits.
    operation ArbitraryBitPatternPhaseOracle (
        x : Qubit[], 
        pattern : Bool[]
    ) : Unit is Adj + Ctl {
        // ...
    }


    // Task 3. Apply the marking oracle as a phase oracle
    // Inputs:
    //      1. A marking oracle implementing an unknown N-bit function f(x).
    //      2. N qubits in an arbitrary state (input/query register).
    // Goal:
    //      Flip the phase of each basis state |x⟩ for which f(x) = 1. 
    //      You can only access f(x) via the marking oracle you are given.
    // Hint:
    //      Remember that you can allocate extra qubits temporarily, as long as you return them to the |0⟩ state before releasing them.
    operation ApplyMarkingOracleAsPhaseOracle (
        markingOracle : ((Qubit[], Qubit) => Unit is Adj + Ctl), 
        qubits : Qubit[]
    ) : Unit is Adj + Ctl {
        // ...
    }
}
