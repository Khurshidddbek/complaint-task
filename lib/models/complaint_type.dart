class ComplaintType {
  final String title;
  final String description;
  final bool commentOptional;

  ComplaintType({
    required this.title,
    this.description =
        "Отправьте жалобу, если пользователь рассылает рекламные сообщения, комментарии или другим способом распространяет рекламу в непредназначенных для этого местах.",
    this.commentOptional = true,
  });
}
