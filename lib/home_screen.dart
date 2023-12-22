import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/MyButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var userInput = ' ';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Text(' ${userInput.toString() }',style: TextStyle(fontSize: 30,color: Colors.white),)),

                  SizedBox(height: 20,),
                  Text(answer.toString(),style: TextStyle(fontSize: 30,color: Colors.white),),
                  SizedBox(height: 20,),

                ],

              ),
            ),

            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      MyButtons(title: 'AC', onPress: () {
                        userInput = '';
                        answer = '';
                        setState(() {

                        });

                      },),
                      MyButtons(title: '+/-', onPress: () {
                        userInput += '+/-';
                        setState(() {

                        });
                      },),
                      MyButtons(title: '%', onPress: () {
                        userInput += '%';
                        setState(() {

                        });
                      },),
                      MyButtons(title: '/',color: Color(0xffffa00a ), onPress: () {
                        userInput += '/';
                        setState(() {

                        });
                      },)
                    ],
                  ),
                  Row(
                    children: [
                      MyButtons(title: '7', onPress: () {
                        userInput += '7';
                        setState(() {

                        });
                      },),
                      MyButtons(title: '8', onPress: () {
                        userInput += '8';
                        setState(() {

                        });
                      },),
                      MyButtons(title: '9', onPress: () {
                        userInput += '9';
                        setState(() {

                        });
                      },),
                      MyButtons(title: 'x',color: Color(0xffffa00a ), onPress: () {
                        userInput += 'x';
                        setState(() {

                        });
                      },)
                    ],
                  ),
                  Row(
                    children: [
                      MyButtons(title: '4', onPress: () {
                        userInput += '4';
                        setState(() {

                        });
                      },),
                      MyButtons(title: '5', onPress: () {
                        userInput += '5';
                        setState(() {

                        });
                      },),
                      MyButtons(title: '6', onPress: () {
                        userInput += '6';
                        setState(() {

                        });
                      },),
                      MyButtons(title: '-',color: Color(0xffffa00a ), onPress: () {
                        userInput += '-';
                        setState(() {

                        });
                      },)
                    ],
                  ),
                  Row(
                    children: [
                      MyButtons(title: '1', onPress: () {
                        userInput += '1';
                        setState(() {

                        });
                      },),
                      MyButtons(title: '2', onPress: () {
                        userInput += '2';
                        setState(() {

                        });
                      },),
                      MyButtons(title: '3', onPress: () {
                        userInput += '3';
                        setState(() {

                        });
                      },),
                      MyButtons(title: '+',color: Color(0xffffa00a ), onPress: () {
                        userInput += '+';
                        setState(() {

                        });
                      },)
                    ],
                  ),
                  Row(
                    children: [
                      MyButtons(title: '0', onPress: () {
                        userInput += '0';
                      setState(() {

                      }); },),
                      MyButtons(title: '.', onPress: () {
                        userInput += '.';
                      setState(() {

                      }); },),
                      MyButtons(title: 'DEL', onPress: () {
                        userInput = userInput.substring(0, userInput.length- 1) ;
                        setState(() {

                        });
                      },),
                      MyButtons(title: '=',color: Color(0xffffa00a ), onPress: () {
                       equelPress();
                        setState(() {

                        });
                      },)
                    ],
                  ),
                ],
              ),
            )

          ],
          ),
      ),

    );
  }

  void equelPress (){
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();



  }

}
