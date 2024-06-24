import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newpoll/TapBar.dart';
import 'fontdoc.dart';
import 'ForgotMobile.dart';

class looooo extends StatefulWidget {
  const looooo({super.key});

  @override
  State<looooo> createState() => _loooooState();
}

class _loooooState extends State<looooo> {

  final validKey = GlobalKey<FormState>();

  final RegExp PhoneReg = RegExp(r'^[0-9]{10}$');
  final  RegExp PassReg = RegExp(r'^(?=.*?[0-9]).{6,}$');

  TextEditingController Phoneee = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: validKey,
        child: Padding(
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
                          child: Icon(Icons.arrow_back, size: 30, color: Colors.white,)),
                      SizedBox(width: 110,),
                      Container(
                          height: MediaQuery.of(context).size.height/10,
                          width: MediaQuery.of(context).size.width/4,
                          child: Image.asset("assets/ima/alogo.png")),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/17,),
                  Text('Log in',
                      style: Theme.of(context).textTheme.titleLarge),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (input){
                        if(input == null || input.isEmpty){
                          return "Please enter the phone number";
                        }
                        if(input.length != 10){
                          return "Phone number should be 10 digits";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Phone',
                          suffixIcon: Icon(Icons.remove_red_eye_outlined)
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/27,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width/1,
                      child: TextFormField(
                        maxLength: 6,
                        keyboardType: TextInputType.phone,
                        validator: (input){
                          if(input == null || input.isEmpty){
                            return "Please enter the Password";
                          }
                          if(!PassReg.hasMatch(input)){
                            return "Please enter digits only";
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: Icon(Icons.remove_red_eye_outlined)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/17,),

                  GestureDetector(
                    onTap: (){
                      if(validKey.currentState!.validate()){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TabBarViewExample()));
                      }

                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height/18,
                      width: MediaQuery.of(context).size.width/1,
                      decoration: BoxDecoration(
                        color: textPrimaryLightColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text("LOGIN",
                            style:Theme.of(context).textTheme.headlineSmall),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/17,),
                  Center(
                    child: TextButton(
                        onPressed: (){
                          setState(() {
                            Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => forPass()
                              ),
                            );
                          });
                        },
                        child: Text('Forgot Password',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 2,
                            fontSize: 16.0,
                            letterSpacing: .7,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Poppins",
                            color: textPrimaryLightColor,),
                        )
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}