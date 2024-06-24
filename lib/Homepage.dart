import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newpoll/Profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'Provider.dart';
import 'comments.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController questionController = TextEditingController();
  List<TextEditingController> optionControllers = [
    TextEditingController(),
    TextEditingController()
  ];
  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode()
  ];

  List<Poll> polls = [];

  @override
  void initState() {
    super.initState();
    _loadPolls();
  }

  Future<void> _loadPolls() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? pollsString = prefs.getString('polls');
    if (pollsString != null) {
      setState(() {
        polls = (json.decode(pollsString) as List)
            .map((item) => Poll.fromJson(item))
            .toList();
      });
    }
  }

  Future<void> tap1() async {
    if (questionController.text.isEmpty ||
        optionControllers.length < 2 ||
        optionControllers.any((controller) => controller.text.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please provide a question and at least two options.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Poll> updatedPolls = [
      ...polls,
      Poll(
        question: questionController.text,
        options: optionControllers.map((controller) => controller.text).toList(),
      ),
    ];
    await prefs.setString('polls', json.encode(updatedPolls));
    setState(() {
      polls = updatedPolls;
    });
    Navigator.pop(context); // Close the HomePage
  }

  void addOption() {
    if (optionControllers.length < 4) {
      setState(() {
        optionControllers.add(TextEditingController());
        focusNodes.add(FocusNode());
      });
      Future.delayed(Duration(milliseconds: 100), () {
        FocusScope.of(context).requestFocus(focusNodes.last);
      });
    }
  }

  void removeOption(int index) {
    if (optionControllers.length > 1) {
      setState(() {
        optionControllers.removeAt(index);
        focusNodes.removeAt(index);
      });
    }
  }

  int selectedDaysIndex = 0;
  int selectedHoursIndex = 0;
  int selectedMinutesIndex = 0;

  final int maxDays = 30;
  final int maxHours = 23;
  final int maxMinutes = 59;

  Widget buildPicker(String label, int max, int selectedIndex, ValueChanged<int> onChanged) {
    return Expanded(
      child: SizedBox(height: MediaQuery.of(context).size.height/8,
      child: CupertinoPicker(
          itemExtent: 32,
          onSelectedItemChanged: onChanged,
          children: List<Widget>.generate(max + 1, (int index) {
            String text = selectedIndex == index
                ? "$index $label".toLowerCase()
                : "$index";
            return Center(
                child: Text(text, style: TextStyle(color: Colors.white)));
          }),
          scrollController:
          FixedExtentScrollController(initialItem: selectedIndex),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/15,),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel", style: TextStyle(color: Colors.white)),
                ),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    elevation: 5,
                  ),
                  onPressed: tap1,
                  child: const Text('Post'),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/20,
                  width: MediaQuery.of(context).size.width/9,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/ima/img_2.png"),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(55),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  child: TextField(
                    controller: questionController,
                    decoration: InputDecoration(
                      labelText: 'Question',
                      labelStyle: TextStyle(
                        fontSize: 16,
                        letterSpacing: .5,
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontFamily: "Poppins",
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: optionControllers.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: optionControllers[index],
                          focusNode: focusNodes[index],
                          decoration: InputDecoration(
                            labelText: 'Option',
                            labelStyle: TextStyle(
                              fontSize: 13,
                              letterSpacing: .5,
                              color: Colors.white54,
                              fontWeight: FontWeight.w200,
                              fontFamily: "Poppins",
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          if (index == optionControllers.length - 1 && optionControllers.length < 4) {
                            addOption();
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.remove, color: Colors.white),
                        onPressed: () {
                          if (optionControllers.length > 0) {
                            removeOption(index);
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),

            ExpansionTile(
              title: Text("Poll length",
                  style:
                  Theme.of(context).textTheme.bodyLarge),
              iconColor: Colors.white,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildPicker(
                        'Days', maxDays, selectedDaysIndex,
                            (int newIndex) {
                          setState(
                                  () => selectedDaysIndex = newIndex);
                        }),
                    buildPicker(
                        'Hours', maxHours, selectedHoursIndex,
                            (int newIndex) {
                          setState(() =>
                          selectedHoursIndex = newIndex);
                        }),
                    buildPicker('Min', maxMinutes,
                        selectedMinutesIndex, (int newIndex) {
                          setState(() =>
                          selectedMinutesIndex = newIndex);
                        }),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    questionController.dispose();
    optionControllers.forEach((controller) => controller.dispose());
    focusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }
}

class Poll {
  final String question;
  final List<String> options;

  Poll({required this.question, required this.options});

  factory Poll.fromJson(Map<String, dynamic> json) {
    return Poll(
      question: json['question'],
      options: List<String>.from(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'options': options,
    };
  }
}

class PollingPage extends StatefulWidget {
  @override
  _PollingPageState createState() => _PollingPageState();
}

class _PollingPageState extends State<PollingPage> {
  List<Poll> pollsP = [];

  @override
  void initState() {
    super.initState();
    _loadPolls();
  }

  Future<void> _loadPolls() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? pollsString = prefs.getString('polls');
    if (pollsString != null) {
      setState(() {
        pollsP = (json.decode(pollsString) as List)
            .map((item) => Poll.fromJson(item))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: ListView.builder(
          itemCount: pollsP.length,
          itemBuilder: (context, index) {
            final poll = pollsP[index];
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
                        child: Text(context.watch<UserName>().userName,
                          // "Alpha",
                          style: TextStyle(color: Colors.white, fontSize: 20),)),
                    Icon(Icons.verified, size: 20, color: Colors.blue,),
                  ],
                ),
                Card(
                  color: Colors.grey.shade600,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            poll.question,
                            style: Theme.of(context).textTheme.bodyMedium,

                            // TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10),
                        ...poll.options.map((option) => Card(
                          color: Colors.white70,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                option,
                                style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold, fontFamily: "Poppins", color: Colors.black54),
                              ),
                            ),
                          ),
                        )).toList(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              icon: Icon(Icons.comment,color: Colors.white,),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => CommentPage()));
                              },
                            ),
                          ),
                        ),
                      ],
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
          child: Icon(Icons.add, size: 30),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePage())).then((value) {
              _loadPolls(); // Reload polls when returning from HomePage
            });
          },
        ),
      ),
    );
  }
}

