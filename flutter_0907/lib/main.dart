import 'package:flutter/material.dart';
import 'package:flutter_0907/first_page.dart';
import 'package:flutter_0907/second.dart';
import 'package:flutter_0907/person.dart';
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

enum Gender { MAN, WOMEN }

// 위 MYHomePAge 클래스의 상태를 나타내는 State 클래스
class _MyHomePageState extends State<MyHomePage> {
  late TabController _controller;
  int _counter = 0;
  String _tt = 'hello';
  late int _index;
  var _isChecked = false;

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

  DateTime? _selectedTime;
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('ㅎㅎ'),
  //     ),
  //     body: Text(
  //       'gㅇ',
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('test'),
  //     ),
  //     body: Align(
  //       alignment: Alignment.center,
  //       child: Padding(
  //         padding: EdgeInsets.all(10.0),
  //         child: Column(
  //           children: <Widget>[
  //             Checkbox(
  //               value: _isChecked,
  //               onChanged: (value) {
  //                 setState(() {
  //                   _isChecked = value!;
  //                 });
  //               } )
  //           ],
  //         ),
  //         ),
  //     ),
  //   );
  // }


  void flutterDialog() {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: const <Widget>[
                Text("Dialog Title"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "Dialog Content",
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text("취소"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void flutterDatePicker() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(), // 초깃값
      firstDate: DateTime(2018), // 시작일
      lastDate: DateTime(2030), // 마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark(), // 다크테마
          child: child!,
        );
      },
    );
    selectedDate.then((dateTime) {
      setState(() {
        _selectedTime = dateTime;
      });
    });
  }

  // Gender _gender = Gender.MAN;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ('Demo'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Flutter Dialog'),
  //     ),
  //     body: Column(
  //       children: <Widget>[
  //         // RaisedButton, Text 두개이상이니 children
  //         ElevatedButton(
  //           onPressed: () {flutterDatePicker();},
  //           child: Text('Date Picker'),
  //         ),
  //         Text('$_selectedTime'),
  //       ],
  //     ),
  //   );
  // }
  // Column(
  //     children: <Widget>[
  //       ListTile(
  //         title: Text('남자'),
  //     leading: Radio(
  //     value : Gender.MAN,
  //     groupValue: _gender,
  //     onChanged: (Gender? value){
  //       setState(() {
  //         _gender = value!;
  //       });
  //     },

  //   ),
  // ),
  // ListTile(
  //   title: Text('여자'),
  //     leading: Radio(
  //     value : Gender.WOMEN,
  //     groupValue: _gender,
  //     onChanged: (Gender? value){
  //       setState(() {
  //         _gender = value!;
  //       });
  //     },

  //   ),
  // ),
  // ]
  // )
  // );
  // }
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
  // //       // 아랫줄을 쓰지 않아도 탭이 4개 미만인 경우 기본으로 설정된다.
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
