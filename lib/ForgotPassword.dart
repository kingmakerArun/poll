import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
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

                    SizedBox(height: 20,),
                    Text("Find your X account",
                      style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(height: 10,),
                    Text("Enter the email,phone number, or username associated with your account to change your password",
                        style:Theme.of(context).textTheme.displayLarge),

                    SizedBox(height: 40,),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Phone or Email",
                          hintText: "Phone number or email address",
                          hintStyle: Theme.of(context).textTheme.displayLarge
                      ),
                    ),

                    SizedBox(height: 490),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue.shade100,),
                          ),
                          onPressed: (){
                          }, child: Text("Next",
                        style: Theme.of(context).textTheme.headlineMedium,)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Account extends StatefulWidget {
//   const Account({super.key});
//
//   @override
//   State<Account> createState() => _AccountState();
// }
//
// class _AccountState extends State<Account> {
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding: const EdgeInsets.all(27.0),
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
//                       child: Text(
//                         "Cancel",
//                         style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
//                       ),
//                     ),
//                     Spacer(),
//                     Container(
//                       height: screenHeight * 0.12,
//                       width: screenHeight * 0.12,
//                       child: Image.network(
//                         "https://i.pinimg.com/474x/49/cd/94/49cd949d1eaa1414f7649eaeb50519b3.jpg",
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: screenHeight * 0.03),
//                 Text(
//                   "Find your X account",
//                   style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
//                 ),
//                 SizedBox(height: screenHeight * 0.02),
//                 Text(
//                   "Enter the email, phone number, or username associated with your account to change your password",
//                   style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white),
//                 ),
//                 SizedBox(height: screenHeight * 0.05),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Phone number or email address",
//                     hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white54),
//                     filled: true,
//                     fillColor: Colors.grey[900],
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.35),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.blue.shade100),
//                     ),
//                     onPressed: () {
//                       // Add your onPressed code here!
//                     },
//                     child: Text(
//                       "Next",
//                       style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black),
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
