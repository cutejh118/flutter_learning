import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors


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
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: '정희의 플러터 실습'), // 표시할 화면의 인스턴스
    );
  }
}

// 시작 클래스가 실제로 표시하는 클래스. 카운터 앱 화면
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 위 MYHomePAge 클래스의 상태를 나타내는 State 클래스
class _MyHomePageState extends State<MyHomePage> {
  late TabController _controller;
  int _counter = 0;
  String _tt = 'hello';
  late int _index;
  bool  _isChecked = false ;
// counter 변수를 1 증가시키고 화면을 다시 그리는 메서드
  void _incrementCounter() {
    setState(() {
      // 화면을 다시 그리도록 하는 함수. StatefulWidget만 가능
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
  }

  void _hello() {
    setState(() {
      _tt = 'hello';
    });
  }

  void _world() {
    setState(() {
      _tt = 'world';
    });
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Application'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value;
                  });
                }
              ),
              SizedBox(
                height: 40,
              ),
              Switch(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
출처: https://icodebroker.tistory.com/10039 [ICODEBROKER:티스토리]

  // int _selectedIndex = 0;

  // final List<Widget> _widgetOptions = <Widget>[

  //   Center(
  //     child: Card(
  //       elevation: 4.0,
  //       child: Image(
  //         image: AssetImage('assets/dotetimer.webp'),
  //       ),
  //     ),
  //   ),
  //   Column(
  //     children: const [
  //       CircularProgressIndicator(),
  //       TextField(
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(),
  //       labelText: '여기에 입력하소서'
  //     ),
  //   ),
  //     ],
  //   ),

  //   Text(
  //     'Index 2: School',
  //   ),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('BottomNavigationBar Sample'),
  //     ),
  //     body: Center(
  //       child: _widgetOptions.elementAt(_selectedIndex),
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //       showSelectedLabels: false,
  //       showUnselectedLabels: false,
  //       items: const <BottomNavigationBarItem>[
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.home),
  //           label: 'Home',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.business),
  //           label: 'Business',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.school),
  //           label: 'School',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.school),
  //           label: 'School',
  //         ),
  //       ],
  //       currentIndex: _selectedIndex,
  //       onTap: _onItemTapped,
  //       // 아랫줄을 쓰지 않아도 탭이 4개 미만인 경우 기본으로 설정된다.
  //       type: BottomNavigationBarType.fixed,

  //       selectedItemColor: Colors.black,
  //       unselectedItemColor: Colors.grey,
  //       backgroundColor: Colors.white,
  //     ),
  //   );
  // }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     bottomNavigationBar: BottomNavigationBar(
  //       showSelectedLabels: false,
  //       showUnselectedLabels: false,
  //       // 비텀네비게이션은 라벨을 넣고 숨겨줘야댐
  //       items: const <BottomNavigationBarItem>[
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.home),
  //           label: '홈',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.home),
  //           label: '홈',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.home),
  //           label: '홈',
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 3,
  //     child: Scaffold(
  //         appBar: AppBar(
  //           title: Text('Tab'),
  //           bottom: TabBar(
  //             tabs: <Widget>[
  //               Tab(icon: Icon(Icons.tag_faces)),
  //               Tab(text: '메뉴'),
  //               Tab(icon: Icon(Icons.tag_faces), text: '메누'),
  //             ],
  //           ),
  //         ),
  //         body: TabBarView(children: <Widget>[
  //           Container(
  //             color: Colors.yellow,
  //           ),
  //           Container(
  //             color: Colors.orange,
  //           ),
  //           ListView(
  //             scrollDirection: Axis.vertical,
  //             children: <Widget>[
  //               ListTile(
  //                 leading: const Icon(Icons.home),
  //                 title: const Text('home'),
  //                 trailing: const Icon(Icons.navigate_next),
  //                 onTap: () {},
  //               ),
  //             ],
  //           ),
  //         ])),
  //   );
  // }

  // 화면에 UI를 그리는 메서드. 그려질 위젯을 반환
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       // 머티리얼 디자인 기본 뼈대 위젯
  //       appBar: AppBar(
  //         // 상단 앱바
  //         title: Text(widget.title),
  //       ),
  //       body: PageView(
  //         children: <Widget>[
  //           Container(
  //             color: Colors.red,
  //           ),
  //           Container(
  //             color: Colors.orange,
  //           ),
  //           Container(
  //             color: Colors.yellow,
  //           ),
  //           ListView(
  //             scrollDirection: Axis.vertical,
  //             children: <Widget>[
  //               ListTile(
  //                 leading: const Icon(Icons.home),
  //                 title: const Text('home'),
  //                 trailing: const Icon(Icons.navigate_next),
  //                 onTap: () {},
  //               ),
  //             ],
  //           ),
  //         ],
  //       )
  //       // ListView(
  //       //   scrollDirection: Axis.vertical,
  //       //   children: <Widget>[
  //       //     ListTile(
  //       //       leading: Icon(Icons.home),
  //       //       title: Text('home'),
  //       //       trailing: Icon(Icons.navigate_next),
  //       //       onTap: () {},
  //       //     ),
  //       //     ListTile(
  //       //       leading: Icon(Icons.event),
  //       //       title: Text('Event'),
  //       //       trailing: Icon(Icons.navigate_next),
  //       //       onTap: () {},
  //       //     ),
  //       //     ListTile(
  //       //       leading: Icon(Icons.camera),
  //       //       title: Text('camera'),
  //       //       trailing: Icon(Icons.navigate_next),
  //       //       onTap: () {},
  //       //     ),
  //       //     Container(
  //       //       width: 100,
  //       //       height: 100,
  //       //       margin: const EdgeInsets.all(8.0),
  //       //       padding: const EdgeInsets.all(8.0),
  //       //       color: Colors.red,
  //       //     ),
  //       //   ],
  //       // )

  //       // SingleChildScrollView(
  //       //   child: Column(
  //       //     // mainAxisSize: MainAxisSize.max,
  //       //     // mainAxisAlignment: MainAxisAlignment.center,
  //       //     // crossAxisAlignment: CrossAxisAlignment.center,
  //       //     children: <Widget>[
  //       //       Container(
  //       //         color: Colors.red,
  //       //         width: 100,
  //       //         height: 100,
  //       //         padding: const EdgeInsets.all(8.0),
  //       //         margin: const EdgeInsets.all(8.0),
  //       //       ),
  //       //       Container(
  //       //         color: Colors.orange,
  //       //         width: 80,
  //       //         height: 80,
  //       //         padding: const EdgeInsets.all(8.0),
  //       //         margin: const EdgeInsets.all(8.0),
  //       //       ),
  //       //       Container(
  //       //         color: Colors.yellow,
  //       //         width: 70,
  //       //         height: 70,
  //       //         padding: const EdgeInsets.all(8.0),
  //       //         margin: const EdgeInsets.all(8.0),
  //       //       ),
  //       //       Container(
  //       //         color: Colors.green,
  //       //         width: 60,
  //       //         height: 60,
  //       //         padding: const EdgeInsets.all(8.0),
  //       //         margin: const EdgeInsets.all(8.0),
  //       //       ),
  //       //       Container(
  //       //         color: Colors.blue,
  //       //         width: 100,
  //       //         height: 100,
  //       //         padding: const EdgeInsets.all(8.0),
  //       //         margin: const EdgeInsets.all(8.0),
  //       //       ),
  //       //       Container(
  //       //         color: Colors.purple,
  //       //         width: 80,
  //       //         height: 80,
  //       //         padding: const EdgeInsets.all(8.0),
  //       //         margin: const EdgeInsets.all(8.0),
  //       //       ),
  //       //       Container(
  //       //         color: Colors.black,
  //       //         width: 70,
  //       //         height: 70,
  //       //         padding: const EdgeInsets.all(8.0),
  //       //         margin: const EdgeInsets.all(8.0),
  //       //       ),
  //       //     ],
  //       //   ),
  //       // ),

  //       // Center(
  //       //   // 표시할 내용
  //       //   child: Column(
  //       //     mainAxisAlignment: MainAxisAlignment.center,
  //       //     children: <Widget>[
  //       //       const Text(
  //       //         'You have pushed the button this many times:',
  //       //       ),
  //       //       Text(
  //       //         '$_counter', // _counter 변수를 표시
  //       //         style: Theme.of(context).textTheme.headline1,
  //       //       ),
  //       //       Text(
  //       //         '$_tt', // _counter 변수를 표시
  //       //         style: Theme.of(context).textTheme.headline1,
  //       //       ),
  //       //       ElevatedButton(
  //       //         onPressed: _decreaseCounter,
  //       //         child: const Icon(Icons.exposure_minus_1),
  //       //       ),
  //       //       ElevatedButton(
  //       //         onPressed: _hello,
  //       //         child: const Icon(Icons.dry),
  //       //       ),
  //       //       ElevatedButton(
  //       //         onPressed: _world,
  //       //         child: const Icon(Icons.dry_outlined),
  //       //       ),
  //       //     ],
  //       //   ),
  //       // ),
  //       // floatingActionButton: FloatingActionButton(
  //       //   onPressed: _incrementCounter, // 클릭 시 _incrementCounter() 메서드 실행
  //       //   tooltip: '꾹 눌렀을때',
  //       //   child: const Icon(Icons.add), // 상단 앱바
  //       // ),
  //       );
  // }
}
