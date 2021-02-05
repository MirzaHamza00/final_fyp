class ScreenArguments {
  final double latitude;
  final double longitude;
  final String dest;
  ScreenArguments(this.latitude, this.longitude, this.dest);
}

class FamousArguments {
  final String id;
  final String name;
  final List<String> historical;
  final List<String> cultural;
  final List<String> religious;
  final List<String> pics;

  FamousArguments(
    this.id,
    this.name,
    this.historical,
    this.cultural,
    this.religious,
    this.pics,
  );
}
