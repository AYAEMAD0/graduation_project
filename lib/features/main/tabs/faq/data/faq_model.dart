class FaqModel {
  final String title;
  final String des;

  FaqModel({required this.title, required this.des});

  static List<FaqModel> data = [
    FaqModel(
      title: "1. What is MockFlow?",
      des:
          "MockFlow is an AI-powered platform that helps you practice job interviews through realistic simulations and personalized feedback.",
    ),
    FaqModel(
      title: "2. How does the app work?",
      des:
          "You upload your CV and job description, then the system generates tailored interview questions and simulates a real interview session",
    ),
    FaqModel(
      title: "3. Is the interview experience realistic ?",
      des:
          "Yes, the app simulates real interview conditions including timed questions and interactive responses to help you prepare effectively.",
    ),
    FaqModel(
      title: "4. How does artificial intelligence evaluate my performance?",
      des:
          "The AI analyzes your answers based on: Technical accuracy,Communication skills Confidence and clarity.",
    ),
    FaqModel(
      title: "5. Can I track my progress over time?",
      des:
          "Yes, the app stores your past interviews and displays your progress, scores, and improvements.",
    ),
    FaqModel(
      title: "6. What distinguishes MockFlow from other platforms?",
      des:
          "Generates personalized questions , Simulates real interviews , Provides instant AI feedback",
    ),
  ];
}
