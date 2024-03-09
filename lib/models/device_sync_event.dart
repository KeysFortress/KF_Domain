import 'package:domain/models/exchanged_data.dart';

class DeviceSyncEvent {
  String ip;
  DateTime dateTime;
  List<ExchangedData> exchanged;

  DeviceSyncEvent(this.ip, this.dateTime, this.exchanged);
}
