import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination destination = const CruiseDestination(
    name: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    imageUrl: 'https://ik.imgkit.net/3vlqs5axxjf/TW-Asia/ik-seo/uploadedImages/Industry/Cruise/Borneo-River-Cruise-Beneath-Sibu-City-Skyline-261028/New-river-cruise-to-launch-in-Sarawak.jpg?tr=w-780%2Ch-440%2Cfo-auto',
    imageCaption: 'Sibu Esplanade Landmark',
    description:
    'Experience the heart of Sibu along Malaysia\'s longest river, the Rajang. '
        'Cruise past historic temples, timber hubs, and traditional waterfront settlements '
        'while experiencing authentic Sarawakian hospitality.',
    initialRatingCount: 66,
  );

  // Interactive States
  late int _starCount;
  bool _isStarred = false;
  DateTime _selectedDate = DateTime(2026, 11, 15);
  String _selectedPackage = 'Sunset Cruise';
  bool _isDarkMode = false;

  final List<String> cruisePackages = const [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  CruiseBookingViewModel() {
    _starCount = destination.initialRatingCount;
  }

  // Getters
  int get starCount => _starCount;
  bool get isStarred => _isStarred;
  DateTime get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;

  String get formattedDate =>
      '${_selectedDate.day.toString().padLeft(2, '0')}/'
          '${_selectedDate.month.toString().padLeft(2, '0')}/'
          '${_selectedDate.year}';

  // Actions / Mutators
  void toggleStar() {
    _isStarred = !_isStarred;
    _starCount += _isStarred ? 1 : -1;
    notifyListeners();
  }

  void updateDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  void updatePackage(String? newPackage) {
    if (newPackage != null && newPackage != _selectedPackage) {
      _selectedPackage = newPackage;
      notifyListeners();
    }
  }

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}