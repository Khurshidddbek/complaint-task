class QueryParameters {
  static Map<String, dynamic> complaintProfile({
    required int toUserId,
    required String category,
    required String text,
  }) =>
      {
        "to_user_id": toUserId,
        "category": category,
        "text": text,
      };
}
