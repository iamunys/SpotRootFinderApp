import 'package:get/get.dart';

class WidgetSettingsController extends GetxController {
  final List placeType = [
    'Adventure',
    'Trekking',
    'Natural',
    'Beach',
    'Cultural',
    'Eco',
    'Medical',
    'Wildlife',
    'healthcare',
  ];
  final List monthList = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
    'Any month',
  ];
  final List timeList = [
    'Morning 4 am to 12 pm',
    'Afternoon 12 pm to 4 pm',
    'Evening 4 pm to 7 pm',
    'Night 9 pm to 4 am.',
    'Any time'
  ];
  final List whatHaveList = [
    'park',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
    'Any month',
  ];
  final List<String> _selectedPlaceType = [];
  final List<String> _selectedMonth = [];
  final List<String> _selectedTime = [];

  String _entryTimeisYes = 'NA';
  String _isOpenAllDay = 'NA';
  String _costisYes = 'NA';
  String _isFamilyYes = 'NA';
  String _holdFood = 'NA';
  String _willYouVisitAgain = 'Na';

  List<String> get selectedPlaceType => _selectedPlaceType;
  set addtoSelectedtypes(v) {
    _selectedPlaceType.add(v);
    update();
  }

  set deletefromSelectedtypes(v) {
    _selectedPlaceType.remove(v);
    update();
  }

  List<String> get selectedMonth => _selectedMonth;
  set addSelectedMonth(v) {
    _selectedMonth.add(v);
    update();
  }

  set deleteSelectedMonths(v) {
    _selectedMonth.remove(v);
    update();
  }

  List<String> get selectedTime => _selectedTime;
  set addSelectedTime(v) {
    _selectedTime.add(v);
    update();
  }

  set deleteSelectedTime(v) {
    _selectedTime.remove(v);
    update();
  }

  String get entryTimeisYes => _entryTimeisYes;
  set entryTimeisYes(v) {
    _entryTimeisYes = v;
    update();
  }

  String get isOpenAllDay => _isOpenAllDay;
  set isOpenAllDay(v) {
    _isOpenAllDay = v;
    update();
  }

  String get costisYes => _costisYes;
  set costisYes(v) {
    _costisYes = v;
    update();
  }

  String get isFamilyYes => _isFamilyYes;
  set isFamilyYes(v) {
    _isFamilyYes = v;
    update();
  }

  String get holdFood => _holdFood;
  set holdFood(v) {
    _holdFood = v;
    update();
  }

  String get willYouVisitAgain => _willYouVisitAgain;
  set willYouVisitAgain(v) {
    _willYouVisitAgain = v;
    update();
  }
}
