# Automatically Graded Programming Assignments (Example)

This folder contains an example of the automatically graded programming assignments. They include the testing harness that can be shared with the students as part of the homework to help them verify their solutions before submitting.

This testing harness is logically the same as the testing harnesses used in the Quantum Katas (i.e., it doesn't do any extra verification or drop any checks), but its structure is different. All Q# code is split in two separate projects:

* [Backend](./Backend/) project contains the reference solutions and the testing logic - the parts that **should be kept secret**.
* [Frontend](./Frontend/) project contains the tasks and the tests covering them - the parts that **can be shared with the students** without revealing the solutions.

To allow the students to use the testing logic without revealing the solutions, we generate a NuGet package from the Backend project and use it in the Frontend project. We share the whole Frontend folder with the students, including the .nupkg file generated from the Backend project.

## Programming assignment instructions

This week's programming assignment covers the following topics:
 * implementing marking oracles and phase oracles,
 * conversions between different types of oracles.

The corresponding learning exercises are in the following tutorials and katas:
* [Oracles tutorial](https://github.com/Microsoft/QuantumKatas/blob/main/tutorials/Oracles/)
* [ExploringDeutschJozsaAlgorithm tutorial](https://github.com/Microsoft/QuantumKatas/blob/main/tutorials/ExploringDeutschJozsaAlgorithm/)
* [DeutschJozsaAlgorithm](https://github.com/Microsoft/QuantumKatas/blob/main/DeutschJozsaAlgorithm/)
* [GroversAlgorithm](https://github.com/Microsoft/QuantumKatas/blob/main/GroversAlgorithm/)
* [SolveSATWithGrover](https://github.com/Microsoft/QuantumKatas/blob/main/SolveSATWithGrover/)
* [GraphColoring](https://github.com/Microsoft/QuantumKatas/blob/master/GraphColoring/)
