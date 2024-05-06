
import 'package:heap/src/min_heap.dart';
import 'package:heap/src/max_heap.dart';
import 'package:test/test.dart';


void main() {
  testHeap();
}

void testHeap() {
  group('MinHeap & MaxHeap', () {
    test('MinHeap & MaxHeap are created and basic push and pop ', () {
      List<int> data = [4, 2, 7, 1, 9, 3];
      MinHeap<num> minHeap = MinHeap(data.toList());
      MaxHeap<num> maxHeap = MaxHeap(data.toList());
      minHeap.push(0);
      expect(minHeap.pop()!, equals(0));
      print(minHeap.pop()!);
      maxHeap.push(15);
      expect(maxHeap.pop()!, equals(15));
      expect(maxHeap.pop()!, equals(9));
    });

    test('Test edge cases', () {
      MinHeap<num> emptyMinHeap = MinHeap([]);
      expect(emptyMinHeap.pop(), equals(null));

      MaxHeap<num> emptyMaxHeap = MaxHeap([]);
      expect(emptyMaxHeap.pop(), equals(null));

      MinHeap<num> singleElementMinHeap = MinHeap([5]);
      expect(singleElementMinHeap.pop()!, equals(5));

      MaxHeap<num> singleElementMaxHeap = MaxHeap([5]);
      expect(singleElementMaxHeap.pop()!, equals(5));
    });

    test('Test heap properties', () {
      List<int> data2 = [5, 3, 8, 1, 10];
      MinHeap<num> minHeap2 = MinHeap(data2.toList());
      expect(minHeap2.pop()!, equals(1));
      MaxHeap<num> maxHeap2 = MaxHeap(data2.toList());
      expect(maxHeap2.pop()!, equals(10));

    });

    test('Test with strings', () {
      List<String> stringData = ["banana", "apple", "cherry", "date"];
      MinHeap<String> stringMinHeap = MinHeap(stringData.toList());
      expect(stringMinHeap.pop()!, equals("apple"));

      MaxHeap<String> stringMaxHeap = MaxHeap(stringData.toList());
      expect(stringMaxHeap.pop()!, equals("date"));
    });

    test('Test with custom objects', () {
      List<Person> personData = [Person("Anand", 25), Person("Balu", 30), Person("Chandran", 20)];
      MinHeap<Person> personMinHeap = MinHeap(personData.toList());
      expect(personMinHeap.pop()!.name, equals("Chandran"));

      MaxHeap<Person> personMaxHeap = MaxHeap(personData.toList());
      expect(personMaxHeap.pop()!.name, equals("Balu"));
    });

  });
}


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
