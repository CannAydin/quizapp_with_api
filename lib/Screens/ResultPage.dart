import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  int score;
  ResultPage({Key key, this.score}) : super(key: key);
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        backgroundColor: widget.score >= 51 ? Colors.greenAccent.shade700 : Colors.redAccent.shade700,
      ),
      body: Container(
        color: widget.score >= 51 ? Colors.greenAccent : Colors.redAccent,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 50),
              child: Text(
                widget.score >= 50 ? 'Congratulations' : 'Try Again',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                'You got the exam',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Score: ${widget.score}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
    );
  }
}
