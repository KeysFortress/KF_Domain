class StoredIdentity {
  String id;
  String name;
  String publicKey;
  String privateKey;

  StoredIdentity(this.id, this.name, this.privateKey, this.publicKey);

  factory StoredIdentity.fromJson(Map<String, dynamic> json) {
    return StoredIdentity(
      json['id'] as String,
      json['name'] as String,
      json['privateKey'] as String,
      json['publicKey'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'privateKey': privateKey,
      'publicKey': publicKey,
    };
  }
}
