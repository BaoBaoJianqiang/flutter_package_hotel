import 'package:flutter/material.dart';

class Page12_1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context).settings.arguments;
    if(data == null) {
      data = '';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('酒店页面1' + data),
      ),
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key}):super(key:key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  //控制动画显示状态变量
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        //添加Opacity动画
        child: Image.asset('hotel_images/c5.png',
          package: 'flutter_package_hotel')
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          //控制动画显示状态
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: "显示隐藏",
        child: new Icon(Icons.flip),
      ),
    );
  }
}