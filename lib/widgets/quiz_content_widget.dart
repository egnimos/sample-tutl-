import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/question_answer.dart';
import '../screens/result_page_screen.dart';

import '../providers/quiz_answer_provider.dart';



class QuizContentWidget extends StatefulWidget {
  const QuizContentWidget({Key key}) : super(key: key);

  @override
  _QuizContentWidgetState createState() => _QuizContentWidgetState();
}

class _QuizContentWidgetState extends State<QuizContentWidget> {

  Color colorToShow = Colors.indigoAccent;
    Color right = Colors.green;
    Color wrong = Colors.red;
    int marks = 0;
    int i = 0;
    int timer = 30;
    String showTimer = "30";
    
    Map<String, Color> btnColor = {
      'a': Colors.indigoAccent,
      'b': Colors.indigoAccent,
      'c': Colors.indigoAccent,
      'd': Colors.indigoAccent,
    };
    
    // Map<String, String> options;
    // String answer;
    
    bool cancelTimer = false;
    
    var _isInit = true;

    List<QuestionAnswer> questionData; 

    
   @override 
   void initState() {
      startTimer();
      super.initState();
   }


      // overriding the setstate function to be called only if mounted
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
    
    
    @override
    void didChangeDependencies() {
      if(_isInit) {
        
        questionData = Provider.of<QuizAnswerProvider>(context).queAns.where((ques) => ques.qcId == 'q1').toList();
        
        // print(i);
        // answer = questionData[i].answer;
        // options = questionData[i].options;
        
      }
      _isInit = false;
      super.didChangeDependencies();
    }
    
    //clock method
    void startTimer() async {
      
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (cancelTimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showTimer = timer.toString();
      });
    });
      
      
    }
    
    
    //next Question
     void nextquestion() {
    cancelTimer = false;
    timer = 30;
    setState(() {
      if (i < questionData.length-1) {
//         i = random_array[j];
        print(questionData.length);
        print(i);
        i++;
      } else {

         Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultPageScreen(),
        ));
       
    

      }
      btnColor["a"] = Colors.indigoAccent;
      btnColor["b"] = Colors.indigoAccent;
      btnColor["c"] = Colors.indigoAccent;
      btnColor["d"] = Colors.indigoAccent;
    });
    startTimer();
  }

  
    
    
    //check the correct answer
      void checkanswer(String k) {
    
    if (questionData[i].options[k] == questionData[i].answer) {
  
      marks = marks + 5;
   
      colorToShow = right;
    } else {
      
      colorToShow = wrong;
    }
    setState(() {
      
      btnColor[k] = colorToShow;
      cancelTimer = true;
    });

    Timer(Duration(seconds: 1), nextquestion);
  }
    

    
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

    
    
    body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height-30,
          child: Column(
          children: <Widget>[
            
            //question
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomLeft,
                child: Text(
                  questionData[i].question,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            
            //options
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    choiceOptions('a'),
                    choiceOptions('b'),
                    choiceOptions('c'),
                    choiceOptions('d'),

                  ],
                ),
              ),
            ),
            
            //timer
            Expanded(
              flex: 1,
              child: Container(
               alignment: Alignment.topCenter,
               child: Center(
                 child: Text(
                   showTimer,
                   style: TextStyle(
                     fontSize: 35.0,
                     fontWeight: FontWeight.w700,  // colorToShow = colorToShow;
                   ),
                 ),
               ),
              ),
            ),

          ],
        ),
    )
    );
  }

  Padding choiceOptions(String k) {
    return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15.0,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      print(questionData[i].options[k]);
                      checkanswer(k);
                    } ,
                    child: Text(
                      questionData[i].options[k],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                    ),
                    color: btnColor[k],
                    splashColor: Colors.indigo[700],
                    highlightColor: Colors.indigo[700],
                    minWidth: 200.0,
                    height: 45.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),

                );
    }
    
    
    
  }

  
  
  