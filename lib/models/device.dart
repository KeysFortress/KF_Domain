import 'package:domain/models/device_connection_status.dart';
import 'package:domain/models/enums.dart';

class Device extends DeviceConnectionStatus {
  String name;
  String key;
  String ip;
  String port;
  String mac;
  SyncTypes syncType;
  DeviceTypes deviceType;

  Device(
    this.name,
    this.key,
    this.ip,
    this.port,
    this.mac,
    this.deviceType,
    this.syncType,
  );

  // Named constructor to create a Device object from a JSON map
  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      json['name'] as String,
      json['key'] as String,
      json['ip'] as String,
      json['port'] as String,
      json['mac'] as String,
      DeviceTypes.values.byName(json['deviceType']),
      SyncTypes.values.byName(json['syncType']),
    );
  }
}
