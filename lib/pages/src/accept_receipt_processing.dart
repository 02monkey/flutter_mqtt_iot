/*
 * Copyright (C), 2015-2020, 广东零二科技 Group Co.,Ltd
 * @ProjectName: flutter_mqtt_iot
 * @Author: 02monkey QQ1353186685
 * @CreateDate: 2020/5/2 17:03
 */
import 'dart:convert';
import 'common.dart';

//json数据
String dataMap;
//安全格式化json
class Person {
  String sw;
  String onOff;
  Person({this.sw, this.onOff});
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(sw: json['SW'], onOff: json['onOff']);
  }
}
// 将 json 字符串解析为 Person 对象
Future<Person> decodePerson() async {
  // 获取本地的 json 字符串
  // 解析 json 字符串，返回的是 Map<String, dynamic> 类型
  final jsonMap = json.decode(dataMap);
  print('jsonMap runType is ${jsonMap.runtimeType}');
  Person person = Person.fromJson(jsonMap);
  bool _value;
  if (person.onOff == 'true') {
    _value = true;
  } else {
    _value = false;
  }
  switch (person.sw) {
    case 'A':
      {
        multiProviderHOME.switchSetA(_value);
        print('switchA :  $_value');
      }
      break;
    case 'B':
      {
        multiProviderHOME.switchSetB(_value);
        print('switchB :  $_value');
      }
      break;
    case 'C':
      {
        multiProviderHOME.switchSetC(_value);
        print('switchC :  $_value');
      }
      break;
    case 'D':
      {
        multiProviderHOME.switchSetD(_value);
        print('switchD :  $_value');
      }
      break;
  }
  return person;
}

