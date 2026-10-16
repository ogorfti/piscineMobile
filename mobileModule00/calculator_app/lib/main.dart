import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(home: HomePage()));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String expression = '0';
  String result = '0';

  void handleButton(String label) {
    // debugPrint('Callback from page $label');
    setState(() {
      if (label == 'AC') {
        expression = result = '0';
      } else if (label == '=') {
        try {
          var parser = GrammarParser();
          var parsedExp = parser.parse(expression);
          var evaluator = RealEvaluator();

          var calculatedValue = evaluator.evaluate(parsedExp);
          calculatedValue.isFinite
              ? result = calculatedValue.toString()
              : result = 'Error';
        } catch (e) {
          result = 'Error';
          debugPrint(e.toString());
        }
      } else if (label == 'C') {
        (expression.length == 1)
            ? expression = '0'
            : expression = expression.substring(0, expression.length - 1);
      } else {
        (expression == '0' &&
                label != '/' &&
                label != '.' &&
                label != '*' &&
                label != '+')
            ? expression = label
            : expression += label;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Align(
        alignment: Alignment.topRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // SizedBox(height: 8,),
            Padding(
              padding: EdgeInsets.only(top: 6, right: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // padding:
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      expression,
                      maxLines: 1,
                      style: TextStyle(color: Colors.blueGrey, fontSize: 34),
                    ),
                  ),
                  Text(
                    result,
                    style: TextStyle(color: Colors.blueGrey, fontSize: 34),
                  ),
                ],
              ),
            ),
            Spacer(),
            ColoredBox(
              color: Colors.blueGrey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CalculatorButton(
                          nbr: '7',
                          onPressed: () {
                            handleButton('7');
                          },
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '8',
                          onPressed: () {
                            handleButton('8');
                          },
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '9',
                          onPressed: () {
                            handleButton('9');
                          },
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: 'C',
                          labelColor: Colors.red.shade900,
                          onPressed: () {
                            handleButton('C');
                          },
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: 'AC',
                          labelColor: Colors.red.shade900,
                          onPressed: () {
                            handleButton('AC');
                          },
                        ),
                      ),
                    ],
                  ),
                  // Divider(color: Colors.black, height: 1, thickness: 0.2),
                  Row(
                    children: [
                      Expanded(
                        child: CalculatorButton(
                          nbr: '4',
                          onPressed: () {
                            handleButton('4');
                          },
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '5',
                          onPressed: () {
                            handleButton('5');
                          },
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '6',
                          onPressed: () {
                            handleButton('6');
                          },
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '+',
                          labelColor: Colors.white,
                          onPressed: () {
                            handleButton('+');
                          },
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '-',
                          labelColor: Colors.white,
                          onPressed: () {
                            handleButton('-');
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CalculatorButton(
                          nbr: '1',
                          onPressed: () {
                            handleButton('1');
                          },
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '2',
                          onPressed: () {
                            handleButton('2');
                          },
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '3',
                          onPressed: () {
                            handleButton('3');
                          },
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '*',
                          labelColor: Colors.white,
                          onPressed: () {
                            handleButton('*');
                          },
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '/',
                          labelColor: Colors.white,
                          onPressed: () {
                            handleButton('/');
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CalculatorButton(
                          nbr: '0',
                          onPressed: () {
                            handleButton('0');
                          },
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '.',
                          onPressed: () {
                            handleButton('.');
                          },
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '00',
                          onPressed: () {
                            handleButton('00');
                          },
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '=',
                          labelColor: Colors.white,
                          onPressed: () {
                            handleButton('=');
                          },
                        ),
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.nbr,
    this.labelColor = const Color(0xFF263238),
    this.onPressed,
  });
  final String nbr;
  final Color labelColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.orientationOf(context);
    // debugPrint('$orientation');

    return TextButton(
      onPressed: () {
        debugPrint('Number $nbr');
        onPressed?.call();
      },
      style: TextButton.styleFrom(
        padding: orientation == Orientation.portrait
            ? EdgeInsets.symmetric(vertical: 20.0)
            : EdgeInsets.symmetric(vertical: 8.0),
      ),
      child: Text(nbr, style: TextStyle(color: labelColor, fontSize: 20)),
    );
  }
}
