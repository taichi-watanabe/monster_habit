enum ObjectiveStatusType {
  runnning(title: '実行中'),
  achievement(title: '達成'),
  failure(title: '失敗');

  const ObjectiveStatusType({
    required this.title,
  });
  final String title;
}
