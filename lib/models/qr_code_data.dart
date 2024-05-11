class QrCodeData {
  String initial;
  String finishChallenge;
  String forUser;
  String? bearer;
  String challenge;

  QrCodeData(
    this.initial,
    this.finishChallenge,
    this.forUser,
    this.bearer,
    this.challenge,
  );

  factory QrCodeData.fromJson(Map<String, dynamic> json) {
    return QrCodeData(
      json['Domain'] as String,
      json['VerifySignature'] as String,
      json['Uuid'] as String,
      json['Bearer'] as String?,
      json['Code'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Domain': initial,
      'VerifySignature': finishChallenge,
      'Uuid': forUser,
      'bearer': bearer,
      'code': challenge,
    };
  }
}
