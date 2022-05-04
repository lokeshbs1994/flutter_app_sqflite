import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app_sqflite/database_helper.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqflite Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () async {
                int i = await DatabaseHelper.instance
                    .insert({DatabaseHelper.columnName: 'Lokesh'});
                log('The inserted id is $i');
              },
              child: Text('insert'),
              color: Colors.grey,
            ),
            FlatButton(
              onPressed: () async {
                List<Map<String, dynamic>> queryRows =
                    await DatabaseHelper.instance.queryAll();
                print(queryRows);
              },
              child: Text('Query'),
              color: Colors.green,
            ),
            FlatButton(
              onPressed: () async {
                int updatedId = await DatabaseHelper.instance.update({
                  DatabaseHelper.columnId: 12,
                  DatabaseHelper.columnName: 'Mark'
                });
                print(updatedId);
              },
              child: Text('update'),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () async {
                int rowsEffected = await DatabaseHelper.instance.delete(17);
                print(rowsEffected);
              },
              child: Text('delete'),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
