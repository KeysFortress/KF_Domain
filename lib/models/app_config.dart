import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class AppConfig {
  final String apiEndpoint;
  final String schema;
  final String ip;
  final int port;
  final bool isLocal;
  final String localDatabasePath;
  final String jtwSecret;

  AppConfig({
    required this.apiEndpoint,
    required this.schema,
    required this.ip,
    required this.port,
    required this.isLocal,
    required this.localDatabasePath,
    required this.jtwSecret,
  });

  static AppConfig getNew() => AppConfig(
        isLocal: true,
        apiEndpoint: "",
        ip: "",
        port: 12345,
        schema: "",
        localDatabasePath: "",
        jtwSecret: "",
      );

  factory AppConfig.fromJson(Map<String, dynamic> jsonMap) {
    return AppConfig(
      apiEndpoint: jsonMap['apiUrl'],
      schema: jsonMap['schema'],
      ip: jsonMap['ip'],
      port: jsonMap['port'],
      isLocal: jsonMap['isLocal'],
      localDatabasePath: jsonMap['localDatabasePath'],
      jtwSecret: jsonMap['jtwSecret'] ?? "",
    );
  }

  static Future<AppConfig> load() async {
    final String jsonString =
        await rootBundle.loadString('packages/domain/config.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return AppConfig.fromJson(jsonMap);
  }
}
