enum HistoryObjectivesFilterType {
  all(title: '全て'),
  achievement(title: '達成'),
  failure(title: '失敗');

  const HistoryObjectivesFilterType({
    required this.title,
  });
  final String title;
}
