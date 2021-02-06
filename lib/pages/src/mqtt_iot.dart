/* Copyright (C), 2015-2020, 广东零二科技 Group Co.,Ltd
 * @ProjectName: flutter_mqtt_iot
 * @Author: 02monkey QQ1353186685
 * @CreateDate: 2020/4/30 22:54
 */
/*
 * Package : mqtt_client
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 08/010/2017
 * Copyright :  S.Hamblett
 *
 */

import 'dart:async';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'common.dart';
import 'accept_receipt_processing.dart';

var mqttServerClinet;

Future<int> mqttsMain() async {
  mqttServerClinet = MqttServerClient(host, clientId);
  //mqttServerClinet.doAutoReconnect = true;
  void onConnected(){
    clientConnect = true;
    showLongToast('mqtt连接成功');
    print('mqtt连接成功');
  }
  //连接成功回调
  mqttServerClinet.onConnected = onConnected;
  //断开连接回调
  /// The unsolicited disconnect callback
  void onDisconnected() {
    clientConnect = false;
    showLongToast('错误:mqtt连接断开');
    print('EXAMPLE::OnDisconnected client callback - Client disconnection');
  }
  mqttServerClinet.onDisconnected = onDisconnected;
  /// The subscribed callback  onSubscribed
  void onSubscribed(String topic) {
    print('EXAMPLE::Subscription confirmed for topic $topic');
  }
  //订阅成功回调
  mqttServerClinet.onSubscribed = onSubscribed;
  // Set the port
  mqttServerClinet.port = int.parse(port);
  // Set secure
  mqttServerClinet.secure = false;
  mqttServerClinet.setProtocolV311();
  // logging if you wish
  mqttServerClinet.logging(on: true);
  await mqttServerClinet.connect(user, pass);
  if (mqttServerClinet.connectionStatus.state ==
      MqttConnectionState.connected) {
    //showLongToast('开始连接mqtt客户端...');
    print('iotcore client connected');
  } else {
    print(
        'ERROR iotcore client connection failed - disconnecting, state is ${mqttServerClinet.connectionStatus.state}');
        showLongToast('ERROR${mqttServerClinet.connectionStatus.state}');
    mqttServerClinet.disconnect();
  }

  mqttServerClinet.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
    final MqttPublishMessage recMess = c[0].payload;
    final pt =
    MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    print(
        'topic is <${c[0].topic}>, payload is <-- $pt -->');
    //收到mqtt订阅主题消息
    dataMap = pt;
    decodePerson();
  });

  print('EXAMPLE::Subscribing to the test/lol topic');
  //订阅主题
  //const topic = 'mqttMobile'; // Not a wildcard topic
  mqttServerClinet.subscribe(subTopic, MqttQos.atMostOnce);

  return 0;

}


// TODO: 发送mqtt主题消息函数
void publishMessage(pubTopic, data) {
  final builder = MqttClientPayloadBuilder();
  builder.addString(data);
  print('发送mqtt消息:$pubTopic::$data');
  mqttServerClinet.publishMessage(
      pubTopic, MqttQos.exactlyOnce, builder.payload);
}

//手动订阅主题
void subTopicCall() {
    mqttServerClinet.subscribe(subTopic, MqttQos.atMostOnce);
    print('手动订阅主题:$subTopic');
    showLongToast('已订阅');
}
void mqttDisconnect() {
  mqttServerClinet.disconnect();
  //showLongToast('mqtt断开连接');
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
//中移动onenet下发命令回复.
void oneNetCmdId(cmdId){

  publishMessage(pubMessage, '已处理OneNet下发命令');
}