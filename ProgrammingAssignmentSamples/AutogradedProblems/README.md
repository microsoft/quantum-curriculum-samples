# Automatically Graded Programming Assignments (Example)

This folder contains an example of the automatically graded programming assignments. 
They include the testing harness that can be shared with the students as part of the homework to help them verify their solutions before submitting.

This testing harness is logically very similar to the testing harnesses used in the Quantum Katas.
However, the structure of the projects used here is different. It relies on Q# integration with Python 
and running tests for Q# code from Python using `pytest` library.

To use assignments that follow this structure, share the whole project with the students and ask them to fill in the code marked with "Write your solution here." Notice that the tests for the tasks don't include the solution code, so they are safe to share with the students. 

To run the tests (both as a student working on the assignment and as the person grading it), navigate to the root folder of the assignment (the folder containing the Python file and `qsharp.json`) and run `pytest`.
Initially, all tests will be failing. The goal is to fill in the code for each task to make the tests pass.

You can combine all the code for the tasks into one Q# file for simplicity; in this case, the students have to turn in only that one file for grading.

## Examples of problems included in this project

1. Preparing a certain quantum state (similar to the "Preparing Quantum States" kata).
2. Using measurements to distinguish orthogonal quantum states (similar to the "Distinguishing Quantum States" kata).
3. Implementing a quantum operation described by a given matrix (similar to the "Multi-Qubit Gates" kata).
4. Implementing a marking oracle that matches a given classical function (similar to the "Marking Oracles" kata).

## Resources

- [The Quantum Katas](https://quantum.microsoft.com/experience/quantum-katas) - a collection of tutorials and programming problems on quantum computing.
- You can find more examples of programming problems and ways they were tested at 
https://github.com/microsoft/qsharp/tree/main/katas/content.
- [Documentation on testing and debugging Q# code](https://learn.microsoft.com/azure/quantum/testing-debugging).
- [Samples of testing Q# code](https://github.com/microsoft/qsharp/tree/main/samples/testing).

