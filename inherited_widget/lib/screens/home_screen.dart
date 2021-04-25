import 'package:flutter/material.dart';
import 'package:inherited_widget/screens/color_screen.dart';
import 'package:inherited_widget/widgets/inherited_widget.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({
    Key key,
    @required this.title,
  }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void incrementCounter() {
    final provider = StateInheritedWidget.of(context);
    provider.increment();
  }

  @override
  Widget build(BuildContext context) {
    final counter = StateInheritedWidget.of(context).state.counter;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$counter',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
              ),
            ),
            MaterialButton(
              onPressed: incrementCounter,
              child: Text('increment'),
              color: Colors.red,
              textColor: Colors.white,
            ),
            MaterialButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ColorScreen())),
              child: Text('color'),
              color: Colors.red,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
