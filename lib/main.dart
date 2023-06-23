import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
 const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var title = 'loading ...';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
             const SizedBox(
                height: 20,
              ),
              Center(
                  child: InkWell(
                onTap: () {
                  getdata();
                },
                child: Container(
                  height: 35,
                  width: 200,
                  color: Colors.blueAccent,
                  child: const Center(
                      child: Text(
                    'get data',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void getdata() async {
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    Response response = await get(uri);

    setState(() {
      title = jsonDecode(response.body)['title'];
    });
  }
}

  // This widget is the root of your application.
  