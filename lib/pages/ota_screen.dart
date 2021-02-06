/*
 * Copyright (C), 2015-2020, 广东零二科技 Group Co.,Ltd
 * @ProjectName: flutter_mqtt_iot
 * @Author: 02monkey QQ1353186685
 * @CreateDate: 2020/4/30 23:30
 */
import 'package:flutter/material.dart';
import 'src/provider_multiprovider.dart';
import 'package:provider/provider.dart';

class OTAScreen extends StatefulWidget {
  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<OTAScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  bool _switchItemA = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //final multiprovider = Provider.of<ConfigChangeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('OTA固件更新'),
        elevation: 0.0,
      ),
      body: Center(
        child: Consumer<ConfigChangeNotifier>(builder: (context, counter, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _switchItemA ? '😁' : '😐',
                style: TextStyle(fontSize: 32.0),
              ),
              Switch(
                value: _switchItemA,
                onChanged: (value) {
                  setState(() {
                    _switchItemA = value;
                  });
                },
              ),
              Text('还没开发...'),
              Switch(
                  value: _switchItemA,
                  onChanged: (newValue) {
                    setState(() {
                      _switchItemA = newValue;
                      //multiprovider.switchtextSet(newValue.toString());
                    });
                  }),
            ],
          );
        }),
      ),
    );
  }
}
