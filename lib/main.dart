import 'package:flutter/material.dart';
import 'package:hecker_task/component/daimention.dart';
import 'package:hecker_task/providers/auth_provider.dart';
import 'package:hecker_task/providers/cartProvider.dart';
import 'package:hecker_task/providers/productPovider.dart';
import 'package:hecker_task/screens/loginScreen.dart';
import 'package:hecker_task/screens/splashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider(),),
      ChangeNotifierProvider(create: (context) => ProductProvider(),),
      ChangeNotifierProvider(create: (context) => CartProvider(),),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    SC.getScreen(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        
        elevatedButtonTheme: ElevatedButtonThemeData(
          
          style: ButtonStyle(
            textStyle: WidgetStateProperty.resolveWith((states) => TextStyle(fontWeight: FontWeight.w700,fontSize: SC.from_width(18)),),
            padding: WidgetStateProperty.resolveWith((states) =>EdgeInsets.symmetric(vertical: SC.from_width(17))),
            shape: WidgetStateProperty.resolveWith((states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),),
            backgroundColor: WidgetStateProperty.resolveWith((states) => Colors.blue,),
            foregroundColor: WidgetStateProperty.resolveWith((states) => Colors.white,)
          )
          
        ),
        
        colorScheme: ColorScheme.light(
          primary: Colors.blue,
        )
      ),
      home: SplashScreen(),
    );
  }
}
