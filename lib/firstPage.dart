import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newpoll/Login.dart';
import 'package:newpoll/Provider.dart';
import 'package:newpoll/password.dart';
import 'package:newpoll/TapBar.dart';
import 'package:provider/provider.dart';
import 'Phone_Number.dart';
import 'fontdoc.dart';
import 'createAccount.dart';


class enter extends StatefulWidget {
  const enter({super.key});

  @override
  State<enter> createState() => _enterState();
}

class _enterState extends State<enter> {
  late GoogleSignInAccount _userObj;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId:
    "751099867980-158b30m4qpelaih84g9fba3gpqll8bs8.apps.googleusercontent.com",
  );

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // Sign in to Firebase with the credential
      final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;
      print(user);
      context.read<UserName>().changeName(newuserName: googleSignInAccount.displayName.toString());
      // Check if user is not null before accessing properties
      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => otpPhone()),
        );
      } else {
        print("User is null");
      }
    } catch (e) {
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBlackColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(27.0),
          child: SafeArea(
            maintainBottomViewPadding: true,
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height/10,
                    width: MediaQuery.of(context).size.width/4,
                    child: Image.asset("assets/ima/alogo.png")),
                SizedBox(height: MediaQuery.of(context).size.height/10,),
                Text("See what's happening in the world right now. ",
                  style: Theme.of(context).textTheme.titleLarge),
                SizedBox(height: MediaQuery.of(context).size.height/10,),
                GestureDetector(
                  onTap: (){
                    signInWithGoogle();
                    // Navigator.push(context, MaterialPageRoute(
                    //     builder: (context) => TabBarViewExample()));
        
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height/18,
                    width: MediaQuery.of(context).size.width/1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: textPrimaryLightColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                         height: MediaQuery.of(context).size.height/22,
                                         width: MediaQuery.of(context).size.width/7,
                                         decoration: BoxDecoration(
                                           image: DecorationImage(
                                             image:AssetImage("assets/ima/img.png"),
                                           ),
                                         shape: BoxShape.circle
                                         ),
                                         ),
                                      Text("Continue with Google",
                                        style:Theme.of(context).textTheme.headlineSmall,),
                                    ],
                                  ),
                                ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/50,),
                Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Divider(
                            thickness: .5,
                            color: hintTextColor,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/50,),
                      Text("or", style:Theme.of(context).textTheme.titleSmall
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/50,),
        
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 18),
                            child: Divider(
                              color: hintTextColor,
                              thickness: .5,
                            ),
                          )
                      ),
                    ]
                ),
                SizedBox(height: MediaQuery.of(context).size.height/50,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => createAccount()
                      )
                      );
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height/18,
                    width: MediaQuery.of(context).size.width/1,
                    decoration: BoxDecoration(
                      color: textPrimaryLightColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text("Create account",
                          style:Theme.of(context).textTheme.headlineSmall),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/20,),
                RichText(
                  softWrap: true,
                    text: TextSpan(
                        children: [
                          TextSpan(
                            text: "By signing up, you agree to our ",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextSpan(
                            text: "Terms",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          TextSpan(
                            text: ", ",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          TextSpan(
                            text: ", ",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextSpan(
                            text: "and ",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextSpan(
                            text: "Cookie Use",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ]
                    )),
                SizedBox(height: MediaQuery.of(context).size.height/20,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Text("Have an account already? ", style: Theme.of(context).textTheme.titleSmall,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => looooo()
                          ));
                        },
                          child: Text("Log in", style: Theme.of(context).textTheme.displayMedium,))
                    ],
                  )
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}




