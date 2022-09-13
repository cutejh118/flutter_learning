import 'package:flutter/material.dart';
import 'package:flutter_0907/page1.dart';
import 'package:flutter_0907/page2.dart';
import 'package:flutter_0907/page3.dart';




// 앱 시작 부분
void main() {
  runApp(const MyApp());
}

// 시작 클래스. 머티리얼 디자인 엡 생성
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.black,

      ),
      home: const MyHomePage(),
    );
  }
}

// 시작 클래스가 실제로 표시하는 클래스. 카운터 앱 화면

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0;
  var _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
        '복잡한 UI',
        style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
            ),
            onPressed: () {},
          )
        ],
        centerTitle: true,
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label : ('홈'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label : ('이용서비스'),
            icon: Icon(Icons.assignment),
          ),
          BottomNavigationBarItem(
            label : ('내 정보'),
            icon: Icon(Icons.circle),
          ),
        ],
      ),
    );
  }
}