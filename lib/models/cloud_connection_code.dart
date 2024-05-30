class CloudConnectionCode {
  String url;
  String setupUrl;
  String secret;
  String id;

  CloudConnectionCode({
    required this.url,
    required this.setupUrl,
    required this.secret,
    required this.id,
  });

  factory CloudConnectionCode.empty() {
    return CloudConnectionCode(url: "", setupUrl: "", secret: "", id: "");
  }

  factory CloudConnectionCode.fromJson(Map<String, dynamic> json) {
    return CloudConnectionCode(
      url: json['url'] ?? "",
      setupUrl: json['setupUrl'] ?? "",
      secret: json['secret'] ?? "",
      id: json['id'] ?? "",
    );
  }

  factory CloudConnectionCode.fromQR(String qrCode) {
    var parseUri = Uri.parse(qrCode);
    var url = parseUri.queryParameters["url"];
    var secret = parseUri.queryParameters["secret"];
    var setup = parseUri.queryParameters["setup"];
    var finish = parseUri.queryParameters["finish"];
    var id = parseUri.queryParameters["id"];

    if (url == null ||
        setup == null ||
        finish == null ||
        secret == null ||
        id == null) {
      return CloudConnectionCode.empty();
    }

    return CloudConnectionCode(
      url: url,
      setupUrl: setup,
      secret: secret,
      id: id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'setupUrl': setupUrl,
      'secret': secret,
      'id': id,
    };
  }
}
