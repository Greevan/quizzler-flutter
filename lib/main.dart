import 'package:flutter/material.dart';
import 'QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Widget> scoreKeeper = [];
  // List<String> questions = [
  //   'Question 1(true)',
  //   'Question 2(false)',
  //   'Question 3(false)',
  //   'Question 4(true)',
  //   'Question 5(false)'
  // ];
  // List<bool> answers = [true, false, false, true, false];
  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    // int totalQuestion = questions.length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(fontSize: 20.0)),
              onPressed: () {
                // quizBrain.QuestionBank[questionNumber].answer= true;/*This line makes the code not work like intended. so comes the concept of Encapsulation.*/
                checkAns(true);
                setState(() {
                });
              },
              child: const Text('True'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  textStyle: const TextStyle(fontSize: 20.0)),
              onPressed: () {
                checkAns(false);
                setState(() {
                });
              },
              child: const Text('False'),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: scoreKeeper,
          ),
        )
      ],
    );
  }
  void checkAns(bool userPickedAns) {
    bool correctAnswer = quizBrain.getAnswer();
    if (correctAnswer == userPickedAns) {
      print('${quizBrain.getQuestionNumber()+1} User got it right!');
      scoreKeeper.add(const Icon(Icons.check,color: Colors.green,));
    } else {
      print('${quizBrain.getQuestionNumber()+1} User got it wrong');
      scoreKeeper.add(const Icon(Icons.close,color: Colors.red,));
    }
    if (quizBrain.getQuestionNumber() == quizBrain.getQuestionCount() - 1) {
      // All questions have been answered, show the alert popup
      showQuizCompletedAlert(context);
    } else {
      setState(() {
        quizBrain.nextQuestion();
      });
    }
  }


  void showQuizCompletedAlert(BuildContext context) {
    Alert(
      context: context,
      title: 'Quiz Completed',
      desc: 'Congratulations! You have completed the quiz.',
      buttons: [
        DialogButton(
          onPressed: () {
            // Reset the scoreKeeper and questionNumber
            setState(() {
              scoreKeeper.clear();
              quizBrain.reset();
            });

            // Close the alert dialog
            Navigator.pop(context);
          },
          color: Colors.green,
          child: const Text(
            'Restart',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    ).show();
  }

}
