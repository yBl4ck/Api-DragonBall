class Dados {
  int id;
  String name;
  String race;
  double ki;
  String imageUrl;

  Dados({
    required this.id,
    required this.name,
    required this.race,
    required this.ki,
    required this.imageUrl,
  });

  factory Dados.fromMap(Map<String, dynamic> map) {
    return Dados(
      id: (map["id"] as num).toInt(),
      name: map["name"] ?? "",
      race: map["race"] ?? "",
      
      // KI VIENE COMO STRING "60.000.000"
      ki: double.tryParse(
            map["ki"].toString().replaceAll(".", "")
          ) ?? 0,
      
      // La API usa "image", no "imageUrl"
      imageUrl: map["image"] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "race": race,
      "ki": ki,
      "image": imageUrl,
    };
  }
}
