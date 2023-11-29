import 'package:flutter/material.dart';
class WidgetMenu extends StatefulWidget {
  const WidgetMenu({Key? key}) : super(key: key);

  @override
  State<WidgetMenu> createState() => _WidgetMenuState();
}

class _WidgetMenuState extends State<WidgetMenu> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.menu,size: 50,),
          ],
        ),
      ),
    );
  }
}
