import 'dart:collection';

import 'package:flag_quiz/Flagsdao.dart';
import 'package:flag_quiz/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'Flags.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var questions = <Flags>[];
  var wrongChoices =<Flags>[];
  Flags  ?rightQuestion;
  var allChoices = HashSet<Flags>();

  int questionCounter = 0;
  int rightCounter = 0;
  int wrongCounter = 0;

  String flagPicName = "placeholder.png";
  String butonAtext = "";
  String butonBtext = "";
  String butonCtext = "";
  String butonDtext = "";

  @override
  void initState() {
    super.initState();
    questionGet();

  }

  Future<void> questionGet() async{
    questions = await Flagsdao().randomGet();
    questionLoad();
  }

  Future<void> questionLoad() async {
    rightQuestion = questions[questionCounter];

    flagPicName = rightQuestion!.flag_pic;

    wrongChoices = await Flagsdao().random3Get(rightQuestion!.flag_id);

    allChoices.clear();
    allChoices.add(rightQuestion!);
    allChoices.add(wrongChoices[0]);
    allChoices.add(wrongChoices[1]);
    allChoices.add(wrongChoices[2]);

    butonAtext = allChoices
        .elementAt(0)
        .flag_name;
    butonBtext = allChoices
        .elementAt(1)
        .flag_name;
    butonCtext = allChoices
        .elementAt(2)
        .flag_name;
    butonDtext = allChoices
        .elementAt(3)
        .flag_name;

    setState(() {});
  }

    void questionCounterControl() async {
      questionCounter = questionCounter + 1;
      if (questionCounter != 5) {
        questionLoad();
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => ResultScreen(trueNumber: rightCounter,)));
      }
    }

    void trueControl(String buttonText) {
      if (rightQuestion!.flag_name == buttonText) {
        rightCounter = rightCounter + 1;
      } else {
        wrongCounter = wrongCounter + 1;
      }
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Quiz Screen"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                        "True : $rightCounter", style: TextStyle(fontSize: 18)),
                    Text("False : $wrongCounter",
                        style: TextStyle(fontSize: 18)),
                  ]
              ),

              questionCounter != 5 ? Text("${questionCounter + 1}. Question",
                style: TextStyle(fontSize: 30),) :
              Text("5. Question", style: TextStyle(fontSize: 30),),

              Image.asset("photos/$flagPicName"),
              SizedBox(height: 50, width: 250,
                child: ElevatedButton(
                  child: Text(butonAtext),
                  onPressed: () {
                    trueControl(butonAtext);
                    questionCounterControl();
                  },
                ),
              ),

              SizedBox(height: 50, width: 250,
                child: ElevatedButton(
                  child: Text(butonBtext),
                  onPressed: () {
                    trueControl(butonBtext);
                    questionCounterControl();
                  },
                ),
              ),

              SizedBox(height: 50, width: 250,
                child: ElevatedButton(
                  child: Text(butonCtext),
                  onPressed: () {
                    trueControl(butonCtext);
                    questionCounterControl();
                  },
                ),
              ),

              SizedBox(height: 50, width: 250,
                child: ElevatedButton(
                  child: Text(butonDtext),
                  onPressed: () {
                    trueControl(butonDtext);
                    questionCounterControl();

                  },
                ),
              ),


            ],
          ),
        ),
      );
    }

}
