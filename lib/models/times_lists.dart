class TimesList {
  TimesList({
    required this.id,
    required this.categoryId,
    required this.sex,
    required this.lockerId,
    required this.timeRange,
    required this.isOccupied,
  });

  final int id; // for mations
  final int categoryId;
  late String sex;
  late String lockerId;
  final String timeRange;
  late String isOccupied;
}
