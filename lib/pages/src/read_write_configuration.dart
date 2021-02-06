/*
 * Copyright (C), 2015-2020, 广东零二科技 Group Co.,Ltd
 * @ProjectName: flutter_mqtt_iot
 * @Author: 02monkey QQ1353186685
 * @CreateDate: 2020/5/1 10:32
 */
import 'mqtt_iot.dart' show mqttsMain;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'common.dart';

//TODO : 读写配置
void loadCounter() async {
  if (loadCounterConfig == false) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    host = prefs.getString('host') ?? '10.0.0.168';
    port = prefs.getString('port') ?? '1883';
    user = prefs.getString('user') ?? 'user';
    pass = prefs.getString('pass') ?? 'passwd';
    clientId = prefs.getString('clinetId') ?? 'id12345678';
    subTopic = prefs.getString('subtopic') ?? 'mqttMobile';
    pubMessage = prefs.getString('pubmessage') ?? 'esp8266_client';
    //final  oneNetText = prefs.getString('onenet') ?? 'false';

    loadCounterConfig = true;
    print('读取配置: $host : $port : $user : $pass : $clientId : $subTopic : $pubMessage');
    //开始连接mqtt
    if (clientConnect == false) {
      mqttsMain();
    }
  }
}

//Incrementing counter after click
//写配置
void incrementCounter(key, value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('开始写配置:key:' + key + ' : ' + 'value:' + value);
  prefs.setString(key, value);
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
