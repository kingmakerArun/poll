import 'package:flutter/cupertino.dart';

class Provide extends ChangeNotifier{
  late String question, opA, opB, opC, opD;
  Provide ({this. question = '', this.opA = '', this.opB = '', this.opC = '', this.opD = ''});
  changeQuestion({
    required String newQuestion, newOpA, newOpB, newOpC, newOpD,
  }) async {
    question = newQuestion;
    opA = newOpA;
    opB = newOpB;
    opC = newOpC;
    opD = newOpD;
    notifyListeners();
  }
}



class ProvideNews extends ChangeNotifier{
  late String news;
  ProvideNews ({this.news = ''});
  changeNews({
    required String newNews
  }) async {
    news = newNews;
    notifyListeners();
  }
}

class UserName extends ChangeNotifier{
  late String userName;
  UserName ({this.userName = ''});
  changeName({
    required String newuserName
  }) async {
    userName = newuserName;
    notifyListeners();
  }
}