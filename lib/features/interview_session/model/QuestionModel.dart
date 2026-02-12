class QuestionModel {
  final String question;
  final List<String> options;

  QuestionModel({
    required this.question,
    required this.options,
  });

   static final List<QuestionModel> questions = [

  QuestionModel(
    question: "1) Which data structure uses FIFO?",
    options: ["Stack", "Queue", "Tree", "Graph"],
  ),

  QuestionModel(
    question: "2) Which data structure uses LIFO?",
    options: ["Queue", "Stack", "Array", "Heap"],
  ),

  QuestionModel(
    question: "3) Which algorithm is used in Binary Search?",
    options: [
      "Divide and Conquer",
      "Greedy",
      "Dynamic Programming",
      "Backtracking"
    ],
  ),

  QuestionModel(
    question: "4) What is the time complexity of Binary Search?",
    options: ["O(n)", "O(log n)", "O(n log n)", "O(1)"],
  ),

  QuestionModel(
    question: "5) Which data structure is used for recursion?",
    options: ["Queue", "Stack", "Linked List", "Tree"],
  ),

  QuestionModel(
    question: "6) Which structure is used in BFS algorithm?",
    options: ["Stack", "Queue", "Tree", "Graph"],
  ),

  QuestionModel(
    question: "7) Which structure is used in DFS algorithm?",
    options: ["Queue", "Stack", "Array", "Heap"],
  ),

  QuestionModel(
    question: "8) What is the worst case of Quick Sort?",
    options: ["O(n)", "O(n log n)", "O(n²)", "O(log n)"],
  ),

  QuestionModel(
    question: "9) Which data structure allows duplicate elements?",
    options: ["Set", "Map", "List", "HashSet"],
  ),

  QuestionModel(
    question: "10) Which structure represents hierarchical data?",
    options: ["Array", "Stack", "Tree", "Queue"],
  ),

  QuestionModel(
    question: "11) What is the time complexity of accessing an element in an array?",
    options: ["O(1)", "O(n)", "O(log n)", "O(n²)"],
  ),

  QuestionModel(
    question: "12) Which data structure uses key-value pairs?",
    options: ["Stack", "Queue", "Map", "Tree"],
  ),

];

}
