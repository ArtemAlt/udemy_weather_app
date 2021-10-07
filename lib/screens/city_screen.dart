import 'package:flutter/material.dart';

class CityScreenWidget extends StatefulWidget {
  const CityScreenWidget({Key? key}) : super(key: key);

  @override
  _CityScreenWidgetState createState() => _CityScreenWidgetState();
}

class _CityScreenWidgetState extends State<CityScreenWidget> {
  final TextEditingController cityField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "Weather",
          style: TextStyle(color: Colors.lime, fontSize: 35),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: cityField,
                decoration: const InputDecoration(
                  hintText: "Enter city name",
                ),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.pop(context,  cityField.text);
                },
                child: const Text(
                  "Get weather",
                  style: TextStyle(color: Colors.indigo),

                ))
          ],
        ),
      ),
    );
  }
}
