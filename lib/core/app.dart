import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hasan_app/modules/on_boarding/screen/on_boarding_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Lato",
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
      ),
      title: 'Coffee App',
      home: const OnBoardingPage(),
    );
  }
}
