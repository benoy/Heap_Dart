import 'dart:core';
import 'Heap.dart';

class MinHeap<T extends Comparable<T>> extends Heap<T> {

  MinHeap(List<T> data) : super(data);

  /* Adjusts the heap structure downwards from a given index to maintain the heap property. */
  @override
  void heapifyAt(int index) {
    int left = leftChild(index);
    int right = rightChild(index);
    int smallest = index;

    if (left < data.length && data[left].compareTo(data[smallest]) < 0) { smallest = left; }
    if (right < data.length && data[right].compareTo(data[smallest]) < 0) { smallest = right; }
    if (smallest != index) {
      swapAt(smallest, index);
      heapifyAt(smallest);
    }
  }

  /* Adjusts the heap structure upwards from a given index to maintain the heap property. */
  @override
  void siftDown() {
    int index = 0;
    while (true) {
      int left = leftChild(index);
      int right = rightChild(index);
      int smallest = index;
      if (left < data.length && data[left].compareTo(data[smallest]) < 0) { smallest = left; }
      if (right < data.length && data[right].compareTo(data[smallest]) < 0) { smallest = right; }
      if (smallest == index)  { return; }
      swapAt(smallest, index);
      index = smallest;
    }
  }

  /* Adjusts the heap structure upwards from a given index to maintain the heap property. */
  @override
  void siftUp() {
    int child = data.length - 1;
    int parent = parentIndex(child);
    while (child > 0 && data[child].compareTo(data[parent]) < 0) {
      super.swapAt(child, parent);
      child = parent;
      parent = parentIndex(child);
    }
  }
}