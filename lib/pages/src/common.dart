/*
 * Copyright (C), 2015-2020, 广东零二科技 Group Co.,Ltd
 * @ProjectName: flutter_mqtt_iot
 * @Author: 02monkey QQ1353186685
 * @CreateDate: 2020/5/1 15:34
 */

//开关按钮属性
bool switchA = false;
bool switchB = false;
bool switchC = false;
bool switchD = false;

//mqtt属性
String host;
String port;
String user;
String pass;
String clientId;
//mqtt是否连接
bool clientConnect = false;
//配置是否读取
bool loadCounterConfig = false;
//app订阅主题
String subTopic;
//MCU接受主题
String pubMessage;

//导入全局状态需要的context,来自各个dart文件;
var multiProviderHOME;
var multiProviderOTA;
var multiProviderMQTT;
var multiProviderAPI;

