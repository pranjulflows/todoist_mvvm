import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension IntegetExtension on int? {
  bool get success {
    if (this == 200 || this == 201 || this == 204) {
      return true;
    }
    return false;
  }
}

extension DateTimeExtension on String {
  String changeDateFormat(
      {String originalFormat = "yyyy-MM-dd'T'hh:mm:ss.SSS'Z'",
      String desiredFormat = "MMM dd, yyyy hh:mm a"}) {
    final dateFormat = DateFormat(originalFormat);
    final originalDate = dateFormat.parse(this).toLocal();
    return DateFormat(desiredFormat).format(originalDate);
  }
}

extension MapExtension on Map {
  String get format {
    if (isEmpty) {
      return "";
    } else {
      var firstKey = entries.first.key;
      var mapValues = entries.first.value;
      return "?$firstKey=$mapValues";
    }
  }
}
