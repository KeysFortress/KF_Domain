class ExchangedData {
  String name;
  int type;
  bool missing;

  ExchangedData(this.name, this.type, this.missing);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'missing': missing,
    };
  }

  factory ExchangedData.fromJson(Map<String, dynamic> json) {
    return ExchangedData(
      json['name'] as String,
      json['type'] as int,
      json['missing'] as bool,
    );
  }
}
