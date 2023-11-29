import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider_task/notifier.dart';
import 'package:provider_state_management/provider_task/widget_menue_provider.dart';
import 'package:provider_state_management/provider_task/widget_profile_provider.dart';

class ProviderTask extends StatefulWidget {
  const ProviderTask({Key? key}) : super(key: key);

  @override
  State<ProviderTask> createState() => _ProviderTaskState();
}

class _ProviderTaskState extends State<ProviderTask> {


  @override
  Widget build(BuildContext context) {

    final provider =Provider.of<Notifier>(context); // this provider is used for access the variables of provider class.

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Center(child: Text("Provider Home")),),
      drawer: Drawer(
        backgroundColor: Colors.tealAccent,
        child: ListView(
          children:  [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/shaniupdate - Copy.png"),
              ),
                accountName: Text("Zeeshan"),
                accountEmail: Text("provider Concept")),
            ListTile(
              onTap: (){
                provider.changeWidgetName('profile');
                Navigator.pop(context); //pop is used for one step back.
              },
              leading: const Icon(Icons.person_2_outlined,size: 40,),
              title: const Text("Profile",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
            ),
             ListTile(
              onTap: (){
                provider.changeWidgetName('Menue');
                Navigator.pop(context);
              },
              leading: Icon(Icons.menu,size: 40,),
              title: Text("Menue",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
            ),
          ],
        ),
      ),
      body:
      provider.getWidgetName=='profile'? const WidgetProfile(): WidgetMenu(),
    );
  }
}
