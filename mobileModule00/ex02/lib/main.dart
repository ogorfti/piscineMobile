import 'package:flutter/material.dart';

void main() {
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(home: HomePage()));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  Text(
                    '0',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 28),
                  ),
                  Text(
                    '0',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 28),
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
                      Expanded(child: CalculatorButton(nbr: '7')),
                      Expanded(child: CalculatorButton(nbr: '8')),
                      Expanded(child: CalculatorButton(nbr: '9')),
                      Expanded(
                        child: CalculatorButton(
                          nbr: 'C',
                          labelColor: Colors.red.shade900,
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: 'AC',
                          labelColor: Colors.red.shade900,
                        ),
                      ),
                    ],
                  ),
                  // Divider(color: Colors.black, height: 1, thickness: 0.2),
                  Row(
                    children: [
                      Expanded(child: CalculatorButton(nbr: '4')),
                      Expanded(child: CalculatorButton(nbr: '5')),
                      Expanded(child: CalculatorButton(nbr: '6')),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '+',
                          labelColor: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '-',
                          labelColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: CalculatorButton(nbr: '1')),
                      Expanded(child: CalculatorButton(nbr: '2')),
                      Expanded(child: CalculatorButton(nbr: '3')),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '*',
                          labelColor: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '/',
                          labelColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: CalculatorButton(nbr: '0')),
                      Expanded(child: CalculatorButton(nbr: '.')),
                      Expanded(child: CalculatorButton(nbr: '00')),
                      Expanded(
                        child: CalculatorButton(
                          nbr: '=',
                          labelColor: Colors.white,
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
  });
  final String nbr;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.orientationOf(context);
    // debugPrint('$orientation');

    return TextButton(
      onPressed: () {
        debugPrint('Number $nbr');
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
