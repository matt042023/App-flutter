import 'package:flutter/material.dart';
import 'package:scratch/services/list_service.dart';

import '../component/listItem.dart';


class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final items = itemsList;

  deleteItem(int idx) {
    setState(() {
      print('delete $idx');
      itemsList.removeAt(idx);
  });}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
         itemCount: items.length +1,
      itemBuilder: (context, index) {
           if (index == items.length) {
             return Padding(
               padding: const EdgeInsets.all(35.0),
               child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(12.0)
                   ),
                       backgroundColor:  Colors.black
                 ),


                   onPressed: () => Navigator.of(context).pushNamed('/form'),
                   child: const Text('Add new Item',
                     style: TextStyle(
                         fontSize: 24,
                         color: Colors.blue
                     ),
                   )
               ),
             );
           }
           final item = items[index];
           final picture = item['picture'];
           final title = item['title'];
           return ListItem(picture: picture, title: title, index: index, delItem: deleteItem
           );
      },
      );
  }
}


