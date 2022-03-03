# Resources Estimation for Quantum Programs (Example)

This week's programming assignment introduces the task of resource estimation, i.e., figuring out the width and depth of the circuit implemented by the Q# code.

The Q# project in this folder is a reference implementation of the task; it includes the quantum program that needs to be estimated and the classical driver which calls the program to estimate the resources used by it. This project was used to generate the file expected_output.txt.

For this assignment, share with the students the following instructions, together with the file `DeutschJozsaCode.qs`. The students submit a single file with the results of executing both tasks of the assignment. This file should match the file expected_output.txt. Additionally, you can ask the students to explain the results in a free-form text note.

## Assignment instructions

In this task you will explore the Deutsch-Jozsa algorithm and learn to run resource estimation for quantum algorithms.
You do not need to submit the code you write; you submit only the file with the required output.

Take the file `DeutschJozsaCode.qs` that contains the implementation of the Deutsch-Jozsa algorithm for an N-bit function f(x) = "1 if x has odd number of 1s, and 0 otherwise".
Use resources estimator provided with Q# (https://docs.microsoft.com/quantum/machines/resources-estimator) 
to get the width of the circuit (the maximal number of qubits allocated at any time)
and the numbers of gates of different types that are required to run this program.

Fill the following table (in tab-separated format):
N	Width	CNOT	Clifford
1
2
3
4
5
6

