

import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime{
  String get formattedDate{
    return DateFormat('yyyy-MM-dd').format(this);
  }
}