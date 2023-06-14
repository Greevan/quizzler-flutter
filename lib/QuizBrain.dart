import 'question.dart';
class QuizBrain{
  int _questionNumber =0;
  final List<Questions> _questionBank =[
    Questions('Is humans a mammal?', true),
    Questions('Laptop is another word for PC?', false),
    Questions('Is the sky blue?', true),
    Questions('Is water a solid?', false),
    Questions('Does the sun rise in the east?', true),
    Questions('Is 2 + 2 equal to 5?', false),
    Questions('Is the Earth flat?', false),
    Questions('Is chocolate made from cocoa beans?', true),
    Questions('Is New York the capital of the United States?', false),
    Questions('Is the moon larger than the Earth?', false),
    Questions('Is English the most spoken language in the world?', false),
    Questions('Is a tomato a fruit?', true),
    Questions('Is gravity a force?', true),
    Questions('Is the Great Wall of China visible from space?', false),
    Questions('Is the speed of light faster than the speed of sound?', true),
    Questions('Is the Earth the third planet from the Sun?', true),
    Questions('Is pi (π) a rational number?', false),
    Questions('Is the iPhone made by Apple?', true),
    Questions('Is the Pacific Ocean the largest ocean?', true),
    Questions('Is the Statue of Liberty located in Paris?', false),];

  void nextQuestion(){
    if(_questionNumber<_questionBank.length-1){
      _questionNumber++;
    }
  }
  void reset(){
    _questionNumber=0;
  }
  String getQuestion(){
    return _questionBank[_questionNumber].questionText;
  }
  bool getAnswer(){
    return _questionBank[_questionNumber].answer;
  }
  int getQuestionNumber(){
    return _questionNumber;
  }
  int getQuestionCount(){
    return _questionBank.length;
  }
}