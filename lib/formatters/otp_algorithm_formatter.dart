import 'package:otp/otp.dart';

class OtpAlgorithmFormatter {
  static Algorithm decodeAlgorithm(String algorithm) {
    switch (algorithm) {
      case "SHA1":
        return Algorithm.SHA1;
      case "SHA256":
        return Algorithm.SHA256;
      case "SHA512":
        return Algorithm.SHA512;
    }

    return Algorithm.SHA1;
  }
}
