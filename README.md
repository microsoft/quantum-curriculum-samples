# Introduction

This is a preview of the curriculum to learn quantum computing with Azure Quantum.

To request access to the complete set of curriculum materials, please fill [this form](https://aka.ms/AQ/Curriculum/RequestAccess).

## Table of contents

* [Course syllabus](#syllabus)
* [List of preview materials](#materials-list)
* [Use Azure Quantum in your course](#aq-credits)
* [Experience reports](#experience-reports)

## Course Syllabus <a name="syllabus" />

Here is the syllabus of the latest version of the curriculum:

**Course Structure** 
* One three-hour session per week (lecture + lab time combined); 14 weeks. 
* Weekly programming homework assignments during the first part of the course.
* Final project during the second part of the course.

**Course Outline**  

*Week 1.* Fundamentals, part 1.

* Motivation: Why quantum computing?
* Quick review: complex numbers, matrices and vectors, tensor product.
* The qubit, superposition, Dirac notation, single-qubit quantum gates, entanglement.

*Week 2.* Fundamentals, part 2.

* Multi-qubit quantum gates, Dirac notation for gates representation.
* Comparison of different notations: matrix, Dirac, circuit, Q# code.
* Measurements: single-qubit, multi-qubit, partial measurement of multi-qubit system.
* No-cloning theorem.

*Week 3.* Simple algorithms.

* Teleportation.
* Superdense coding.
* Quantum oracles (phase oracles).
* Deutsch, Deutsch-Jozsa and Bernstein-Vazirani algorithms.

*Week 4.* Reversible computing.

* Reversible Boolean logic.
* Reversible circuit synthesis: converting classical functions to quantum circuits, exercises.
* Toffoli simulator.
* Quantum oracles: marking oracles, converting marking oracles to phase oracles.
* Example: building oracle for SAT problems.

*Week 5.* Grover's search algorithm.

* Search problem.
* Unitary transformations used in Grover's search algorithm, their representation as reflections.
* Grover's search algorithm, its visualization.
* Practical aspects of using Grover's search algorithm.

*Week 6.* Quantum Fourier transform.

* Definition and circuit implementation of quantum Fourier transform.
* Examples of QFT effect on various states.

*Week 7.* Quantum phase estimation.

* Linear algebra review: eigenvalues and eigenvectors.
* Eigenvalues and eigenphases of quantum operations: properties and examples.
* Single-bit phase estimation, measuring an operator.
* Quantum phase estimation.
* Application: quantum counting.

*Week 8.* Integer factoring (Shor's algorithm).

* RSA review.
* Order finding problem.
* Integer factoring (Shor's algorithm).

*Week 9.* Error correction.

* Problem description, comparison of classical and quantum information, inherent challenges of error correcting quantum information.
* Joint measurements.
* Simple error correction codes: bit-flip, sign-flip, Shor's code.
* Fault-tolerant quantum computation: problem description.

*Week 10.* Applications overview.

* True random number generation.
* Quantum cryptography, quantm key distribution, example: BB84 protocol.
* Quantum machine learning, example: quantum perceptron.
* Quantum simulation.

*Week 11.* Building a full-stack quantum computer.

* Software and hardware stack necessary to build a viable quantum computing system.

The last weeks are used for students' presentations of their final projects.


## List of preview materials <a name="materials-list" />

This preview contains examples of the materials included in the curriculum.

* [Lecture slides on quantum computing](./LectureSlides).
* [Slides introducing Q# and Microsoft Quantum Development Kit](./QDKSlides).
* [Automatically graded programming assignments focused on solving quantum computing problems of varying complexity](./ProgrammingAssignmentSamples/AutogradedProblems).
* [Programming assignments focused on debugging quantum programs](./ProgrammingAssignmentSamples/DebuggingQuantumCode).
* [Programming assignments focused on resources estimation of quantum programs](./ProgrammingAssignmentSamples/ResourcesEstimation).
* [Ideas of final projects and examples of final projects done by our past students](./FinalProjects).


## Use Azure Quantum in your course <a name="aq-credits" />

Microsoft offers several credits programs to support using Azure Quantum in the classroom.

* Every student can [use up to $500 in credits to experiment with each of the participating quantum hardware partners](https://devblogs.microsoft.com/qsharp/explore-quantum-hardware-for-free-with-azure-quantum/).
* Additionally, you can [apply for up to $10,000 in credits](https://aka.ms/aq/credits) to share them with your students.


## Our and our partners' experience reports <a name="experience-reports" />

The first version of this curriculum was piloted in a University of Washington course taught by Microsoft Quantum team in 2019. You can read about this experience in the paper ["Teaching Quantum Computing through a Practical Software-driven Approach: Experience Report" by Mariia Mykhailova, Krysta M. Svore](https://arxiv.org/abs/2010.07729).

We shared this curriculum with multiple university partners who used the materials to teach their own versions of this course. You can read more about the experience of one of our partners, University of Montevideo, in the paper ["Quantum Computing for Undergraduate Engineering Students: Report of an Experience" by Laura Gatti, Rafael Sotelo](http://ingenieria.um.edu.uy/pdf/QCE21_Workforce_UM_LG_RS_final.pdf).


## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft 
trademarks or logos is subject to and must follow 
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
