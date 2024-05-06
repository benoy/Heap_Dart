
// dart compile exe lib/main.dart
import 'dart:core';

abstract class IHeap<T extends Comparable<T>> {
  /* Inserts a new element into the heap. */
  void push(T element);

  /* Removes and returns the minimum element from the heap.*/
  T? pop();

  /* Returns the minimum element from the heap without removing it. */
  T? peek();

  /*
     Prints the contents of the heap to the console.
     The heap is printed in its current state, maintaining its structure.
  */
  void printHeap();
}

abstract class Heap<T extends Comparable<T>> extends IHeap<T> {

  List<T> data = [];

  /*
        Initializes the Heap with the given array of data.
        - Parameter data: An array of elements conforming to the `Comparable` protocol.
 */
  Heap(List<T> data) {
    this.createHeap(data);
  }

  void swapAt(int child, int parent) {
    T temp = data[child];
    data[child] = data[parent];
    data[parent] = temp;
  }

  /*
        Adds a new value to the heap and maintains the heap property.
        - Parameter value: The value to be added to the heap.
  */
  @override
  void push(T element) {
    data.add(element);
    siftUp();
  }

  /*
        Removes and returns the maximum value from the heap and maintains the heap property.
        - Returns: The maximum value in the heap, or nil if the heap is empty.
  */
  @override
  T? pop() {
    if (data.isEmpty) {
      return null;
    }

    if (data.length == 1) {
      return data.removeLast();
    }

    T maxVal = data[0];
    data[0] = data.removeLast();
    siftDown();
    return maxVal;
  }

  /* Returns maximum(first value in 'heap' without removing it) */
  @override
  T? peek() {
    if (data.isEmpty) {
      return null;
    }

    return data.first;
  }

  /*
     Prints the contents of the heap to the console.
     The heap is printed in its current state, maintaining its structure.
  */
  @override
  void printHeap() {
    String str = data.map((element) => '$element').toList().join(' ');
    print(str);
  }

  /*
        Creates the MaxHeap from the given array of data.
        - Parameter data: An array of elements conforming to the `Comparable` protocol.
    */
  void createHeap(List<T> data) {
    this.data = data;
    for (int i = (this.data.length ~/ 2) - 1; i >= 0; i--) {
      heapifyAt(i);
    }
  }

  /*
        Returns the index of the parent node of a given child node index.
        - Parameter childIndex: The index of the child node.
        - Returns: The index of the parent node.
    */
  int parentIndex(int childIndex) {
    int index = (childIndex - 1) ~/ 2;

    return index;
  }


  /*
        Returns the index of the left child node of a given parent node index.
        - Parameter parentIndex: The index of the parent node.
        - Returns: The index of the left child node.
    */
  int leftChild(int parentIndex) {
    int index  = (parentIndex * 2)  + 1 ;

    return index;
  }

  /*
        Returns the index of the right child node of a given parent node index.
        - Parameter parentIndex: The index of the parent node.
        - Returns: The index of the right child node.
    */
  int rightChild(int parentIndex) {

    int index  = (parentIndex * 2)  + 2 ;
    return index;
  }

  /* Child classes(MinHeap & MaxHeap) should override this method */
  void heapifyAt(int index);

  /* Child classes(MinHeap & MaxHeap) should override this method */
  void siftUp();

  /* Child classes(MinHeap & MaxHeap) should override this method */
  void siftDown();
}


