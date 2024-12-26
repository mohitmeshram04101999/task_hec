import 'package:flutter/material.dart';
import 'package:hecker_task/providers/auth_provider.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AuthProvider>(context,listen: false).getUser(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: CircularProgressIndicator(),
      ),
    );
  }
}
