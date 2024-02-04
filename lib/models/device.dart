import 'package:domain/models/device_connection_status.dart';
import 'package:domain/models/enums.dart';

class Device extends DeviceConnectionStatus {
  String name;
  String key;
  String ip;
  String port;
  DeviceTypes deviceType;

  Device(this.name, this.key, this.ip, this.port, this.deviceType);
}
