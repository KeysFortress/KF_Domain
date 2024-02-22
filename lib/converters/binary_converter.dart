import 'dart:convert';

class BianaryConverter {
  static String toHex(List<int> data) {
    return base64.encode(data);
  }

  static List<int> hexStringToList(String hexString) {
    return base64.decode(hexString);
  }
}
