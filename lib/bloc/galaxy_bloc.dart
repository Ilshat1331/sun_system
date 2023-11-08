import 'package:android_studio_check/model/planet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'galaxy_event.dart';
part 'galaxy_state.dart';

class GalaxyBloc extends Bloc<GalaxyEvent, GalaxyState> {
  GalaxyBloc()
      : super(GalaxyState(planets: [
          Planet(
            remote: 100,
            duration: 2,
            radius: 40,
            color: Colors.red,
          )
        ])) {
    on<GalaxyEvent>((event, emit) {
      return switch (event) {
        AddGalaxyEvent() => _addGalaxyEvent(event, emit),
      };
    });
  }

  _addGalaxyEvent(AddGalaxyEvent event, Emitter<GalaxyState> emitter) {
    emitter(GalaxyState(planets: List.from(state.planets)..add(event.planet)));
  }
}
