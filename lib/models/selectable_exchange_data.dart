import 'package:domain/models/otp_code.dart';
import 'package:domain/models/stored_identity.dart';
import 'package:domain/models/stored_secret.dart';

class SelectableExchangeData {
  List<StoredSecret> secrets;
  List<StoredIdentity> identities;
  List<OtpCode> otpCodes;

  SelectableExchangeData(this.secrets, this.identities, this.otpCodes);
}
