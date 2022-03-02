// Copyright (c) Microsoft Corporation. All rights reserved.

//////////////////////////////////////////////////////////////////////
// This file contains reference solutions to all tasks.
//////////////////////////////////////////////////////////////////////

namespace Quantum.OraclesProblems.Backend {
    
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    
    
    // Task 1. Marking oracle for a function marking an arbitrary bit string
    internal operation ArbitraryBitPatternMarkingOracle_Reference (x : Qubit[], y : Qubit, pattern : Bool[]) : Unit is Adj + Ctl {
        let PatternOracle = ControlledOnBitString(pattern, X);
        PatternOracle(x, y);
    }


    // Task 2. Phase oracle for a function marking an arbitrary bit string
    internal operation ArbitraryBitPatternPhaseOracle_Reference (x : Qubit[], pattern : Bool[]) : Unit is Adj + Ctl {
        within {
            for i in IndexRange(x) {
                if not pattern[i] {
                    X(x[i]);
                }
            }
        } apply {
            // We've converted the input string that needs to be marked to 1...1,
            // so the Controlled Z will flip its phase.
            Controlled Z(Most(x), Tail(x));
        }
    }


    // Task 3. Apply the marking oracle as a phase oracle
    internal operation ApplyMarkingOracleAsPhaseOracle_Reference (markingOracle : ((Qubit[], Qubit) => Unit is Adj + Ctl), qubits : Qubit[]) : Unit is Adj + Ctl {
        use minus = Qubit();
        within {
            X(minus);
            H(minus);
        } apply {
            markingOracle(qubits, minus);
        }
    }

}
