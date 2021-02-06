# flutter_mqtt_iot


Flutter-Mqtts-esp8266物联网

Flutter-mqtt客户端支持MQTTS双向加密通信,域名证书认证!

Flutter-mqtt客户端支持:eps8266,nodemcu等.

数据发送格式:{"SW":"A","onOff":"true"}

SW代表开关,value值A,第一个,

onOff代表开关状态,value值true是开,false是关.
                 
mqtt客户端,APP端订阅的是:topic = 'mqttMobile'; // Not a wildcard topic

esp8266客户端订阅的是:pubTopic = 'esp8266_client';

此源码有以下功能:
1.保存配置信息并自动加载
2.app运行自动连接MQTT服务器
3.MCU状态变更后实时刷新界面
4...

image文件夹有功能预览. 
