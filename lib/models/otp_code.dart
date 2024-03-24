class OtpCode {
  String id;
  String code;
  String issuer;
  String address;
  String secret;
  int? interval;

  OtpCode(this.id, this.code, this.address, this.issuer, this.secret,
      this.interval);

  // Convert a JSON object to a SignatureEvent instance
  factory OtpCode.fromJson(Map<String, dynamic> json) {
    return OtpCode(
      json['id'],
      "",
      json['address'] as String? ?? "",
      json['secret'] as String,
      json['issuer'] as String? ?? "",
      json['interval'] as int? ?? 30,
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
    if (issuer.isEmpty) {
      issuer = uri.queryParameters['issuer'] ?? '';
    }
    var interval = 30;
    var intervalData = uri.queryParameters['interval'];

    if (intervalData != null) {
      interval = int.parse(intervalData);
    }

    String secret = uri.queryParameters['secret'] ?? '';

    return OtpCode("", "", user, issuer, secret, interval);
  }

  // Convert a SignatureEvent instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'issuer': issuer,
      'address': address,
      'secret': secret,
      'interval': "",
    };
  }

  bool matchSecret(String matching) {
    return secret == matching;
  }
}
