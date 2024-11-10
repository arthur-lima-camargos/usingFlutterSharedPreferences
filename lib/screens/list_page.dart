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
          return Column(
            children: [
              ListTile(
                title: Text(
                  'Item ${index + 1}',
                  style: const TextStyle(color: Colors.black),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Item ${index + 1}'),
                        content: Text('Subtítulo do Item ${index + 1}'),
                        actions: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.black),
                            ),
                            child: const Text(
                              'Fechar',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              if (index < 19) const Divider(),
            ],
          );
        },
      ),
    );
  }
}
