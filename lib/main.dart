import 'package:best_dream_cafe_frontend/presentation/pages/start/start_page.dart';
import 'package:best_dream_cafe_frontend/routing/route_generator.dart';
import 'package:best_dream_cafe_frontend/utils/custom_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'The Best Dream Cafe',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.deepOrange,
        // fontFamily: 'NotoSansThai',
        textTheme: GoogleFonts.kanitTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const StartPage(),
      scrollBehavior: CustomScrollBehavior(),
      onGenerateRoute: generateRoute,
      initialRoute: StartPage.routeName,
    );
  }
}
