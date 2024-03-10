import 'package:domain/models/exchanged_data.dart';

class DeviceSyncEvent {
  String id;
  String ip;
  DateTime dateTime;
  List<ExchangedData> exchanged;
  int type;

  DeviceSyncEvent(this.id, this.ip, this.dateTime, this.exchanged, this.type);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ip': ip,
      'dateTime': dateTime.toIso8601String(),
      'exchanged': exchanged.map((data) => data.toJson()).toList(),
      'type': type
    };
  }

  factory DeviceSyncEvent.fromJson(Map<String, dynamic> json) {
    return DeviceSyncEvent(
      json['id'] as String,
      json['ip'] as String,
      DateTime.parse(json['dateTime'] as String),
      (json['exchanged'] as List<dynamic>)
          .map((data) => ExchangedData.fromJson(data))
          .toList(),
      json['type'] as int,
    );
  }
}
