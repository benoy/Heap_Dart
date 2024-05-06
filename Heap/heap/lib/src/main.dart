
import 'dart:core';
import 'heap.dart';
import 'max_heap.dart';
import 'min_heap.dart';

class Person implements Comparable<Person>  {
  String name = "";
  int age = 0;

  Person(String name, int age) {
    this.name = name;
    this.age = age;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Person && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  int compareTo(Person other) {
    return age.compareTo(other.age);
  }

}

void main() {
  List<int> data = [4, 2, 7, 1, 9, 3];

  MinHeap<num> minHeap = MinHeap(data.toList());
  MaxHeap<num> maxHeap = MaxHeap(data.toList());

  print("MinHeap & MaxHeap are created");

  minHeap.push(0);
  print(minHeap.pop()!); // Output should be 0
  print(minHeap.pop()!); // Output should be 1


  maxHeap.push(15);
  print(maxHeap.pop()!); // Output should be 15
  print(maxHeap.pop()!); // Output should be 9

  // Test Case 2: Test edge cases
  MinHeap<num> emptyMinHeap = MinHeap([]);
  print(emptyMinHeap.pop()); // Output should be null

  MaxHeap<num> emptyMaxHeap = MaxHeap([]);
  print(emptyMaxHeap.pop()); // Output should be nil

  MinHeap<num> singleElementMinHeap = MinHeap([5]);
  print(singleElementMinHeap.pop()!); // Output should be 5

  MaxHeap<num> singleElementMaxHeap = MaxHeap([5]);
  print(singleElementMaxHeap.pop()!); // Output should be 5

// Test Case 3: Test heap properties
  List<int> data2 = [5, 3, 8, 1, 10];
  MinHeap<num> minHeap2 = MinHeap(data2.toList());
  print(minHeap2.pop()!); // Output should be 1


  MaxHeap<num> maxHeap2 = MaxHeap(data2.toList());
  print(maxHeap2.pop()!); // Output should be 10


// Test Case 4: Test with strings
  List<String> stringData = ["banana", "apple", "cherry", "date"];
  MinHeap<String> stringMinHeap = MinHeap(stringData.toList());
  print(stringMinHeap.pop()!); // Output should be "apple"

  MaxHeap<String> stringMaxHeap = MaxHeap(stringData.toList());
  print(stringMaxHeap.pop()!); // Output should be "date"

// Test Case 5: Test with custom objects

  List<Person> personData = [Person("Anand", 25), Person("Balu", 30), Person("Chandran", 20)];
  MinHeap<Person> personMinHeap = MinHeap(personData.toList());
  print(personMinHeap.pop()!.name); // Output should be 'Chandran'

  MaxHeap<Person> personMaxHeap = MaxHeap(personData.toList());
  print(personMaxHeap.pop()!.name); // Output should be "Balu"

}


/*
Expected output

0
1
15
9
nil
nil
5
5
1
10
apple
date
Chandran
Balu
 */