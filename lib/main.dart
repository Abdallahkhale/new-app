import 'package:flutter/material.dart';
import 'package:news/Core/assets/theme/theme.dart';
import 'package:news/UI/HomeScreen/HomeScreen.dart';
import 'package:news/UI/HomeScreen/Home_viewModel/homeViewmodel.dart';
import 'package:news/UI/HomeScreen/search/searchScreen.dart';
import 'package:news/UI/splashScreen/splashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
 
  runApp( ChangeNotifierProvider(
  create: (BuildContext context) => HomeviewModel(),
  child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeApp.theme,
      debugShowCheckedModeBanner: false,
      initialRoute:  Splashscreen.routeName,
      routes: {
        Splashscreen.routeName: (context) => const Splashscreen(),
        Homescreen.routeName: (context) => const Homescreen(),
        Searchscreen.routeName: (context) => const Searchscreen(),
      },
    );

  }
}


