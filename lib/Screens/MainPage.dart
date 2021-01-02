import 'package:flutter/material.dart';

import 'package:quizapp_with_api/Screens/QuizPage.dart';

void gotoQuizPage(BuildContext context, name, id) {
  if(id == 1){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => QuizPage( category: 9, difficulty: name)),
    );
  }
  else if(id == 2){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => QuizPage( category: 18, difficulty: name)),
    );
  }
  else if(id == 3){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => QuizPage( category: 22, difficulty: name)),
    );
  }
}


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isVisible = false;
  bool _isVisibleA = false;
  bool _isVisibleB = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellowAccent,
        padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                'Welcome Your Test',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'General Knowledge Test',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: Text('Başla', style: TextStyle(fontSize: 20)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                      visible: _isVisible,
                      child: RaisedButton(
                        onPressed: () {
                          gotoQuizPage(context, 'easy', 1);
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        child: Text('Kolay', style: TextStyle(fontSize: 20)),
                        color: Colors.greenAccent,
                      )
                  ),
                  Visibility(
                      visible: _isVisible,
                      child: RaisedButton(
                        onPressed: () {
                          gotoQuizPage(context, 'medium', 1);
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        child: Text('Orta', style: TextStyle(fontSize: 20)),
                        color: Colors.amber,
                      )
                  ),
                  Visibility(
                      visible: _isVisible,
                      child: RaisedButton(
                        onPressed: () {
                          gotoQuizPage(context, 'hard', 1);
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        child: Text('Zor', style: TextStyle(fontSize: 20)),
                        color: Colors.redAccent,
                      )
                  ),
                ]
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Computer Science Test',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _isVisibleA = !_isVisibleA;
                });
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: const Text('Başla', style: TextStyle(fontSize: 20)),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                      visible: _isVisibleA,
                      child: RaisedButton(
                        onPressed: () {
                          gotoQuizPage(context, 'easy', 2);
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        child: Text('Kolay', style: TextStyle(fontSize: 20)),
                        color: Colors.greenAccent,
                      )
                  ),
                  Visibility(
                      visible: _isVisibleA,
                      child: RaisedButton(
                        onPressed: () {
                          gotoQuizPage(context, 'medium', 2);
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        child: Text('Orta', style: TextStyle(fontSize: 20)),
                        color: Colors.amber,
                      )
                  ),
                  Visibility(
                      visible: _isVisibleA,
                      child: RaisedButton(
                        onPressed: () {
                          gotoQuizPage(context, 'hard', 2);
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        child: Text('Zor', style: TextStyle(fontSize: 20)),
                        color: Colors.redAccent,
                      )
                  ),
                ]
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Geography Test',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _isVisibleB = !_isVisibleB;
                });
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: const Text('Başla', style: TextStyle(fontSize: 20)),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                      visible: _isVisibleB,
                      child: RaisedButton(
                        onPressed: () {
                          gotoQuizPage(context, 'easy', 3);
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        child: Text('Kolay', style: TextStyle(fontSize: 20)),
                        color: Colors.greenAccent,
                      )
                  ),
                  Visibility(
                      visible: _isVisibleB,
                      child: RaisedButton(
                        onPressed: () {
                          gotoQuizPage(context, 'medium', 3);
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        child: Text('Orta', style: TextStyle(fontSize: 20)),
                        color: Colors.amber,
                      )
                  ),
                  Visibility(
                      visible: _isVisibleB,
                      child: RaisedButton(
                        onPressed: () {
                          gotoQuizPage(context, 'hard', 3);
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        child: Text('Zor', style: TextStyle(fontSize: 20)),
                        color: Colors.redAccent,
                      )
                  ),
                ]
            ),
          ],
        ),
      ),
    );
  }
}
