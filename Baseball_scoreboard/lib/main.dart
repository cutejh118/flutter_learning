import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  late Timer _timer;

 var _time = 0;

 var _isRunning = false;

  @override
   void _dispose() { 
   _timer.cancel();
   super.dispose();  
  }
  late Animation<double> _animation;
  late AnimationController _animationController;

 @override
  void initState(){
        
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    
    
    super.initState();


  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: _buildBody(),
      //Init Floating Action Bubble 
      floatingActionButton: FloatingActionBubble(
        // Menu items
        items: <Bubble>[

          // Floating action menu item
          
          Bubble(
            title:"재시작",
            iconColor :Colors.white,
            bubbleColor : Colors.blue,
            icon:Icons.restore_outlined,
            titleStyle:TextStyle(fontSize: 16 , color: Colors.white),
            onPress: () {
              _reset();
              _animationController.reverse();
            },
          ),
          // Floating action menu item
          Bubble(
            title:"시작/일시정지",
            iconColor :Colors.white,
            bubbleColor : Colors.blue,
            icon:_isRunning ? Icons.pause : Icons.play_arrow,
            titleStyle:TextStyle(fontSize: 16 , color: Colors.white),
            onPress: () {
              _clickButton();
              _animationController.reverse();
            },
          ),
          Bubble(
            title:"경기종료/기록",
            iconColor :Colors.white,
            bubbleColor : Colors.blue,
            icon: Icons.sports_baseball,
            titleStyle:TextStyle(fontSize: 16 , color: Colors.white),
            onPress: () {
              _finish();
              _animationController.reverse();
            },
          ),
        ],

        // animation controller
        animation: _animation,

        // On pressed change animation state
        onPress: () => _animationController.isCompleted
              ? _animationController.reverse()
              : _animationController.forward(),
        
        // Floating Action button Icon color
        iconColor: Colors.blue,

        // Flaoting Action button Icon 
        iconData: Icons.menu, 
        backGroundColor: Colors.white,
      )
    );
  }
 Widget _buildBody(){

  var seconds = _time ~/ 100; 

  var hour = (seconds~/3600) < 10 ? 0 + (seconds~/3600) : (seconds~/3600);
  var min = ((seconds%3600)~/60) < 10 ? 0+ ((seconds%3600)~/60) : ((seconds%3600)~/60);
  var sec = seconds % 60 < 10 ? 0 + seconds % 60 : seconds % 60;


 return Center(
  child: Padding(
    padding: const EdgeInsets.only(top: 30),
    child: Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text('$hour:', style: const TextStyle(fontSize: 30.0),),
                Text('$min:', style: const TextStyle(fontSize: 30.0),),
                Text('$sec', style: const TextStyle(fontSize: 30.0),),
              ],
            ),
          ],
        ),
        ],
    ),
  ),
 );
}

  void _clickButton() {
  
  setState(() {
     _isRunning = !_isRunning;
  });
  if (_isRunning) {
      _start();
  }else{
    _pause();
  }
  }
  
  void _pause() {
    _timer.cancel();
  }

  void _start() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _time++;
      });
     });
  }

  void _reset() {
    setState(() {
      _isRunning = false;
      _timer.cancel();
      _time = 0;
    });
    }
  
  void _finish() {
    _timer.cancel();
  }


}
 

  
  

