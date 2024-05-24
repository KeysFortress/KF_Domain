import 'package:domain/formatters/otp_algorithm_formatter.dart';
import 'package:otp/otp.dart';

class OtpCode {
  String id;
  String code;
  String issuer;
  String address;
  String secret;
  int? interval;
  int? lenght;
  Algorithm? algorithm;

  OtpCode(
    this.id,
    this.code,
    this.address,
    this.issuer,
    this.secret,
    this.interval,
    this.lenght,
    this.algorithm,
  );

  // Convert a JSON object to a SignatureEvent instance
  factory OtpCode.fromJson(Map<String, dynamic> json) {
    return OtpCode(
      json['id'],
      "",
      json['address'] as String? ?? "",
      json['secret'] as String,
      json['issuer'] as String? ?? "",
      json['interval'] == null || json['interval'] == ""
          ? 30
          : json['interval'],
      json['lenght'] == null || json['lenght'] == "" ? 6 : json['lenght'],
      json['algorithm'] == null
          ? Algorithm.SHA1
          : OtpAlgorithmFormatter.decodeAlgorithm(json['algorithm']),
    );
  }

  // Build an OtpCode instance from a TOTP QR code link
  factory OtpCode.fromQrCodeLink(String qrCodeLink) {
    Uri uri = Uri.parse(qrCodeLink);

    String issuerData =
        uri.pathSegments.length > 1 ? uri.pathSegments[1] : uri.pathSegments[0];
    var data = issuerData.split(':');
    var user = data.length > 1 ? data[1] : data[0];
    var issuer = data.length > 1 ? data[0] : "";

    if (user.isEmpty) {
      user = uri.queryParameters['user'] ?? '';
    }
    if (issuer.isEmpty) {}
    var interval = 30;
    var intervalData = uri.queryParameters['period'];
    var lenght = int.parse(uri.queryParameters['digits'] ?? "6");
    var algorithm = uri.queryParameters['algorithm'] == null
        ? Algorithm.SHA1
        : OtpAlgorithmFormatter.decodeAlgorithm(
            uri.queryParameters['algorithm'] ?? "SHA1");
    issuer = uri.queryParameters['issuer'] ?? '';

    if (intervalData != null) {
      interval = int.parse(intervalData);
    }

    String secret = uri.queryParameters['secret'] ?? '';

    return OtpCode("", "", user, issuer, secret, interval, lenght, algorithm);
  }

  // Convert a SignatureEvent instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'issuer': issuer,
      'address': address,
      'secret': secret,
      'interval': interval ?? 6,
      'lenght': lenght,
      'algorithm': algorithm != null ? algorithm!.name : "SHA1",
    };
  }

  bool matchSecret(String matching) {
    return secret == matching;
  }
}
