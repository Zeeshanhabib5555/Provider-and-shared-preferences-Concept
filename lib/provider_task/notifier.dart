

import 'package:flutter/cupertino.dart';

class Notifier extends ChangeNotifier{

  String _widgetName = 'profile';

  String get getWidgetName => _widgetName;
  //get is used for access the private widgetName
  void changeWidgetName(String widgetName){
  _widgetName = widgetName;
  notifyListeners(); // it is used for to notify listener, it can send the message that it is changed

}
}