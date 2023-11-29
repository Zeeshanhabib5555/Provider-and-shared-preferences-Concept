import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHomeScreen extends StatefulWidget {
  const SpHomeScreen({Key? key}) : super(key: key);

  @override
  State<SpHomeScreen> createState() => _SpHomeScreenState();
}

class _SpHomeScreenState extends State<SpHomeScreen> {
  var nameController = TextEditingController();
  static const String KEYNAME = "logins"; // declare key name variable as KEYNAME.
  List<String> logins = [];

  @override
  void initState() {
    super.initState();
    loadLogins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(child: const Text("SharedPreferences")),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                hintText: "Enter name here",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // name is used for string data variable
                var name = nameController.text.toString();
                saveLogin(name);
                nameController.clear();
              },
              child: Text("Save"),
            ),
            SizedBox(height: 10),
            Text("Stored Logins:"),
            // Display the stored logins
            ListView.builder(
              shrinkWrap: true,
              itemCount: logins.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(logins[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveLogin(String login) async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      // Add the new login to the list
      logins.add(login);

      // Convert the list to a string
      String loginsString = logins.join(',');

      // Save the string to SharedPreferences
      prefs.setString(KEYNAME, loginsString);
    });
  }

  Future<void> loadLogins() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      // Retrieve the stored logins string
      String loginsString = prefs.getString(KEYNAME) ?? '';

      // Convert the string back to a list
      logins = loginsString.split(',');
    });
  }
}
