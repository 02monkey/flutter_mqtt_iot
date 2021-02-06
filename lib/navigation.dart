/* Copyright (C), 2015-2020, 广东零二科技 Group Co.,Ltd
 * @ProjectName: flutter_mqtt_iot
 * @Author: 02monkey QQ1353186685
 * @CreateDate: 2020/4/30 22:25
 */
import 'package:flutter/material.dart';
import 'package:iot/pages/help_screen.dart';
import 'pages/home_screen.dart';
import 'pages/ota_screen.dart';
import 'pages/api_screen.dart';
import 'pages/mqtt_screen.dart';
import 'pages/src/read_write_configuration.dart' show loadCounter;

class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigation>
    with SingleTickerProviderStateMixin {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  var _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //读取配置
    loadCounter();
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomeScreen(),
          OTAScreen(),
          APIScreen(),
          MQTTScreen(),
          HelpScreen(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '主页',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.cloud_upload,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '更新',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '接口',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '配置',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '关于',
                style: TextStyle(color: _bottomNavigationColor),
              )),
        ],
      ),
    );
  }
}
