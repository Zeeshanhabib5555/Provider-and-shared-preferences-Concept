import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/counter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count =0;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    timer = Timer.periodic(const Duration(seconds:1),(timer){
      var pro =Provider.of<Counter>(context,listen: false);
      pro.addCounter();
    });
  }
  @override
  Widget build(BuildContext context) {
    // print("build" +count.toString());
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Center(child: Text("Provider")),
      ),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<Counter>(builder: (context, value, child){
              return Center(child: Text(value.counter.toString(),style: TextStyle(fontSize: 30),
              ),
              );
            }),
    Center(child: Text(count.toString(),style: TextStyle(fontSize: 30),
    ),
    ),
            
          ],
        ),
      );
  }
}
