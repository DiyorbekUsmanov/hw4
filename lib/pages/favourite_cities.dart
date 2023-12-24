// favourite_cities.dart
import 'package:flutter/material.dart';
import '../services/database_helper.dart';
import '../services/favourite_city_model.dart';

class FavouriteCities extends StatefulWidget {
  @override
  _FavouriteCitiesState createState() => _FavouriteCitiesState();
}

class _FavouriteCitiesState extends State<FavouriteCities> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<FavoriteCity> favoriteCities = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteCities();
  }

  Future<void> _loadFavoriteCities() async {
    List<Map<String, dynamic>> citiesData = await dbHelper.getFavoriteCities();
    List<FavoriteCity> cities = citiesData.map((data) => FavoriteCity.fromMap(data)).toList();

    setState(() {
      favoriteCities = cities;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Cities'),
      ),
      body: ListView.builder(
        itemCount: favoriteCities.length,
        itemBuilder: (context, index) {
          FavoriteCity city = favoriteCities[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(
                city.location,
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(
                city.time,
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
