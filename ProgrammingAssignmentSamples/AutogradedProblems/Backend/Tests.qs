// Copyright (c) Microsoft Corporation. All rights reserved.

//////////////////////////////////////////////////////////////////////
// This file contains testing harness for all tasks.
//////////////////////////////////////////////////////////////////////

namespace Quantum.OraclesProblems.Backend {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Random;
    

    // ------------------------------------------------------
    // Internal helper function
    internal operation ApplyMarkingOracleToArray (
        oracle : ((Qubit[], Qubit) => Unit is Adj + Ctl),
        qs : Qubit[]
    ) : Unit is Adj + Ctl {
        let N = Length(qs);
        oracle(qs[0 .. N - 2], qs[N - 1]);
    }


    // ------------------------------------------------------
    // The operation that exposes the test for task 1 to the frontend
    operation T1_TestingHarness (testSolution : (Qubit[], Qubit, Bool[]) => Unit is Adj + Ctl) : Unit {
        // Iterate over all bit patterns that use 1-4 qubits.
        for N in 1 .. 4 {
            for k in 0 ..  2^N - 1 {
                let pattern = IntAsBoolArray(k, N);

                // Convert marking oracles acting on Qubit[] + Qubit to act on Qubit[].
                let sol = ApplyMarkingOracleToArray(testSolution(_, _, pattern), _);
                let refSol = ApplyMarkingOracleToArray(ArbitraryBitPatternMarkingOracle_Reference(_, _, pattern), _);

                // Compare the student's solution with the reference solution
                // (as unitary transformations).
                AssertOperationsEqualReferenced(N + 1, sol, refSol);
            }
        }
    }


    // ------------------------------------------------------
    // The operation that exposes the test for task 2 to the frontend
    operation T2_TestingHarness (testSolution : (Qubit[], Bool[]) => Unit is Adj + Ctl) : Unit {
        // Iterate over all bit patterns that use 1-4 qubits.
        for N in 1 .. 4 {
            for k in 0 .. 2^N - 1 {
                let pattern = IntAsBoolArray(k, N);

                within {
                    // Make sure the student's solution didn't use extra qubits (i.e., phase kickback trick)
                    // and implemented the phase oracle from scratch.
                    AllowAtMostNQubits(2*N, "You are not allowed to allocate extra qubits");
                } apply {
                    // Compare the student's solution with the reference solution
                    // (as unitary transformations).
                    AssertOperationsEqualReferenced(
                        N,
                        testSolution(_, pattern),
                        ArbitraryBitPatternPhaseOracle_Reference(_, pattern)
                    );
                }
            }
        }
    }


    // ------------------------------------------------------
    // The operation that exposes the test for task 3 to the frontend
    operation T3_TestingHarness (testSolution : ((Qubit[], Qubit) => Unit is Adj + Ctl, Qubit[]) => Unit is Adj + Ctl) : Unit {
        // Iterate over all bit patterns that use 1-4 qubits.
        for N in 1 .. 4 {
            for k in 0 .. 2^N - 1 {
                let pattern = IntAsBoolArray(k, N);

                // Generate a marking oracle that marks this bit pattern.
                let markingOracle = ArbitraryBitPatternMarkingOracle_Reference(_, _, pattern);
                
                // Compare the phase oracles produced from this marking oracle using the test solution 
                // using the student's solution and the reference converter.
                AssertOperationsEqualReferenced(
                    N,
                    testSolution(markingOracle, _),
                    ApplyMarkingOracleAsPhaseOracle_Reference(markingOracle, _)
                );
            }
        }
    }
}
