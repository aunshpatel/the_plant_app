import 'package:flutter/material.dart';
import 'package:the_plant_app/screens/all_plants_page.dart';
import 'package:the_plant_app/screens/individual_plant_page.dart';
import 'package:the_plant_app/screens/widgets/bottom_nav.dart';
import 'package:the_plant_app/services/plant_services.dart';
import 'blocs/plant_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BlocProvider(
        create: (context) => PlantBloc(PlantService())..add(FetchPlants()),
        child: BottomNav(),
      ),
      routes: {
        '/plant': (context) => PlantDetailPage(),
      },
    );
  }
}