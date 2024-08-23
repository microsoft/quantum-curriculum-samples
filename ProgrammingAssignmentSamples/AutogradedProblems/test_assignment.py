import pytest
import qsharp

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
    correct = qsharp.eval(f"Test.Test2()")
    assert correct
