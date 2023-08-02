class SuperModel {
  final List<Superhero> superheros;

  SuperModel({
    required this.superheros,
  });

  factory SuperModel.fromJson(Map<String, dynamic> json) => SuperModel(
        superheros: List<Superhero>.from(
            json["superheros"].map((x) => Superhero.fromJson(x))),
      );
}

class Superhero {
  final String name;
  final String power;
  final String url;

  Superhero({
    required this.name,
    required this.power,
    required this.url,
  });

  factory Superhero.fromJson(Map<String, dynamic> json) => Superhero(
        name: json["name"],
        power: json["power"],
        url: json["url"],
      );
}
