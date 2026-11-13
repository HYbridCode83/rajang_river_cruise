import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final destination = viewModel.destination;

        return OrientationBuilder(
          builder: (context, orientation) {
            final isLandscape = orientation == Orientation.landscape;

            return Scaffold(
              appBar: AppBar(
                title: Text(
                  isLandscape
                      ? 'Sibu River Cruise & Heritage (Landscape Split View)'
                      : 'Sibu River Cruise & Heritage',
                ),
              ),
              body: isLandscape
                  ? _buildLandscapeLayout(destination)
                  : _buildPortraitLayout(destination),
            );
          },
        );
      },
    );
  }

  Widget _buildPortraitLayout(destination) {
    return ListView(
      children: [
        HeaderImageWidget(
          imageUrl: destination.imageUrl,
          caption: destination.imageCaption,
          isLandscape: false,
        ),
        ..._buildDetailWidgets(destination),
      ],
    );
  }

  Widget _buildLandscapeLayout(destination) {
    return Row(
      children: [
        // Left Pane: Header Image
        Expanded(
          flex: 1,
          child: HeaderImageWidget(
            imageUrl: destination.imageUrl,
            caption: destination.imageCaption,
            isLandscape: true,
          ),
        ),
        // Right Pane: Scrollable Details & Controls
        Expanded(
          flex: 1,
          child: ListView(
            children: _buildDetailWidgets(destination),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildDetailWidgets(destination) {
    return [
      TitleSectionWidget(
        title: destination.name,
        subtitle: destination.location,
        starCount: viewModel.starCount,
        isStarred: viewModel.isStarred,
        onStarPressed: viewModel.toggleStar,
      ),
      const Divider(height: 1),
      const ActionBarWidget(),
      const Divider(height: 1),
      DescriptionWidget(description: destination.description),
      BookingControlsWidget(
        formattedDate: viewModel.formattedDate,
        selectedDate: viewModel.selectedDate,
        onDateSelected: viewModel.updateDate,
        selectedPackage: viewModel.selectedPackage,
        packages: viewModel.cruisePackages,
        onPackageChanged: viewModel.updatePackage,
        isDarkMode: viewModel.isDarkMode,
        onThemeToggled: viewModel.toggleDarkMode,
      ),
    ];
  }
}