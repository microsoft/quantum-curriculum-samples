import pytest
import qsharp
from cmath import exp
from math import pi
from qsharp.utils import dump_operation

@pytest.fixture(autouse=True)
def setup():
    """Fixture to execute before each test is run"""
    qsharp.init(project_root=".")
    yield


def test_1() -> None:
    """Test for task 1: check that Q# code prepares the expected state exactly (not up to a global phase)."""
    expected_state = [0.5, 0.5j, -0.5, -0.5j]

    # Run Q# code that allocates the qubits and prepares the state but doesn't deallocate the qubits.
    qsharp.eval(f"use qs = Qubit[2]; StatePrep.Task1(qs);")

    # Get the state of the allocated qubits and convert it to a vector.
    state = qsharp.dump_machine().as_dense_state()

    # Compare two vectors.
    assert state == pytest.approx(expected_state)


def test_2() -> None:
    """Test for task 2: check that Q# code distinguishes states correctly."""
    correct = qsharp.eval("Test.Test2()")
    assert correct


def test_3() -> None:
    """Test for task 3: check that Q# code implementing an operation has the correct matrix."""
    expected_matrix = [
        [1, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, exp(-1j * pi/8), 0],
        [0, 0, 0, exp(1j * pi/8)]
    ]
    matrix = dump_operation("Gate.Task3", 2)
    for (row, expected_row) in zip(matrix, expected_matrix):
        assert row == pytest.approx(expected_row)


def test_4() -> None:
    """Test for task 4: check that Q# code implements the correct marking oracle."""
    correct = qsharp.eval("Test.Test4()")
    assert correct
