
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newpoll/TapBar.dart';
import 'fontdoc.dart';
import 'ForgotPassword.dart';


class password extends StatefulWidget {
  const password({super.key});

  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {

  final RegExp EmailRegex = RegExp(r'^[a-z0-9]+@[a-z0-9]+\.[a-z]+$');

  TextEditingController emailGive = TextEditingController();
  TextEditingController passGive = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(27.0),
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Icon(Icons.arrow_back, size: 30, color: Colors.white,),
                        )),
                    SizedBox(width: 110,),
                    Center(
                      child: Container(
                          height: 80,
                          width: 100,
                          child: Image.asset("assets/ima/alogo.png")),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text("Login",
                  style: Theme.of(context).textTheme.titleLarge),
                SizedBox(height: 35,),

                TextFormField(
                  validator: (input) {
                    if(input == null || input.isEmpty){
                      return "Please enter the email";
                    }
                    if(!EmailRegex.hasMatch(input)){
                      return "Please enter the valid email";
                    }
                  },
                  controller: emailGive,
                  decoration: InputDecoration(
                    labelText: "Email",
                      hintText: "Enter Email",
                      hintStyle: Theme.of(context).textTheme.displayLarge
                  ),
                ),

                SizedBox(height: 35,),

                TextFormField(
                  controller: passGive,
                  decoration: InputDecoration(
                    labelText: "Password",
                      hintText: "Enter Password",
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      hintStyle: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                SizedBox(height: 60,),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => TabBarViewExample()));
                  },

                  child: Container(
                    height: 55,
                    width: 394,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(child: Text("Log in",
                        style:Theme.of(context).textTheme.headlineSmall,
                    )),
                  ),
                ),
                SizedBox(height: 10,),

                Center(child: TextButton(onPressed: (){
                  setState(() {
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => account()
                      ),
                    );
                  });
                }, child: Text("Forget password?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    decorationThickness: 2,
                    fontSize: 16.0,
                    letterSpacing: .7,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins",
                    color: textPrimaryLightColor,),

                ))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void goToHome(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => TabBarViewExample()),
  //   );
  // }

  // Future<void> _login() async {
  //   final user = await _auth.loginUserWithEmailAndPassword(
  //     emailGive.text,
  //     passGive.text,
  //   );
  //
  //   if (user!= null) {
  //     log("User Logged In");
  //     goToHome(context);
  //   }
  // }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:newpollnewfeed/tapbar.dart';
// import 'Colors.dart';
// import 'ForgotPassword.dart';
//
// class Password extends StatefulWidget {
//   const Password({super.key});
//
//   @override
//   State<Password> createState() => _PasswordState();
// }
//
// class _PasswordState extends State<Password> {
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding: EdgeInsets.all(screenWidth * 0.07),
//         child: SafeArea(
//           maintainBottomViewPadding: true,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Align(
//                         alignment: Alignment.bottomLeft,
//                         child: Text(
//                           "Cancel",
//                           style: Theme.of(context).textTheme.headline3,
//                         ),
//                       ),
//                     ),
//                     Spacer(),
//                     Container(
//                       height: screenHeight * 0.1,
//                       width: screenWidth * 0.25,
//                       child: Image.network(
//                         "https://i.pinimg.com/474x/49/cd/94/49cd949d1eaa1414f7649eaeb50519b3.jpg",
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: screenHeight * 0.02),
//                 Text(
//                   "Enter your password",
//                   style: Theme.of(context).textTheme.headline6,
//                 ),
//                 SizedBox(height: screenHeight * 0.05),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Name",
//                     hintStyle: Theme.of(context).textTheme.headline1,
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.05),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Password",
//                     suffixIcon: Icon(Icons.remove_red_eye_outlined),
//                     hintStyle: Theme.of(context).textTheme.headline1,
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.08),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => TabBarViewExample(),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     height: screenHeight * 0.07,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Log in",
//                         style: Theme.of(context).textTheme.headline5,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.01),
//                 Center(
//                   child: TextButton(
//                     onPressed: () {
//                       setState(() {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Account(),
//                           ),
//                         );
//                       });
//                     },
//                     child: Text(
//                       "Forget password?",
//                       style: TextStyle(
//                         decoration: TextDecoration.underline,
//                         decorationColor: Colors.white,
//                         decorationThickness: 2,
//                         fontSize: 16.0,
//                         letterSpacing: .7,
//                         fontWeight: FontWeight.normal,
//                         fontFamily: "Poppins",
//                         color: textPrimaryLightColor,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
