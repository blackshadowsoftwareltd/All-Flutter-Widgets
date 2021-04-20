import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  List data = [
    {
      'id': 1,
      'title': 'Untitle Data',
      'url':
          'https://images.pexels.com/photos/1760900/pexels-photo-1760900.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'
    },
    {
      'id': 2,
      'title': 'Unspacified Data',
      'url':
          'https://images.pexels.com/photos/4347487/pexels-photo-4347487.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List of Data')),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return ListTile(leading: Image.network('${item['url']}'),
              title: Text('${item['title']}'),
              onTap: ()=>print('${item['id']}'),
            );
          }),
    );
  }
}
