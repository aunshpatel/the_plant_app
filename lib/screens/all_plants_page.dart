import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/plant_bloc.dart';
import '../models/plant.dart';

class AllPlantsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Plants')),
      body: BlocBuilder<PlantBloc, PlantState>(
        builder: (context, state) {
          if (state is PlantLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PlantLoaded) {
            final plants = state.plants;
            return ListView.builder(
              itemCount: plants.length,
              itemBuilder: (context, index) {
                final plant = plants[index];
                return ListTile(
                  title: Column(
                    children: [
                      Column(
                        children: [
                          Image.network(plant.imageUrl),
                        ],
                      ),
                      Column(
                        children: [
                          Text(plant.name),
                        ],
                      )
                    ],
                  ),
                  // subtitle: Text(plant.type),
                  onTap: () {
                    Navigator.pushNamed(context, '/plant', arguments: plant);
                  },
                );
              },
            );
          } else if (state is PlantError) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
