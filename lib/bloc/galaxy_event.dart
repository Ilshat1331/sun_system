part of 'galaxy_bloc.dart';

sealed class GalaxyEvent {
  const GalaxyEvent();
}

final class AddGalaxyEvent extends GalaxyEvent {
  final Planet planet;

  const AddGalaxyEvent({required this.planet});
}
