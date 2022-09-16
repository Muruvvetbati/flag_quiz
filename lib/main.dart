import 'package:flag_quiz/QuizScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
           Text("WELCOME TO THE QUIZE",style: TextStyle(
             fontSize: 25,fontWeight: FontWeight.bold
           ),),
            SizedBox(height: 50,width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text("START"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen()));
                },
              ),
            )

          ],
        ),
      ),
         );
  }
}
