import 'package:android_studio_check/bloc/galaxy_bloc.dart';
import 'package:android_studio_check/screen/add_planet_screen.dart';
import 'package:android_studio_check/widget/animated_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const double sunSize = 70;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width,
          height: size.width,
          alignment: Alignment.center,
          child: Stack(
            children: [
              const Icon(
                Icons.sunny,
                size: sunSize,
                color: Colors.amber,
              ),
              BlocBuilder<GalaxyBloc, GalaxyState>(
                builder: (context, state) {
                  return Stack(
                    children: state.planets
                        .map(
                          (e) => AnimatedCircle(
                            sunSize: sunSize,
                            remote: e.remote,
                            duration: e.duration,
                            radius: e.radius,
                            color: e.color,
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPlanetScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
