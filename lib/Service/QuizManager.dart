
import 'Question.dart';
import 'Option.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as converter;
import 'package:html_unescape/html_unescape.dart';

class QuizManager {
  QuizManager() {

  }

  Future<void> LoadQuestions(int numberOfQuestions, int category, String difficulty) async {
    var url = 'https://opentdb.com/api.php?amount=$numberOfQuestions&category=$category&difficulty=$difficulty&type=multiple';
    var response = await http.get(url);
    print(response.statusCode);
    if(response.statusCode == 200 ) {
      Map<String, dynamic> json = converter.jsonDecode(response.body);
      print(json['response.code']);
      print(json['results'][0]);
      for( var questionFromServer in json['results']) {
        var unescape = new HtmlUnescape();
        List<Option> options = [];
        options.add(Option(unescape.convert(questionFromServer['correct_answer']), 10));
        for(var falseAnswer in questionFromServer['incorrect_answers']){
          options.add(Option(unescape.convert(falseAnswer), 0));
        }
        Question question = Question(unescape.convert(questionFromServer['question']), options);
        _questions.add(question);
      }
    }
    for (var question in _questions) {
      question.options.shuffle();
    }
  }


  List<Question> _questions = [];
  int _score = 0;
  int currentQuestionId = 0;
  int _flutterQuizScore = 0;
  int flutterQuizCurrentId = 4;
  void nextQuestion(score) {
    if(currentQuestionId < _questions.length) {
      _score += score;
      currentQuestionId++;
    }
  }
  void nextQuestionforSecondQuiz(score) {
    if(flutterQuizCurrentId < _questions.length) {
      _flutterQuizScore += score;
      flutterQuizCurrentId++;
    }
  }

  int getTotalScore() => _score;
  int getCurrentId() => currentQuestionId + 1;
  int totalQuestion() => _questions.length;

  int getSecondScore() => _flutterQuizScore;
  int getSecondQuizId() => flutterQuizCurrentId - 3;

  bool isFinished() {
    return (currentQuestionId >= _questions.length);
  }

  Question getFirstPartQuestions() {
    if(currentQuestionId < _questions.length) {
      return _questions[currentQuestionId];
    } else {
      return Question('', []);
    }
  }
  Question getSecondPartQuestions() {
    if(flutterQuizCurrentId < _questions.length) {
      return _questions[flutterQuizCurrentId];
    } else {
      return Question('', []);
    }
  }
}