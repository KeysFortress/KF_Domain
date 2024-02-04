import 'package:domain/models/enums.dart';

class Device {
  String name;
  String key;
  String ip;
  String port;
  DeviceTypes deviceType;

  Device(this.name, this.key, this.ip, this.port, this.deviceType);
}
