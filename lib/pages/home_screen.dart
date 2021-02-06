/*
 * Copyright (C), 2015-2020, 广东零二科技 Group Co.,Ltd
 * @ProjectName: flutter_mqtt_iot
 * @Author: 02monkey QQ1353186685
 * @CreateDate: 2020/5/1 00:10
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/mqtt_iot.dart' show publishMessage;
import 'src/provider_multiprovider.dart' show ConfigChangeNotifier;
import 'package:fluttertoast/fluttertoast.dart';
import 'src/common.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //赋值context
    multiProviderHOME = Provider.of<ConfigChangeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('控制功能主页'),
        elevation: 0.0,
      ),
      body: Center(
        //通过Consumer接收动态数据
        child: Consumer<ConfigChangeNotifier>(builder: (context, counter, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '客户端ID: $clientId',
                maxLines: 1,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  height: 1.2,
                ),
              ),
              SizedBox(width: 200), //按钮间隔
              SwitchListTile(
                value: switchA,
                onChanged: (value) {
                  multiProviderHOME.switchSetA(value);
                  _publis('A', value);
                },
                title: Text('总开关'),
                secondary:
                    Icon(switchA ? Icons.fast_forward : Icons.fast_rewind),
                selected: switchA,
              ),
              SwitchListTile(
                value: switchB,
                onChanged: (value) {
                  multiProviderHOME.switchSetB(value);
                  _publis('B', value);
                },
                title: Text('开关1'),
                secondary:
                    Icon(switchB ? Icons.fast_forward : Icons.fast_rewind),
                selected: switchB,
              ),
              SwitchListTile(
                value: switchC,
                onChanged: (value) {
                  multiProviderHOME.switchSetC(value);
                  _publis('C', value);
                },
                title: Text('开关2'),
                secondary:
                    Icon(switchC ? Icons.fast_forward : Icons.fast_rewind),
                selected: switchC,
              ),
              SwitchListTile(
                value: switchD,
                onChanged: (value) {
                  multiProviderHOME.switchSetD(value);
                  _publis('D', value);
                },
                title: Text('开关3'),
                secondary:
                    Icon(switchD ? Icons.fast_forward : Icons.fast_rewind),
                selected: switchD,
              ),
            ],
          );
        }),
      ),
    );
  }
}

//按钮调用事件
void _publis(String sw, bool value) {
  if (clientConnect) {
    String data;
    data = '{"SW":"$sw","onOff":"$value"}';
    publishMessage(pubMessage, data);
    //发送主题消息
  } else {
    showLongToast('请先连接mqtt!');
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
