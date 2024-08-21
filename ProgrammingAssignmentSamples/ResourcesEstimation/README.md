# Resource Estimation for Quantum Programs (Example)

This week's programming assignment introduces the task of resource estimation, i.e., figuring out the resources required to run the circuit implemented by the Q# code.

The Q# program defines the circuit that needs to be estimated. `expected_output.txt`.

For this assignment, share with the students the following instructions, together with the file `DeutschJozsaCode.qs`. The students submit a single text file with the results of resource estimation. This file should match the file `expected_output.txt`. Additionally, you can ask the students to explain the results in a free-form text note.

## Assignment instructions

In this task you will explore the Deutsch-Jozsa algorithm and learn to run resource estimation for quantum algorithms.
You do not need to submit the code you write; you submit only the file with the required output.

Take the file `DeutschJozsaCode.qs` that contains the implementation of the Deutsch-Jozsa algorithm for an N-bit function f(x) = "1 if x has odd number of 1s, and 0 otherwise".
Use [Azure Quantum Resource Estimator](https://learn.microsoft.com/azure/quantum/intro-to-resource-estimation) 
to get the number of physical qubits required to execute this program and the estimated runtime in microseconds.
Use qubit model `qubit_gate_ns_e3` and error budget `0.001`.

Fill the following table (in tab-separated format):
```
N	Physical qubits Runtime
2
4
6
8
10
```
