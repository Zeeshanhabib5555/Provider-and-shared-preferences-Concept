import 'package:flutter/material.dart';
class WidgetProfile extends StatefulWidget {
  const WidgetProfile({Key? key}) : super(key: key);

  @override
  State<WidgetProfile> createState() => _WidgetProfileState();
}

class _WidgetProfileState extends State<WidgetProfile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.person_2_outlined,size: 50,),
          ],
        ),
      ),
    );
  }
}
