import 'package:time_fit_mobile/models/categroy.dart';
import 'package:time_fit_mobile/models/times_lists.dart';

const availableCategories = [
  Category(
    id: 1,
    title: "ダンベル (Danberu)",
    color: "Colors.purple",
  ),
  Category(
    id: 2,
    title: "バーベル (Bāberu) ",
    color: "Colors.red",
  ),
  Category(
    id: 3,
    title: "ランニングマシン (Ranningu Mashin)",
    color: "Colors.orange",
  ),
  Category(
    id: 4,
    title: "エクササイズボール (Ekusasaizu Bōru)",
    color: "Colors.brown",
  ),
];

// Dummay time lists picker
var dummyTimeList = [
  TimesList(
    id: 't1',
    categoryId: ['c1'],
    sex: 'M',
    lockerId: '167',
    timeRange: '9:00 - 9:30',
    isOccupied: 'false',
  ),
  TimesList(
    id: 't2',
    categoryId: ['c1'],
    sex: 'F',
    lockerId: '222',
    timeRange: '9:30 - 10:00',
    isOccupied: 'false',
  ),
  TimesList(
    id: 't3',
    categoryId: ['c1'],
    sex: '',
    lockerId: '',
    timeRange: '10:30 - 11:00',
    isOccupied: 'true',
  ),
  TimesList(
    id: 't4',
    categoryId: ['c1'],
    sex: '',
    lockerId: '',
    timeRange: '11:30 - 12:00',
    isOccupied: 'true',
  ),
  TimesList(
    id: 't5',
    categoryId: ['c1'],
    sex: '',
    lockerId: '',
    timeRange: '12:30 - 13:00',
    isOccupied: 'true',
  ),
  TimesList(
    id: 't6',
    categoryId: ['c1'],
    sex: '',
    lockerId: '',
    timeRange: '13:30 - 14:00',
    isOccupied: 'true',
  ),
  TimesList(
    id: 't7',
    categoryId: ['c1'],
    sex: '',
    lockerId: '',
    timeRange: '14:30 - 15:00',
    isOccupied: 'true',
  ),
  TimesList(
    id: 't8',
    categoryId: ['c1'],
    sex: '',
    lockerId: '',
    timeRange: '15:30 - 16:00',
    isOccupied: 'true',
  ),
  TimesList(
    id: 't9',
    categoryId: ['c1'],
    sex: '',
    lockerId: '',
    timeRange: '16:30 - 17:00',
    isOccupied: 'true',
  ),
];
