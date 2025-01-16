import 'package:ejercicio2/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio2/screens/screens.dart';


void main() async {
  // This line is required when doing async operations in main
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize preferences
  await Preferences.init();

  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName: (_) => const HomeScreen(),
        SettingsScreen.routerName: (_) => const SettingsScreen()
      },
    );
  }
}
