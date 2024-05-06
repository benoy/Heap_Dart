import 'dart:core';
import 'Heap.dart';

class MaxHeap<T extends Comparable<T>> extends Heap<T> {

  MaxHeap(List<T> data) : super(data);

/*
         Recursively adjusts the heap structure downwards from a given index to maintain the heap property.
         - Parameter index: The index to start heapifying from.
  */
  @override
  void heapifyAt(int index) {
    int left = leftChild(index);
    int right = rightChild(index);
    int largest = index;

    if (left < data.length && data[left].compareTo(data[largest]) > 0) { largest = left; }
    if (right < data.length && data[right].compareTo(data[largest]) > 0) { largest = right; }
    if (largest != index) {
      swapAt(largest, index);
      heapifyAt(largest);
    }
  }

  /* Adjusts the heap structure downwards from a given index to maintain the heap property. */
  @override
  void siftDown() {
    int index = 0;
    while (true) {
      int left = leftChild(index);
      int right = rightChild(index);
      int largest = index;
      if (left < data.length && data[left].compareTo(data[largest]) > 0) { largest = left; }
      if (right < data.length && data[right].compareTo(data[largest]) > 0) { largest = right; }
      if (largest == index)  { return; }
          swapAt(largest, index);
          index = largest;
      }
  }

  /* Adjusts the heap structure upwards from a given index to maintain the heap property. */
  @override
  void siftUp() {
    int child = data.length - 1;
    int parent = parentIndex(child);

    while (child > 0 && data[child].compareTo(data[parent]) > 0) {
      swapAt(child, parent);
      child = parent;
      parent = parentIndex(child);
    }
  }
}