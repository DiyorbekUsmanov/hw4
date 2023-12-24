// favorite_city_model.dart
class FavoriteCity {
  int? id;
  String location;
  String time;

  FavoriteCity({
    this.id,
    required this.location,
    required this.time,
  });

  factory FavoriteCity.fromMap(Map<String, dynamic> map) {
    return FavoriteCity(
      id: map['id'],
      location: map['location'],
      time: map['time'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'location': location,
      'time': time,
    };
  }
}
