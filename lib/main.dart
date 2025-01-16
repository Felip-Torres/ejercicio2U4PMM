import 'package:ejercicio2/preferences/preferences.dart';
import 'package:ejercicio2/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio2/screens/screens.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Preferences.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ( _ ) => ThemeProvider(DarkMode: Preferences.DarkMode))
    ],
    child: MyApp()
    )
  );
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
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
