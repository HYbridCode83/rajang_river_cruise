import 'package:flutter/material.dart';

class BookingControlsWidget extends StatelessWidget {
  final String formattedDate;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final String selectedPackage;
  final List<String> packages;
  final ValueChanged<String?> onPackageChanged;
  final bool isDarkMode;
  final ValueChanged<bool> onThemeToggled;

  const BookingControlsWidget({
    super.key,
    required this.formattedDate,
    required this.selectedDate,
    required this.onDateSelected,
    required this.selectedPackage,
    required this.packages,
    required this.onPackageChanged,
    required this.isDarkMode,
    required this.onThemeToggled,
  });

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trip Preferences & Controls',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(height: 24),
            // 1. Visit Date Picker
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Cruise Date:'),
                TextButton.icon(
                  onPressed: () => _pickDate(context),
                  icon: const Icon(Icons.calendar_today, size: 18),
                  label: Text(
                    formattedDate,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // 2. Cruise Package Dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Cruise Package:'),
                DropdownButton<String>(
                  value: selectedPackage,
                  underline: const SizedBox(),
                  items: packages.map((String pkg) {
                    return DropdownMenuItem<String>(
                      value: pkg,
                      child: Text(pkg),
                    );
                  }).toList(),
                  onChanged: onPackageChanged,
                ),
              ],
            ),
            const SizedBox(height: 8),
            // 3. Dark Mode Theme Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dark Mode Theme:'),
                Switch(
                  value: isDarkMode,
                  onChanged: onThemeToggled,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}