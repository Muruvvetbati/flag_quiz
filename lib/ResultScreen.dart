import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {

  int trueNumber;

  ResultScreen({ required this.trueNumber});


  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("${widget.trueNumber} TRUE ${5-widget.trueNumber} FALSE",style:TextStyle(fontSize:30)),
            Text(" % ${((widget.trueNumber*100)/5).toInt()} SUCCESS",style:TextStyle(fontSize:30,color: Colors.pinkAccent)),
            SizedBox(height: 50,width: 250,
              child: ElevatedButton(
                child: Text("TRY AGAIN"),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
