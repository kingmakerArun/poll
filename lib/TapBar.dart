import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newpoll/Provider.dart';
import 'package:newpoll/ThoughtPass.dart';
import 'package:provider/provider.dart';
import 'firstPage.dart';
import 'Homepage.dart';



class TabBarViewExample extends StatefulWidget {
  const TabBarViewExample({super.key});

  @override
  _TabBarViewExampleState createState() => _TabBarViewExampleState();
}

class _TabBarViewExampleState extends State<TabBarViewExample> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // List<Poll> polls = [];  // Example data list for PollingPage
  // List<Poll2> thoughts = [];  // Example data list for NewsFeed

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Load initial data if any
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  // var dName= FirebaseAuth.instance.currentUser!.displayName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        //title: Text("Welcome Alpha",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20)),
        title: Center(
          child:
          Text("Welcome  ${ context.watch<UserName>().userName}",

            // dName != null && dName !="" ? "Welcome $dName" : "Welcome Alpha",
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16),),
        ),
        actions: [
          IconButton(
              onPressed: (){
                try{
                  final GoogleSignIn _out= new GoogleSignIn();
                  _out.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const enter()));
                }
                catch(e)
                {
                  print(e);
                }
              },
              icon: Icon(Icons.logout, color: Colors.white,)
          )
        ],
        bottom: TabBar(
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          tabs: [
            Tab(text: "Polling"),
            Tab(text: "News Feed"),
          ],
        ),
      ),
      body:
      TabBarView(
        controller: _tabController,
        children: [
          PollingPage(),
          NewsFeed(),
        ],
      ),
    );
  }
}





