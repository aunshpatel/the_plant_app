import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/plant.dart';
import '../services/plant_services.dart';

// States
abstract class PlantState {}
class PlantLoading extends PlantState {}
class PlantLoaded extends PlantState {
  final List<Plant> plants;
  PlantLoaded(this.plants);
}
class PlantError extends PlantState {
  final String message;
  PlantError(this.message);
}

// Events
abstract class PlantEvent {}
class FetchPlants extends PlantEvent {}

// Bloc
class PlantBloc extends Bloc<PlantEvent, PlantState> {
  final PlantService plantService;

  PlantBloc(this.plantService) : super(PlantLoading()) {
    on<FetchPlants>((event, emit) async {
      try {
        final plants = await plantService.fetchPlants();
        emit(PlantLoaded(plants));
      } catch (e) {
        emit(PlantError('Failed To Fetch Plants'));
      }
    });
  }
}
