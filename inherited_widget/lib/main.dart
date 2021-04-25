import 'package:flutter/material.dart';
import 'package:inherited_widget/widgets/inherited_widget.dart';
import 'screens/screens.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StateWidget(
      child: Builder(
        builder: (context) {
          final provider = StateInheritedWidget.of(context).state;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: provider.backgroundColor,
            ),
            home: HomeScreen(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}
