import 'package:flutter/cupertino.dart';

abstract class Complaint {
  Future<bool> requestComplaint(
      BuildContext context, int toUserId, String category, String text);
}
