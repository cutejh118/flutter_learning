import 'package:flutter/material.dart';
import 'package:flutter_0907/second.dart';
import 'package:flutter_0907/person.dart';

class FirstPage extends StatelessWidget{
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('first'),
      ),
      body: ElevatedButton(
        child: const Text('다음페이지로'),
        onPressed: () async {
          final person = Person(name: '여정희', age: 20);
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage(person: person)),
            ); 

            print(result);
        },
      )
    );
  }
}