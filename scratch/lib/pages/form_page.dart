


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final titleNameController = TextEditingController();
  String selectedPicture = 'android';
  @override
  void dispose() {
    super.dispose();
    titleNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulaire'),
        backgroundColor: const Color(0x800000ff),
      ),
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      hintText: 'Enter a Title',
                        border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field';
                      }
                      return null;
                    },
                    controller: titleNameController,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: DropdownButtonFormField(
                      items: const [
                        DropdownMenuItem(value: 'android', child: Text('Android'),),
                        DropdownMenuItem(value: 'flutter', child: Text('Flutter'),),
                        DropdownMenuItem(value: 'node', child: Text('Node'),),
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Picture',
                        hintText: 'Select a picture',
                        border: OutlineInputBorder()
                      ),
                      value: selectedPicture,
                      onChanged: (value) => setState(() {
                        selectedPicture = value!;
                      }),
                  ),
                )
              ]
            )
            ,
          )
    );
  }
}
