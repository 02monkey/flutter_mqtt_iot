/*
 * Copyright (C), 2015-2020, 广东零二科技 Group Co.,Ltd
 * @ProjectName: flutter_mqtt_iot
 * @Author: 02monkey QQ1353186685
 * @CreateDate: 2020/4/30 23:29
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/provider_multiprovider.dart' show ConfigChangeNotifier;
import 'src/common.dart';
import 'src/read_write_configuration.dart';
import 'src/mqtt_iot.dart' show subTopicCall;

class APIScreen extends StatefulWidget {
  @override
  _APIScreenState createState() => _APIScreenState();
}

class _APIScreenState extends State<APIScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //获取监听组件的状态
    //final multiprovider = Provider.of<ConfigChangeNotifier>(context);
    //获取保存文本
    TextEditingController controllerSubTopic = new TextEditingController();
    TextEditingController controllerPubMessag = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('接口功能'),
        elevation: 0.0,
      ),
      body: Center(
        //通过Consumer接收动态数据
        child: Consumer<ConfigChangeNotifier>(builder: (context, counter, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: controllerSubTopic,
                onEditingComplete: () {
                  //incrementCounter('subtopic', controllerSubTopic.text);
                  // subTopic = controllerSubTopic.text;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  //helperText: _server,
                  labelText: '用户名：',
                  labelStyle: TextStyle(color: Colors.red),
                  //hintText: '请输入需要订阅的主题',
                  hintText: '用户名',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  hintMaxLines: 1,
                ),
              ),
              //SizedBox(width: 400), //按钮间隔
              TextField(
                controller: controllerPubMessag,
                onEditingComplete: () {
                  // incrementCounter('pubmessag', controllerPubMessag.text);
                  //  pubMessage = controllerPubMessag.text;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  //helperText: _server,
                  labelText: '密码：',
                  labelStyle: TextStyle(color: Colors.red),
                  //hintText: '请输入需要发送的主题',
                  hintText: '密码',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  hintMaxLines: 1,
                ),
              ),
              // SizedBox(width: 100), //按钮间隔
              Row(
                  //水平方向排列
                  mainAxisAlignment: MainAxisAlignment.center, //水平方向上居中
                  children: <Widget>[
                    OutlineButton(
                        borderSide: BorderSide(color: Colors.blue, width: 3),
                        disabledBorderColor: Colors.black,
                        highlightedBorderColor: Colors.red,
                        child: Text('订阅主题'),
                        onPressed: () {
                          subTopicCall();
                        }),
                  ]),
              TextField(
                controller: controllerSubTopic,
                onEditingComplete: () {
                  incrementCounter('subtopic', controllerSubTopic.text);
                  subTopic = controllerSubTopic.text;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.check_circle),
                  labelText: '订阅的主题：',
                  labelStyle: TextStyle(color: Colors.red),
                  hintText: subTopic,
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  hintMaxLines: 1,
                ),
              ),
              TextField(
                controller: controllerPubMessag,
                onEditingComplete: () {
                  incrementCounter('pubmessag', controllerPubMessag.text);
                  pubMessage = controllerPubMessag.text;

                },
                decoration: InputDecoration(
                  icon: Icon(Icons.send),
                  labelText: '发送的主题：',
                  labelStyle: TextStyle(color: Colors.red),
                  hintText: pubMessage,
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  hintMaxLines: 1,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
