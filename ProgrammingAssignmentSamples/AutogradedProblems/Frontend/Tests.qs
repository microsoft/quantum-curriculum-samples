// Copyright (c) Microsoft Corporation. All rights reserved.

namespace Quantum.OraclesProblems {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;

    open Quantum.OraclesProblems.Backend;

    @Test("QuantumSimulator")
    operation T1_Test () : Unit {
        T1_TestingHarness(ArbitraryBitPatternMarkingOracle);
    }


    @Test("QuantumSimulator")
    operation T2_Test () : Unit {
        T2_TestingHarness(ArbitraryBitPatternPhaseOracle);
    }


    @Test("QuantumSimulator")
    operation T3_Test () : Unit {
        T3_TestingHarness(ApplyMarkingOracleAsPhaseOracle);
    }
}
