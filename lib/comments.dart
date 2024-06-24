
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {


  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _comments = [];
  String _userName = "LoggedInUser"; // Simulated signed-in user's name.

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  Future<void> _loadComments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? commentsJson = prefs.getString('comments');
    if (commentsJson != null) {
      setState(() {
        _comments = (json.decode(commentsJson) as List)
            .map((item) => Map<String, dynamic>.from(item))
            .toList();
      });
    }
  }

  Future<void> _saveComments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('comments', json.encode(_comments));
  }

  void _postComment() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _comments.add({
          "name": _userName,
          "text": _controller.text,
          "likes": 0,
          "dislikes": 0,
          "replies": []
        });
        _controller.clear();
        _saveComments();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
            child: Icon(Icons.arrow_back, color: Colors.white,)),
        title: Text("Comments", style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _comments.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white, // Customize as needed
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "@${_comments[index]['name']}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_comments[index]["text"]),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.thumb_up),
                                onPressed: () {
                                  setState(() {
                                    _comments[index]["likes"]++;
                                    _saveComments(); // Save comments after updating likes
                                  });
                                },
                              ),
                              Text('${_comments[index]["likes"]}'),
                              IconButton(
                                icon: Icon(Icons.thumb_down),
                                onPressed: () {
                                  setState(() {
                                    _comments[index]["dislikes"]++;
                                    _saveComments(); // Save comments after updating dislikes
                                  });
                                },
                              ),
                              Text('${_comments[index]["dislikes"]}'),
                              IconButton(
                                icon: Icon(Icons.comment),
                                onPressed: () => _showCommentDialog(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white
                      ),
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Write a comment...",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.white, size: 35,),
                    onPressed: _postComment,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  void _showCommentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Reply to Comment"),
          content: TextField(
            decoration: InputDecoration(hintText: "Enter your reply here"),
            autofocus: true,
            maxLines: null,
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Save"),
              onPressed: () {
                print("Reply: ${_controller.text}"); // For demonstration
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}




