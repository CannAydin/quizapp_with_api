import 'package:flutter/material.dart';

import 'package:quizapp_with_api/Screens/ResultPage.dart';
import 'package:quizapp_with_api/Service/QuizManager.dart';
import 'package:quizapp_with_api/Service/Question.dart';

class QuizPage extends StatefulWidget {
  int category;
  String difficulty;
  QuizPage({Key key, this.category, this.difficulty}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  QuizManager _manager = QuizManager();
  Future<void> quizLoader;
  List<Widget> getOptions(Question question) {
    List<Widget> optionButtons = [];
    for(int i = 0; i < question.options.length; i++) {
      optionButtons.add(FlatButton(
        onPressed: () {
          _manager.nextQuestion(_manager.getFirstPartQuestions().options[i].score);
          if(_manager.isFinished()) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => ResultPage(
                  score: _manager.getTotalScore(),
                )));
          }
          setState(() {});
        },
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${_manager.getFirstPartQuestions().options[i].text}',
              style: TextStyle(
                fontSize: 25,
              ),
            )
        ),
      ));
    }
    return optionButtons;
  }
  @override
  void initState() {
    super.initState();
    quizLoader = _manager.LoadQuestions(10, widget.category, widget.difficulty);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: quizLoader,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot){
          if(snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(title: Text('Questions ${_manager.getCurrentId()}/${_manager.totalQuestion()}'),),
              body: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          '${_manager.getFirstPartQuestions().text}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        )
                      ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: getOptions(_manager.getFirstPartQuestions()),
                          ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
            }
      }
      )
    );
  }
}

