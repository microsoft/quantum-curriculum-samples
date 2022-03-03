// Copyright (c) Microsoft Corporation. All rights reserved.

using System;
using Microsoft.Quantum.Simulation.Simulators;

namespace Microsoft.Quantum.Samples.IntegerFactorization
{
    /// <summary>
    /// This is a Console program that runs the quantum algorithm 
    /// on a resources estimator to get the necessary data.
    /// </summary>
    class ClassicalDriver
    {
        static void Main(string[] args)
        {
            // Run gate counting for several values of N.
            // Columns for width (number of qubits), CNOT gate count, and Clifford gate count

            Console.WriteLine("Number\tWidth\tCNOT\tClifford");
            for (int N = 1; N <= 6; ++N)
            {
                ResourcesEstimator estimator = new();
                DeutschJozsaAlgorithm.RunDeutschJozsaAlgorithm.Run(estimator, N).Wait();
                var data = estimator.Data;
                Console.WriteLine($"{N}\t{data.Rows.Find("Width")["Sum"]}\t{data.Rows.Find("CNOT")["Sum"]}\t{data.Rows.Find("QubitClifford")["Sum"]}");
            }
        }
    }
}