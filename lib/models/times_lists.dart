class TimesList {
  const TimesList({
    required this.id,
    required this.categoryId,
    required this.sex,
    required this.lockerId,
    required this.timeRange,
    required this.isOccupied,
  });

  final String id; // for mations
  final List<String> categoryId;
  final String sex;
  final String lockerId;
  final String timeRange;
  final String isOccupied;
}
