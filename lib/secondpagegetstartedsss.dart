// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:newpoll/password.dart';
//
// import 'fontdoc.dart';
// import 'ForgotPassword.dart';
//
//
//
// class start extends StatefulWidget {
//   const start({super.key});
//
//   @override
//   State<start> createState() => _startState();
// }
//
// class _startState extends State<start> {
//   @override
//   Widget build(BuildContext context) {
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
//                         onTap: (){
//                           Navigator.pop(context);
//                         },
//                         child: Align(
//                           alignment: Alignment.bottomLeft,
//                           child: Icon(Icons.arrow_back, size: 30, color: Colors.white,)
//                         )),
//                     SizedBox(width: 110,),
//                     Center(
//                       child: Container(
//                           height: 80,
//                           width: 100,
//                           child: Image.asset("assets/ima/alogo.png")),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20,),
//                 Text("To get started, first enter your phone, email, or @username",
//                   style: Theme.of(context).textTheme.titleLarge),
//                 SizedBox(height: 40,),
//                 TextFormField(
//                   decoration: InputDecoration(
//                       hintText: "Phone number or email address",
//                       hintStyle: Theme.of(context).textTheme.displayLarge,
//                   ),
//                 ),
//                 SizedBox(height: 480,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextButton(onPressed: (){
//                       setState(() {
//                         Navigator.push(context,
//                           MaterialPageRoute(
//                               builder: (context) => account()
//                           ),
//                         );
//                       });
//                     }, child: Center(child: Text("Forget password?",
//                         style: Theme.of(context).textTheme.displaySmall,))),
//                     ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor:
//                           MaterialStateProperty.all(hintTextColoTr),
//                         ),
//                         onPressed: (){
//                           setState(() {
//                             Navigator.push(context,
//                               MaterialPageRoute(
//                                   builder: (context) => password()
//                               ),
//                             );
//                           });
//
//
//                         }, child: Text("Next",
//                       style: Theme.of(context).textTheme.headlineMedium,))
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:newpollnewfeed/passwordpage.dart';
// // import 'Colors.dart';
// // import 'ForgotPassword.dart';
// //
// // class Start extends StatefulWidget {
// //   const Start({super.key});
// //
// //   @override
// //   State<Start> createState() => _StartState();
// // }
// //
// // class _StartState extends State<Start> {
// //   @override
// //   Widget build(BuildContext context) {
// //     final screenHeight = MediaQuery.of(context).size.height;
// //     final screenWidth = MediaQuery.of(context).size.width;
// //
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       body: Padding(
// //         padding: EdgeInsets.all(screenWidth * 0.07),
// //         child: SafeArea(
// //           maintainBottomViewPadding: true,
// //           child: SingleChildScrollView(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Row(
// //                   children: [
// //                     GestureDetector(
// //                       onTap: () {
// //                         Navigator.pop(context);
// //                       },
// //                       child: Align(
// //                         alignment: Alignment.bottomLeft,
// //                         child: Text(
// //                           "Cancel",
// //                           style: Theme.of(context).textTheme.headline3,
// //                         ),
// //                       ),
// //                     ),
// //                     Spacer(),
// //                     Container(
// //                       height: screenHeight * 0.1,
// //                       width: screenWidth * 0.25,
// //                       child: Image.network(
// //                         "https://i.pinimg.com/474x/49/cd/94/49cd949d1eaa1414f7649eaeb50519b3.jpg",
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 SizedBox(height: screenHeight * 0.02),
// //                 Text(
// //                   "To get started, first enter your phone, email, or @username",
// //                   style: Theme.of(context).textTheme.headline6,
// //                 ),
// //                 SizedBox(height: screenHeight * 0.05),
// //                 TextFormField(
// //                   decoration: InputDecoration(
// //                     hintText: "Phone number or email address",
// //                     hintStyle: Theme.of(context).textTheme.headline1,
// //                   ),
// //                 ),
// //                 SizedBox(height: screenHeight * 0.5),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     TextButton(
// //                       onPressed: () {
// //                         setState(() {
// //                           Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                               builder: (context) => Account(),
// //                             ),
// //                           );
// //                         });
// //                       },
// //                       child: Center(
// //                         child: Text(
// //                           "Forget password?",
// //                           style: Theme.of(context).textTheme.headline3,
// //                         ),
// //                       ),
// //                     ),
// //                     ElevatedButton(
// //                       style: ButtonStyle(
// //                         backgroundColor: MaterialStateProperty.all(hintTextColoTr),
// //                       ),
// //                       onPressed: () {
// //                         setState(() {
// //                           Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                               builder: (context) => Password(),
// //                             ),
// //                           );
// //                         });
// //                       },
// //                       child: Text(
// //                         "Next",
// //                         style: Theme.of(context).textTheme.headline4,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
