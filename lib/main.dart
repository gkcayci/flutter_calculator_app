import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/CalculatorButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    setState(() {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calculator',
        home: Scaffold(
          backgroundColor: Color(0xFF283637),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(fontSize: 24),
                      color: Color(0XFF5456F61),
                    ),
                  ),
                  alignment: Alignment(1, 1),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(fontSize: 48),
                      color: Colors.white,
                    ),
                  ),
                  alignment: Alignment(1, 1),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(
                      text: 'AC',
                      fillColor: 0XFF6C807F,
                      textSize: 20,
                      callback: allClear,
                    ),
                    CalculatorButton(
                      text: 'C',
                      fillColor: 0XFF6C807F,
                      callback: clear,
                    ),
                    CalculatorButton(
                      text: '%',
                      fillColor: 0XFFFFFFFF,
                      textColor: 0XFF0080FF,
                      callback: numClick,
                    ),
                    CalculatorButton(
                      text: '/',
                      fillColor: 0XFFFFFFFF,
                      textColor: 0XFF0080FF,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(
                      text: '7',
                      callback: numClick,
                    ),
                    CalculatorButton(
                      text: '8',
                      callback: numClick,
                    ),
                    CalculatorButton(
                      text: '9',
                      callback: numClick,
                    ),
                    CalculatorButton(
                      text: '*',
                      fillColor: 0XFFFFFFFF,
                      textColor: 0XFF0080FF,
                      textSize: 24,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(
                      text: '4',
                      callback: numClick,
                    ),
                    CalculatorButton(
                      text: '5',
                      callback: numClick,
                    ),
                    CalculatorButton(
                      text: '6',
                      callback: numClick,
                    ),
                    CalculatorButton(
                      text: '-',
                      fillColor: 0XFFFFFFFF,
                      textColor: 0XFF0080FF,
                      textSize: 38,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(
                      text: '1',
                      callback: numClick,
                    ),
                    CalculatorButton(
                      text: '2',
                      callback: numClick,
                    ),
                    CalculatorButton(
                      text: '3',
                      callback: numClick,
                    ),
                    CalculatorButton(
                      text: '+',
                      fillColor: 0XFFFFFFFF,
                      textColor: 0XFF0080FF,
                      textSize: 30,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(
                      text: '.',
                      callback: numClick,
                    ),
                    CalculatorButton(
                      text: '0',
                      callback: numClick,
                    ),
                    CalculatorButton(
                      text: '00',
                      textSize: 26,
                      callback: numClick,
                    ),
                    CalculatorButton(
                      text: '=',
                      fillColor: 0XFFFFFFFF,
                      textColor: 0XFF0080FF,
                      callback: evaluate,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
