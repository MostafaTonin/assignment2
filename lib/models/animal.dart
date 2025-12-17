class Animal {
  final String name;
  final String imagePath;
  final String soundPath;

  Animal({required this.name, required this.imagePath, required this.soundPath});

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      name: json['name'],
      imagePath: json['image'],
      soundPath: json['sound'],
    );
  }
}
