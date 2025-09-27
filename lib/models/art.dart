class Art {
  final int id;
  final String name;
  final String artist;
  final String price;
  final String imagePath;
  final String description;

  Art({
    required this.id,
    required this.name,
    required this.artist,
    required this.price,
    required this.imagePath,
    this.description = "",
  });
}
