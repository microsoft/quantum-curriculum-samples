# Final Projects: Approach and Ideas

The curriculum relies on final projects in lieu of final written exams.
Final projects are a great way to make sure the students have mastered the skills necessary to complete an end-to-end quantum software project.
They are the best approximation of real quantum software engineering work, since they go beyond solving small well-defined tasks (like the ones offered in the homework assignments) to larger open-ended problems.

## Final project 

Choose a problem/algorithm not covered in the class (and in the existing Q# code base), learn, implement, test and analyze.
The deliverables of a final project include:

* Written summary (30%) – 2-3 pages: problem statement, importance, technical results (math solution, implementation subtleties, test results, analysis).
* Code implementation (50%).
* Class presentation (20%) – teach your classmates the topic you’ve learned (in 20 minutes or less).

Approximate timeline:

* Topic selection: by mid-term.
* Working on the project: second half of the term in parallel with the lectures (fewer or no weekly programming assignments at this point).
* Project submission (the implementation and the written summary): a week or two before the end of the term.
* Final presentations to the class: last 2-3 lectures.


## Examples of future project ideas

*The projects offered in the past that have been completed and contributed to open source projects don't necessarily make for great projects going forward,
since we want the students to perform independent work rather than explore a project done previously.  
At the same time students (especially undergraduate) can have trouble coming up with a project idea and especially estimating its difficulty. 
We recommend to offer a list of project ideas to show the expected level of complexity, and to verify that the student correctly estimates the difficulty of their chosen project early.*

Here are some ideas of final projects.

* Implement an algorithm and explore its behavior on a simulator vs on real hardware.  
  This include a general scalable implementation, resources estimation, choosing a small instance that can be simulated and executed on NISQ hardware, possibly tweaking the implementation to reduce circuit depth and complexity, and results analysis.  
  Get started: ["Quantum programming with Q# and running on hardware with Azure Quantum" by Mariia Mykhailova](https://www.youtube.com/watch?v=c9Df90CVHkc).
* Solve a specific classical problem (for example, a cryptarithm or a Sudoku puzzle) using Grover's search algorithm.  
  Learn reversible computing and practicality of Grover's search, and optimize the implementation.
  Get started: ["Analyzing a Sudoku solver using resources estimation" by Mariia Mykhailova](https://devblogs.microsoft.com/qsharp/analyzing-sudoku-solver-using-resources-estimation/).
* Implement an algorithm following a specific paper.  
  Papers often either omit implementation details or implement only a special case of the problem (as a hardcoded quantum circuit) rather than a general case. Exploring the nuances of a general-purpose implementation can be an interesting challenge for the student.
* Optimizing code to run on a quantum simulator.  
  Explore and exploit implementation details of a simulator (for example, tweak circuit width to reduce the memory required) 
  and explore emulation (efficient implementation of unitaries that are permutations).
  Get started: ["Decorating the Christmas Tree Using Grover's Search, part 3: Optimizing the Simulation" by Mariia Mykhailova](https://github.com/tcNickolas/MiscQSharp/tree/master/DecoratingTheTree2019-Optimize#decorating-the-christmas-tree-using-grovers-search).
* Error correction.  
  Explore a lower-level component of quantum software stack.  
  * Implement a custom simulator that introduces certain types of errors and use it to demonstrate an error correcting code.
  See an example of such custom simulator [here](https://github.com/microsoft/Quantum/tree/main/samples/runtime/simulator-with-overrides).
  * Use [noise simulator](https://docs.microsoft.com/en-us/azure/quantum/user-guide/machines/noise-simulator) to explore different types of errors and use it to demonstrate an error correcting code.
* Unitary synthesis.  
  Explore a lower-level component of quantum software stack.
  * How to decompose 1-qubit and 2-qubit unitaries into sequences of rotations and rotations/CNOT gates (Pauli or Cartan decomposition and Krauss-Cirac decomposition, respectively).  
    Get started: ["Explorations in Quantum Computing" by Williams, chapter 2](http://iontrap.umd.edu/wp-content/uploads/2016/01/Quantum-Gates-c2.pdf).
  * How to implement an arbitrary unitary.
    Get started: ["Decomposition of unitary matrix into quantum gates" by Dmytro Fedoriaka](https://www.researchgate.net/publication/334615236_Decomposition_of_unitary_matrix_into_quantum_gates)


## Examples of past projects

Here is a list of projects done by the students in our courses in the past and contributed to our open-source repositories.
The contribution included only the code/tutorial part of the projects; the final projects themselves also included a brief writeup describing the algorithm and the implementation, and a presentation to the class.
*Contributing the projects to open source was not a hard requirement of the projects, but rather a voluntary follow-up activity.*

* Entanglement games (a set of three katas: [CHSHGame](https://github.com/microsoft/QuantumKatas/tree/main/CHSHGame), [GHZGame](https://github.com/microsoft/QuantumKatas/tree/main/GHZGame), [MagicSquareGame](https://github.com/microsoft/QuantumKatas/tree/main/MagicSquareGame)) (3 students)
* [BB84 key distribution protocol](https://github.com/microsoft/QuantumKatas/tree/main/KeyDistribution_BB84) (2 students)
* [Solving graph coloring problems using Grover's search](https://github.com/microsoft/QuantumKatas/tree/main/GraphColoring) (3 students)
* [Quantum arithmetic](https://github.com/microsoft/QuantumKatas/pull/84) (1 student) (not merged, superseded by [RippleCarryAdder kata](https://github.com/microsoft/QuantumKatas/tree/main/RippleCarryAdder)).  
  This project compared several implementations of quantum arithmetic and explored specialized simulators (Toffoli simulator).
* [Quantum Fourier transform (kata)](https://github.com/microsoft/QuantumKatas/pull/88) (2 students)
* [Hidden shift algorithm (kata)](https://github.com/microsoft/QuantumKatas/pull/83) (3 students)
* [Simon's algorithm (tutorial)](https://github.com/microsoft/QuantumKatas/pull/327) (1 student).  
  This project explored combining quantum processing with classical (quantum coprocessor model), 
  and to experiment with classical language interoperability supported by Q# (in this case Python interop).


> Note that most of the katas has been updated compared to the original project, often by the maintainer or by other contributors rather by the original authors. You can see the [pull requests that created each kata](https://github.com/Microsoft/QuantumKatas/pulls?utf8=%E2%9C%93&q=is%3Apr+created%3A2019-03-19..2019-03-27) for the original versions that went into the projects.
