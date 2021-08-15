import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel("reversed");

  void _startService() async {
    try {
      await platform.invokeMethod("Start_Service");
    } on PlatformException catch (e) {
      print(e);
    }
  }

  final String channel = "callMrFlutter";
  @override
  void initState() {
    super.initState();

    MethodChannel(channel).setMethodCallHandler((call) async {
      if(call.method == "showToast"){
        ///Show Toast
        Fluttertoast.showToast(msg: "Flutter is running now", backgroundColor: Colors.red, textColor: Colors.white);
      }

      return null;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reversed platform channel"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _startService,
        label: Text("Start service"),
      ),
    );
  }
}
