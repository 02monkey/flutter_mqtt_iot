/*
 * Copyright (C), 2015-2020, 广东零二科技 Group Co.,Ltd
 * @ProjectName: flutter_mqtt_iot
 * @Author: 02monkey QQ1353186685
 * @CreateDate: 2020/5/1 0:11
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/provider_multiprovider.dart' show ConfigChangeNotifier;
import 'src/mqtt_iot.dart' show mqttsMain, mqttDisconnect;
import 'package:fluttertoast/fluttertoast.dart';
import 'src/read_write_configuration.dart' show incrementCounter;
import 'src/common.dart';

class MQTTScreen extends StatefulWidget {
  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<MQTTScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //获取保存文本
    TextEditingController controllerHost = new TextEditingController();
    TextEditingController controllerPort = new TextEditingController();
    TextEditingController controllerUser = new TextEditingController();
    TextEditingController controllerPass = new TextEditingController();
    TextEditingController controllerClient = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Mqtt属性配置'),
        elevation: 0.0,
      ),
      body: Center(
        //通过Consumer接收动态数据
        child: Consumer<ConfigChangeNotifier>(builder: (context, counter, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: controllerHost,
                onEditingComplete: () {
                  incrementCounter('host', controllerHost.text);
                  host = controllerHost.text;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: '服务器：',
                  labelStyle: TextStyle(color: Colors.red),
                  hintText: host,
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  hintMaxLines: 1,
                ),
              ),
              TextField(
                controller: controllerPort,
                onEditingComplete: () {
                  incrementCounter('port', controllerPort.text);
                  port = controllerPort.text;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.share),
                  hintText: port,
                  labelText: '端口：',
                  labelStyle: TextStyle(color: Colors.red),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: controllerUser,
                onEditingComplete: () {
                  incrementCounter('user', controllerUser.text);
                  user = controllerUser.text;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.people),
                  hintText: user,
                  labelText: '用户：',
                  labelStyle: TextStyle(color: Colors.red),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  hintMaxLines: 1,
                ),
              ),
              TextField(
                controller: controllerPass,
                onEditingComplete: () {
                  incrementCounter('pass', controllerPass.text);
                  pass = controllerPass.text;
                },
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.enhanced_encryption),
                  hintText: pass,
                  labelText: '密码：',
                  labelStyle: TextStyle(color: Colors.red),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  hintMaxLines: 1,
                ),
              ),
              TextField(
                controller: controllerClient,
                onEditingComplete: () {
                  incrementCounter('clinetId', controllerClient.text);
                  clientId = controllerClient.text;
                },
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.person_outline),
                  hintText: clientId,
                  labelText: '客户：',
                  labelStyle: TextStyle(color: Colors.red),
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  hintMaxLines: 1,
                ),
              ),
//              CheckboxListTile(
//                value: oneNet,
//                title: Text('中移动OneNet平台支持'),
//                activeColor: Colors.red,
//                dense: true,
//                selected: true,
//                isThreeLine: false,
//                secondary: Icon(Icons.book),
//                controlAffinity: ListTileControlAffinity.leading,
//                onChanged: (value) {
//                  setState(() {
//                    oneNet = value;
//                    incrementCounter('onenet', value.toString());
//                    if (value) {
//                     // oneNetSet();
//                    }
//                  });
//                },
//              ),
              Row(
                //水平方向排列
                mainAxisAlignment: MainAxisAlignment.center, //水平方向上居中
                children: <Widget>[
                  OutlineButton(
                      borderSide: BorderSide(color: Colors.blue, width: 3),
                      disabledBorderColor: Colors.black,
                      highlightedBorderColor: Colors.red,
                      child: Text('连接mqtt'),
                      onPressed: () {
                        if (clientConnect == false) {
                          mqttsMain();
                        } else {
                          showLongToast('请勿重复连接');
                        }
                      }),
                  OutlineButton(
                    borderSide: BorderSide(color: Colors.blue, width: 3),
                    disabledBorderColor: Colors.black,
                    highlightedBorderColor: Colors.red,
                    child: Text('断开mqtt'),
                    onPressed: () => mqttDisconnect(),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}

// TODO:package:fluttertoast
//Toast弹窗提示信息
void showLongToast(String msg) {
  print(msg);
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      fontSize: 16.0);
}

void oneNetSet() {
//MCU接受主题
  // $sys/312685/IMEI12345888888/cmd/request/+
  subTopic = r'$sys/' + '$user/$clientId/cmd/request/+';
  //$sys/312685/IMEI12345888888/cmd/response
  pubMessage = r'$sys/' + '$user/$clientId/cmd/request/+';
}
