import 'package:flutter/material.dart';
import '../models/plant.dart';

class PlantDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Plant plant = ModalRoute.of(context)!.settings.arguments as Plant;
    return Scaffold(
      appBar: AppBar(title: Text(plant.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(plant.imageUrl),
            SizedBox(height: 16),
            Text(plant.name, style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            // Text(plant.type, style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text(plant.description),
          ],
        ),
      ),
    );
  }
}
