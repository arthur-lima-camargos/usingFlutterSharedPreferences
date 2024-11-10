import 'package:flutter/material.dart';

import '../components/app_bar.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'List Page'),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item ${index + 1}',
                style: const TextStyle(color: Colors.black)),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Clicked on Item ${index + 1}')),
              );
            },
          );
        },
      ),
    );
  }
}
