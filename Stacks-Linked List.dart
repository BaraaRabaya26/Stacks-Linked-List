//Stacks:
//Challenge 1

import 'dart:io';

void printListInReverse(List<dynamic> inputList) {
  List<dynamic> reversedList = List.from(inputList.reversed);
  
  print("Original List: $inputList");
  print("Reversed List: $reversedList");
}

void main() {
  print("Enter a list of elements separated by commas:");
  String userInput = stdin.readLineSync()!;
  
  List<String> inputListStrings = userInput.split(',');

  List<dynamic> inputList = inputListStrings.map((element) => element.trim()).toList();

  printListInReverse(inputList);
}


//Challenge 2:

bool areBracketsBalanced(String input) {
  List<String> stack = [];

  for (int i = 0; i < input.length; i++) {
    String currentChar = input[i];

    if (currentChar == '(' || currentChar == '[' || currentChar == '{') {
      stack.add(currentChar);
    } else if (currentChar == ')' || currentChar == ']' || currentChar == '}') {
      if (stack.isEmpty) {
        return false; 
      }

      String top = stack.removeLast();
      if (!((currentChar == ')' && top == '(') ||
          (currentChar == ']' && top == '[') ||
          (currentChar == '}' && top == '{'))) {
        return false; 
      }
    }
  }

  return stack.isEmpty; 
}

void main() {
  // Test cases
  print(areBracketsBalanced("()"));         // true
  print(areBracketsBalanced("([])"));       // true
  print(areBracketsBalanced("{[()]}"));     // true
  print(areBracketsBalanced("([{}])"));     // true
  print(areBracketsBalanced("({[()]})"));   // true
  print(areBracketsBalanced("({[()]}"));    // false (غير متوازن)
  print(areBracketsBalanced("([)]"));       // false (غير متوازن)
  print(areBracketsBalanced("()("));        // false (غير متوازن)
}



//Linked List:
//Challenge 1
import 'dart:io';

class Node {
  int data;
  Node? next;

  Node(this.data) {
    this.next = null;
  }
}

class LinkedList {
  Node? head;

  void insert(int data) {
    Node newNode = Node(data);
    newNode.next = head;
    head = newNode;
  }

  void printReverse() {
    printReverseHelper(head);
  }

  void printReverseHelper(Node? node) {
    if (node == null) {
      return;
    }

    printReverseHelper(node.next);

    print(node.data);
  }
}

void main() {
  LinkedList linkedList = LinkedList();

  print("Enter elements to insert into the linked list (enter 'exit' to finish):");
  while (true) {
    String input = stdin.readLineSync()!;
    if (input.toLowerCase() == 'exit') {
      break;
    }

    int element = int.tryParse(input) ?? 0;
    linkedList.insert(element);
  }

  print("Linked List in Reverse Order:");
  linkedList.printReverse();
}



//Challenge 2

import 'dart:io';

class Node {
  int data;
  Node? next;

  Node(this.data) {
    this.next = null;
  }
}

class LinkedList {
  Node? head;

  void insert(int data) {
    Node newNode = Node(data);
    newNode.next = head;
    head = newNode;
  }

  Node? findMiddleNode() {
    if (head == null) {
      return null; // Empty list
    }

    Node? slowPointer = head;
    Node? fastPointer = head;

    while (fastPointer != null && fastPointer.next != null) {
      slowPointer = slowPointer!.next;
      fastPointer = fastPointer.next!.next;
    }

    return slowPointer;
  }
}

void main() {
  LinkedList linkedList = LinkedList();

 
  print("Enter elements to insert into the linked list (enter 'exit' to finish):");
  while (true) {
    String input = stdin.readLineSync()!;
    if (input.toLowerCase() == 'exit') {
      break;
    }

    int element = int.tryParse(input) ?? 0;
    linkedList.insert(element);
  }

 
  Node? middleNode = linkedList.findMiddleNode();
  if (middleNode != null) {
    print("Middle Node: ${middleNode.data}");
  } else {
    print("The list is empty.");
  }
}

//Challenge 3:

import 'dart:io';

class Node {
  int data;
  Node? next;

  Node(this.data) {
    this.next = null;
  }
}

class LinkedList {
  Node? head;

  void insert(int data) {
    Node newNode = Node(data);
    newNode.next = head;
    head = newNode;
  }

  void reverse() {
    Node? current = head;
    Node? prev = null;
    Node? nextNode = null;

    while (current != null) {
      nextNode = current.next;
      current.next = prev;
      prev = current;
      current = nextNode;
    }

    head = prev;
  }

  void printList() {
    Node? temp = head;
    while (temp != null) {
      stdout.write("${temp.data} -> ");
      temp = temp.next;
    }
    stdout.write("null\n");
  }
}

void main() {
  LinkedList linkedList = LinkedList();

  
  print("Enter elements to insert into the linked list (enter 'exit' to finish):");
  while (true) {
    String input = stdin.readLineSync()!;
    if (input.toLowerCase() == 'exit') {
      break;
    }

    int element = int.tryParse(input) ?? 0;
    linkedList.insert(element);
  }

  
  print("Original Linked List:");
  linkedList.printList();

 
  linkedList.reverse();

 
  print("Reversed Linked List:");
  linkedList.printList();
}


//Challenge 4:

import 'dart:io';

class Node {
  int data;
  Node? next;

  Node(this.data) {
    this.next = null;
  }
}

class LinkedList {
  Node? head;

  void insert(int data) {
    Node newNode = Node(data);
    newNode.next = head;
    head = newNode;
  }

  void removeOccurrences(int target) {
    
    if (head == null) {
      return;
    }

  
    while (head != null && head!.data == target) {
      head = head!.next;
    }

    Node? current = head;


    while (current != null && current.next != null) {
      if (current.next!.data == target) {
        current.next = current.next!.next;
      } else {
        current = current.next;
      }
    }
  }

  void printList() {
    Node? temp = head;
    while (temp != null) {
      stdout.write("${temp.data} -> ");
      temp = temp.next;
    }
    stdout.write("null\n");
  }
}

void main() {
  LinkedList linkedList = LinkedList();

  print("Enter elements to insert into the linked list (enter 'exit' to finish):");
  while (true) {
    String input = stdin.readLineSync()!;
    if (input.toLowerCase() == 'exit') {
      break;
    }

    int element = int.tryParse(input) ?? 0;
    linkedList.insert(element);
  }

 
  print("Original Linked List:");
  linkedList.printList();

  
  print("Enter the element to remove from the linked list:");
  int targetElement = int.tryParse(stdin.readLineSync()!) ?? 0;

  linkedList.removeOccurrences(targetElement);


  print("Linked List after Removing Occurrences of $targetElement:");
  linkedList.printList();
}


