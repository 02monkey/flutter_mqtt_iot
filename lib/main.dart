/* Copyright (C), 2015-2020, 广东零二科技 Group Co.,Ltd
 * @ProjectName: flutter_mqtt_iot
 * @Author: 02monkey QQ1353186685
 * @CreateDate: 2020/4/30 22:18
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigation.dart';
import 'pages/src/provider_multiprovider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //顶层套用MultiProvider.
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: ConfigChangeNotifier())],
      child: MaterialApp(
        home: BottomNavigation(),
      ),
    );
  }
}
