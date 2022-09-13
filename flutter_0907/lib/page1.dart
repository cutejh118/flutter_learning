import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


final dummyItems =[
 'https://i.ytimg.com/vi/EOGoooGxixM/maxresdefault.jpg',
 'https://i.ytimg.com/vi/WxQ0-mqkFQ4/maxresdefault.jpg',
 'https://miniintern-upload.s3.ap-northeast-2.amazonaws.com/25825/1f032653-a5f8-49a2-8c3a-656827c5a45d/%EB%9E%9C%EB%94%A9%ED%8E%98%EC%9D%B4%EC%A7%80%EC%8A%A4%EB%A7%88%ED%8A%B8%EB%8F%99%EC%8A%A4%EC%BF%A8%EC%8D%B8%EB%84%A4%EC%9D%BC.png',
];


class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
        _test(), 
      ]
    );
  }
}

Widget _buildTop(){
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: (){
                // ignore: avoid_print
                print('클릭');
              },
              child: Column(
                children: const <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text(
                    '택시'
                  ),
                ]
              ),
            ),
            Column(
              children: const <Widget>[
                Icon(
                  Icons.local_taxi,
                  size: 40,
                ),
                Text(
                  '택시'
                ),
              ]
            ),
            Column(
              children: const <Widget>[
                Icon(
                  Icons.local_taxi,
                  size: 40,
                ),
                Text(
                  '택시'
                ),
              ]
            ),
            Column(
              children: const <Widget>[
                Icon(
                  Icons.local_taxi,
                  size: 40,
                ),
                Text(
                  '택시'
                ),
              ]
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: const <Widget>[
                Icon(
                  Icons.local_taxi,
                  size: 40,
                ),
                Text(
                  '택시'
                ),
              ]
            ),
            Column(
              children: const <Widget>[
                Icon(
                  Icons.local_taxi,
                  size: 40,
                ),
                Text(
                  '택시'
                ),
              ]
            ),
            Column(
              children: const <Widget>[
                Icon(
                  Icons.local_taxi,
                  size: 40,
                ),
                Text(
                  '택시'
                ),
              ]
            ),
            Opacity(
              opacity: 0.0,
              child: Column(
                children: const <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text(
                    '택시'
                  ),
                ]
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildMiddle(){
  return CarouselSlider(
  options: CarouselOptions(height: 150.0, autoPlay:  true, autoPlayInterval: const Duration(seconds: 10),
),
  items: dummyItems.map((url) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: const BoxDecoration(
            color: Colors.white
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(url, fit: BoxFit.cover,),
          )
        );
      },
    );
  }).toList(),
);
}

Widget _buildBottom(){
  final items = List.generate(10, (i) {
    return const ListTile(
      leading: Icon(Icons.notifications_none ),
      title: Text('[이벤트]공지사항입니다.'),
    );
});
  return  ListView(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    children: items,
  );


  }
    

Widget _test(){
  return  Container(
      color: Colors.blue,
      width: 100,
      height: 100,
  );
}
