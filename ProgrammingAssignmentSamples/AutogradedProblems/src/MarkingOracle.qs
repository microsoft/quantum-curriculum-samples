// Task 4. Marking oracle for a function marking an arbitrary bit string
// Inputs:
//      1. N qubits in an arbitrary state |x⟩  (input/query register).
//      2. A qubit in an arbitrary state  |y⟩  (target qubit).
//      3. A boolean array of length N representing a basis state; true and false elements correspond to |1⟩ and |0⟩, respectively.
// Goal:
//      Flip the state of the qubit |y⟩ if the input register matches the basis state represented by the pattern.
// For example, for N = 2 a pattern [false, true] would match the basis state: |01⟩.
operation Task4(
    x : Qubit[], 
    y : Qubit, 
    pattern : Bool[]
) : Unit is Adj + Ctl {
    // Write your solution here.
    // ...
}
