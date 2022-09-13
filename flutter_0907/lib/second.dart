import 'package:flutter/material.dart';
import 'package:flutter_0907/person.dart';
import 'package:flutter_0907/first_page.dart';

class SecondPage extends StatelessWidget{
  final Person person;

  const SecondPage({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('second'),
      ),
      body: ElevatedButton(
        child: const Text('이전 페이지로'),
        onPressed: () {
          Navigator.pop(context, 'ok');
        },
      )
    );
  }
}