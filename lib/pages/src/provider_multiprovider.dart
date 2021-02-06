/* Copyright (C), 2015-2020, 广东零二科技 Group Co.,Ltd
 * @ProjectName: flutter_mqtt_iot
 * @Author: 02monkey QQ1353186685
 * @CreateDate: 2020/4/30 22:40
 */

//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'common.dart';
//TODO:开关全局状态管理
class ConfigChangeNotifier with ChangeNotifier {
  //开关属性设置方法
  switchSetA(value) {
    switchA = value;
    notifyListeners();
    print('switchSetA:$value');
  }
  switchSetB(value) {
    switchB = value;
    notifyListeners();
    print('switchSetB:$value');
  }
  switchSetC(value) {
    switchC = value;
    notifyListeners();
    print('switchSetC:$value');
  }
  switchSetD(value) {
    switchD = value;
    notifyListeners();
    print('switchSetD:$value');
  }

  //mqtt属性设置方法
  hostSet(value) {
    host = value;
    notifyListeners();
    print('host:$value');
  }
  portSet(value) {
    port = value;
    notifyListeners();
    print('port:$value');
  }
  userSet(value) {
    user = value;
    notifyListeners();
    print('user:$value');
  }
  passSet(value) {
    pass = value;
    notifyListeners();
    print('pass:$value');
  }
  clientIdSet(value) {
    clientId = value;
    notifyListeners();
    print('clientId:$value');
  }
}
