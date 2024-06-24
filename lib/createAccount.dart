import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:newpoll/TapBar.dart';
import 'package:provider/provider.dart';

import 'Phone_Number.dart';
import 'Provider.dart';


class createAccount extends StatefulWidget {
  const createAccount({super.key});

  @override
  State<createAccount> createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {

  final validatorKey = GlobalKey<FormState>();

  final RegExp emailRegex = RegExp(r'^[a-z0-9]+@[a-z0-9]+\.[a-z]+$');
  final  RegExp PassRReg = RegExp(r'^(?=.*?[0-9]).{6,}$');
  final RegExp PhoneRegExp =RegExp(r'^[0-9]{10}$');
  final FocusNode _focusNode = FocusNode();


  bool _passwordVisible=true;

  void initState() {
    super.initState();
    givePassword.addListener(_checkMaxLength);
    _passwordVisible = true;
  }

  void _checkMaxLength() {
    if (givePassword.text.length >= 6) {
      _focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    givePassword.removeListener(_checkMaxLength);
    givePassword.dispose();
    _focusNode.dispose();
    super.dispose();
  }


  TextEditingController giveName = TextEditingController();
  TextEditingController giveEmail = TextEditingController();
  TextEditingController givePassword = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: validatorKey,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        height: MediaQuery.of(context).size.height/15,),
                      Text("Create your account",
                          style: Theme.of(context).textTheme.titleLarge),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/20,),

                      TextFormField(
                        validator: (input) {
                          if(input == null || input.isEmpty){
                            return "Please enter your name";
                          }
                          if(input.length<3){
                            return "Name should be 4 letters";
                          }
                        },
                        controller: giveName,
                        decoration: InputDecoration(
                            hintText: "Enter Name",
                            hintStyle: Theme.of(context).textTheme.displayLarge
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/20,),
                      TextFormField(
                        validator: (input) {
                          if(!emailRegex.hasMatch(input!)){
                            return "Please enter the valid email";
                          }
                        },
                        controller: giveEmail,
                        decoration: InputDecoration(
                            hintText: "Enter Email",
                            hintStyle: Theme.of(context).textTheme.displayLarge
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/20,),
                      TextFormField(
                        focusNode: _focusNode,
                        obscureText: _passwordVisible,
                        keyboardType: TextInputType.phone,
                        maxLength: 6,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(6),
                        ],
                        validator: (input){
                          if(input == null || input.isEmpty){
                            return "Please enter the Password";
                          }
                          if(!PassRReg.hasMatch(input)){
                            return "Please enter digits only";
                          }
                        },
                        decoration: InputDecoration(
                          helperText: "Password should 6 digit pin",
                            helperStyle: TextStyle(color: Colors.white),
                            labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(_passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(
                                    () {
                                  _passwordVisible = !_passwordVisible;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/6,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.blue.shade100,),
                            ),
                            onPressed: (){
                              setState(() {
                                if(validatorKey.currentState!.validate()){
                                  context.read<UserName>().changeName(newuserName: giveName.text);
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context) => otpPhone(),
                                      ));
                                }
                              });
                            },
                            child: Text("Next",
                              style: Theme.of(context).textTheme.headlineMedium,)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}