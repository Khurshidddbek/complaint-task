import 'package:flutter/material.dart';

import '../models/complaint_type.dart';

class ComplaintData extends ChangeNotifier {
  // #TODO: must come from the backend.
  String name = "Константин";
  String surname = "Володарский";
  int userId = 1;
  ComplaintType? selectedComplaintType;

  // #TODO: can come from the backend.
  final List<ComplaintType> complaintTypes = [
    ComplaintType(
      title: "Спам",
    ),
    ComplaintType(
      title: "Мошенничество",
      description:
          "Отправьте жалобу, если пользователь пытается обмануть вас или получить доступ к вашей личной информации.",
      commentOptional: false,
    ),
    ComplaintType(
      title: "Оскорбления",
      description:
          "Отправьте жалобу, если пользователь оскорбляет вас или других пользователей.",
    ),
    ComplaintType(title: "Откровенное изображение"),
    ComplaintType(title: "Проблема с профилем"),
    ComplaintType(title: "Нарушение интеллектуальных прав"),
    ComplaintType(title: "Прочее"),
  ];

  // #setters ==================================================================

  void updateSelectedComplaintType(ComplaintType newComplaintType) {
    selectedComplaintType = newComplaintType;
    ChangeNotifier();
  }
}
