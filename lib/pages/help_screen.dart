/*
 * Copyright (C), 2015-2020, 广东零二科技 Group Co.,Ltd
 * @ProjectName: flutter_mqtt_iot
 * @Author: 02monkey QQ1353186685
 * @CreateDate: 2020/5/4 15:24
 */
/*
 * Copyright (C), 2015-2020, 广东零二科技 Group Co.,Ltd
 * @ProjectName: flutter_mqtt_iot
 * @Author: 02monkey QQ1353186685
 * @CreateDate: 2020/4/30 23:29
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/provider_multiprovider.dart' show ConfigChangeNotifier;

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //获取监听组件的状态
    //final multiprovider = Provider.of<ConfigChangeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('帮和助支持'),
        elevation: 0.0,
      ),
      body: Center(
        //通过Consumer接收动态数据
        child: Consumer<ConfigChangeNotifier>(builder: (context, counter, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Text('添加mqtt客户端连接需要的用户名和密码等功能'),
              Text('本App采用Flutter技术开发,开源代码不等于没有版权!'),
              Text('开源可能不算贡献,但绝不是免费劳动力!'),
              Text('未经本人许可禁止转载贩卖,禁止用于违法违纪用途.'),
              Text('本APP源码~版权,本人享有最终解释权!'),
              Text('开发者:零二猿 QQ1353186685 -- 交流群:710320220'),
            ],
          );
        }),
      ),
    );
  }
}
