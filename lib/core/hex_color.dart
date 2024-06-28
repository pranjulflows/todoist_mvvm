import 'dart:ui';

class HexColor {
  const HexColor._();

  static Color fromHex(String hexColor) {
    var color = hexColor.replaceAll("#", "0xFF");
    try {
      return Color(int.parse(color));
    } catch (e) {
      rethrow;
    }
  }
}
