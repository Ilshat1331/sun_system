part of 'galaxy_bloc.dart';

// sealed class GalaxyState {
//   late final List<Planet> planets;
// }

// final class GalaxyEmpty extends GalaxyState {
//   final List<Planet> planets;

//   GalaxyEmpty({required this.planets});
// }

final class GalaxyState {
  final List<Planet> planets;

  GalaxyState({required this.planets});

  GalaxyState copyWith({List<Planet>? planets}) {
    return GalaxyState(planets: planets ?? this.planets);
  }
}
