// import 'package:flutter/material.dart';
// import 'package:hecker_task/component/authFeild.dart';
// import 'package:hecker_task/component/daimention.dart';
// import 'package:hecker_task/providers/auth_provider.dart';
// import 'package:hecker_task/screens/home%20page.dart';
// import 'package:provider/provider.dart';
//
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child:  Consumer<AuthProvider>(
//         builder: (context, auth, child) => Scaffold(
//
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//
//                   //Image
//                   Center(child: Image.asset('assets/loginbg.png',height: SC.Screen_width/1.2,)),
//
//                   //
//                   Text("Login",style: TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontSize: SC.from_width(25)
//                   ),),
//                 SizedBox(height: SC.from_width(12),),
//
//
//
//
//
//                 //Email
//                 AuthField(
//                   controller: auth.emailController,
//                   icon: Icon(Icons.mail_lock_outlined),
//                   hintText: 'Email ID',
//                 ),
//                   SizedBox(height: SC.from_width(12),),
//
//                   //Password
//                   AuthField(
//                     hideText: auth.showPassword,
//                     controller: auth.passwordController,
//                     icon: Icon(Icons.lock_outline_rounded),
//                     hintText: 'Password',
//                     suffix: IconButton(onPressed: (){
//                       auth.hidePassword();
//                       }, icon: Icon(Icons.remove_red_eye_outlined)),
//                   ),
//                   SizedBox(height: SC.from_width(8),),
//
//
//                   //ForgetPass
//                   Align(alignment: Alignment.centerRight,child: Text('Forgot Password?',
//                   style: TextStyle(
//                     fontSize: SC.from_width(14,),
//                     fontWeight: FontWeight.w500,
//                     color: Colors.blue,
//                   ),),),
//                   SizedBox(height: SC.from_width(25),),
//
//                   //Log In Button
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                         onPressed: (){
//                           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
//                     }, child: Text("Login")),
//                   ),
//                   SizedBox(height: SC.from_width(20),),
//
//
//                   //Devider
//                   Row(
//                     children: [
//                       Expanded(child: Container(height: 1,width: double.infinity,color: Colors.grey.shade400,margin: EdgeInsets.symmetric(horizontal: 5),)),
//                       Text('OR',style: TextStyle(color: Colors.grey.shade400),),
//                       Expanded(child:  Container(height: 1,width: double.infinity,color: Colors.grey.shade400,margin: EdgeInsets.symmetric(horizontal: 5),))
//                     ],
//                   ),
//
//                   SizedBox(height: SC.from_width(20),),
//
//                   SizedBox(
//                     height: SC.from_width(60),
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor:WidgetStateProperty.resolveWith((states) => Colors.grey.shade200,),
//                         foregroundColor:WidgetStateProperty.resolveWith((states) => Colors.black,),
//                       ),
//                         onPressed: (){
//
//                     }, child: Row(
//                       children: [
//                         SizedBox(width: SC.from_width(30),),
//                         Image.asset('assets/google-removebg-preview.png',height: 30,),
//                         SizedBox(width: SC.from_width(40),),
//                         Text('Login with Google',style: TextStyle(fontWeight: FontWeight.w500),),
//                       ],
//                     )),
//                   ),
//                   SizedBox(height: SC.from_width(30),),
//
//
//                   //Reach Text
//                   Center(
//                     child: RichText(
//                         text: TextSpan(
//                           style: TextStyle(color: Colors.grey.shade400,fontSize: SC.from_width(14)),
//                           text: 'New to Logistics?',
//                           children: [
//                             TextSpan(
//                                 text: ' Registor',
//                               style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700)
//                             )
//                           ]
//                         )
//                     ),
//                   )
//
//                 ],
//               ),
//             ),
//           ),
//
//         ) ,),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hecker_task/component/authFeild.dart';
import 'package:hecker_task/component/daimention.dart';
import 'package:hecker_task/providers/auth_provider.dart';
import 'package:hecker_task/screens/home%20page.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AuthProvider>(
        builder: (context, auth, child) => Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form( // Wrap the Column in a Form widget
                key: _formKey, // Assign the form key
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    Center(
                      child: Image.asset(
                        'assets/loginbg.png',
                        height: SC.Screen_width / 1.2,
                      ),
                    ),

                    // Title
                    Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: SC.from_width(25),
                      ),
                    ),
                    SizedBox(height: SC.from_width(12)),

                    // Email
                    AuthField(
                      controller: auth.emailController,
                      icon: Icon(Icons.mail_lock_outlined),
                      hintText: 'Email ID',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        // Simple email validation
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                    SizedBox(height: SC.from_width(12)),

                    // Password
                    AuthField(
                      hideText: auth.showPassword,
                      controller: auth.passwordController,
                      icon: Icon(Icons.lock_outline_rounded),
                      hintText: 'Password',
                      suffix: IconButton(
                        onPressed: () {
                          auth.hidePassword();
                        },
                        icon: Icon(Icons.remove_red_eye_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null; // Return null if the input is valid
                      },
                    ),
                    SizedBox(height: SC.from_width(8)),

                    // Forget Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: SC.from_width(14),
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(height: SC.from_width(25)),

                    // Log In Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, proceed with login
                            auth.logIn(context);
                          }
                        },
                        child: Text("Login"),
                      ),
                    ),
                    SizedBox(height: SC.from_width(20)),

                    // Divider
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.grey.shade400,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                          ),
                        ),
                        Text(
                          'OR',
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.grey.shade400,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: SC.from_width(20)),

                    SizedBox(
                      height: SC.from_width(60),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.grey.shade200,
                          ),
                          foregroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.black,
                          ),
                        ),
                        onPressed: () {
                          // Handle Google login
                        },
                        child: Row(
                          children: [
                            SizedBox(width: SC.from_width(30)),
                            Image.asset(
                              'assets/google-removebg-preview.png',
                              height: 30,
                            ),
                            SizedBox(width: SC.from_width(40)),
                            Text(
                              'Login with Google',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: SC.from_width(30)),

                    // Reach Text
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: SC.from_width(14),
                          ),
                          text: 'New to Logistics?',
                          children: [
                            TextSpan(
                              text: ' Register',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}