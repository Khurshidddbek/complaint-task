import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task/domains/complaint.dart';
import 'package:task/network-services/apis.dart';
import 'package:task/network-services/http_requests.dart';
import 'package:task/network-services/query_parameters.dart';

class ComplaintService implements Complaint {
  @override
  Future<bool> requestComplaint(
      BuildContext context, int toUserId, String category, String text) async {
    try {
      final response = await HttpRequests.post(
        Apis.baseUrl + Apis.complaintProfile,
        QueryParameters.complaintProfile(
          toUserId: toUserId,
          category: category,
          text: text,
        ),
      );

      final data = jsonDecode(response.toString());

      return data["message"] == "success";
    } catch (e) {
      debugPrint("ComplaintService.requestComplaint Error: $e");
      return false;
    }
  }
}
