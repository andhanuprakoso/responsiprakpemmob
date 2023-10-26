import 'package:flutter/material.dart';
import 'package:responsiprakpemmob/helpers/user_info.dart';
// import 'package:responsiprakpemmob/ui/login_page.dart';
import 'package:responsiprakpemmob/ui/ikan_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = const CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    var token = await UserInfo().getToken();
    if (token != null) {
      setState(() {
        page = const IkanPage();
      });
    } else {
      setState(() {
        page = const IkanPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsi 1',
      debugShowCheckedModeBanner: false,
      home: page,
    );
  }
}
