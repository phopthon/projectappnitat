class Art {
  final int id;
  final String name;
  final String artist;
  final String type;
  final String imagePath;
  final String description;

  Art({
    required this.id,
    required this.name,
    required this.artist,
    required this.type,
    required this.imagePath,
    this.description = "",
  });
}
