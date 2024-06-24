import 'package:flutter/material.dart';
import 'package:newpoll/Profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'Provider.dart';

class ThoughtScreen extends StatefulWidget {
  const ThoughtScreen({super.key});

  @override
  State<ThoughtScreen> createState() => _ThoughtScreenState();
}

class _ThoughtScreenState extends State<ThoughtScreen> {
  final TextEditingController thoughtController = TextEditingController();

  List<Poll> thoughts = [];

  @override
  void initState() {
    super.initState();
    _loadThoughts();
  }

  Future<void> _loadThoughts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? thoughtsString = prefs.getString('thoughts');
    if (thoughtsString != null) {
      setState(() {
        thoughts = (json.decode(thoughtsString) as List)
            .map((item) => Poll.fromJson(item))
            .toList();
      });
    }
  }

  Future<void> _saveThoughts(List<Poll> updatedThoughts) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('thoughts', json.encode(updatedThoughts));
  }

  Future<void> _addThought() async {
    if (thoughtController.text.isEmpty) return;
    List<Poll> updatedThoughts = [
      ...thoughts,
      Poll(thought: thoughtController.text),
    ];
    await _saveThoughts(updatedThoughts);
    setState(() {
      thoughts = updatedThoughts;
    });
    Navigator.pop(context, updatedThoughts);
    context.read<ProvideNews>().changeNews(newNews: thoughtController.text);// Return to the previous screen with updated thoughts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20,top: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Thoughts...",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/27,),
            Container(
              height: MediaQuery.of(context).size.height/4,
              width: MediaQuery.of(context).size.height/1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white60),
              ),
              child: TextField(
                maxLines: 5,
                controller: thoughtController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: ' Enter your thoughts here',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height/15,
                width: MediaQuery.of(context).size.height/15,
                child: FloatingActionButton(
                  shape: CircleBorder(),
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.check, size: 40, color: Colors.white),
                  onPressed: _addThought,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    thoughtController.dispose();
    super.dispose();
  }
}

class Poll {
  final String thought;

  Poll({required this.thought});

  factory Poll.fromJson(Map<String, dynamic> json) {
    return Poll(
      thought: json['thought'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thought': thought,
    };
  }
}

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  List<Poll> thoughts = [];

  @override
  void initState() {
    super.initState();
    _loadThoughts();
  }

  Future<void> _loadThoughts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? thoughtsString = prefs.getString('thoughts');
    if (thoughtsString != null) {
      setState(() {
        thoughts = (json.decode(thoughtsString) as List)
            .map((item) => Poll.fromJson(item))
            .toList();
      });
    }
  }

  Future<void> _updateThoughts(List<Poll> updatedThoughts) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('thoughts', json.encode(updatedThoughts));
    setState(() {
      thoughts = updatedThoughts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: ListView.builder(
          itemCount: thoughts.length,
          itemBuilder: (context, index) {
            final thought = thoughts[index];
            return Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => proAlpha()
                          ));
                        },
                        child: Text(
                        context.watch<UserName>().userName,
                          style: TextStyle(color: Colors.white, fontSize: 20),)),
                    Icon(Icons.verified, size: 20, color: Colors.blue,),
                  ],
                ),
                Card(
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height/8,
                    width: MediaQuery.of(context).size.width/1,
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Text(
                        thought.thought,
                        maxLines: 5,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(28.0),
        child: FloatingActionButton(
          foregroundColor: Colors.black,
          backgroundColor: Colors.green,
          onPressed: () async {
            final List<Poll>? updatedThoughts = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThoughtScreen()),
            );
            if (updatedThoughts != null) {
              _updateThoughts(updatedThoughts);
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}





