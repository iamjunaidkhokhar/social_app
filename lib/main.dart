import 'package:chat/Providers/userprovider.dart';
import 'package:chat/Screens/mywelcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/home.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize())
      ],
      child: MaterialApp(
        theme: ThemeData.light(),
        home: Scaffold(
          body: ScreensController(),
        ),
      ),
    );
  }
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch (user.status) {
      case Status.Uninitialized:
        return CircularProgressIndicator();
        break;
      case Status.Authenticating:
        return WelcomePage();
        break;
      case Status.Authenticated:
        return Homepage();
        break;
      default:
        return WelcomePage();
        break;
    }
  }
}
