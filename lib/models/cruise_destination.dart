class CruiseDestination {
  final String name;
  final String location;
  final String imageUrl;
  final String imageCaption;
  final String description;
  final int initialRatingCount;

  const CruiseDestination({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.imageCaption,
    required this.description,
    required this.initialRatingCount,
  });
}