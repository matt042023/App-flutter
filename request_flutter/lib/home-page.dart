import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:request_flutter/usermodels.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModels> userData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
//checking if snapshot has data
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: userData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
//showing in the List tile
                  child: ListTile(
                    title: Text('Name: ${userData[index].nom}'),
                    subtitle: Text('Surname: ${userData[index].prenom}'),
                    leading: Text('adresse: ${userData[index].adresse}'),
                    trailing: Text('mail: ${userData[index].mail}')
                  ),
                );
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    )
    );
  }

  Future<List<UserModels>> getData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/users/all'));
    var data = jsonDecode(response.body.toString());
/*jsonDecode is a Dart function provided by dart:convert library used
 to convert JSON data,
 received from an API or read from a file, into Dart objects.
 It transforms JSON strings into Dart maps or lists*/

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        userData.add(UserModels.fromJson(index));
      }
      return userData;
    }
    return userData; //empty list
  }
}