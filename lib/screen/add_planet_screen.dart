import 'package:android_studio_check/bloc/galaxy_bloc.dart';
import 'package:android_studio_check/model/planet.dart';
import 'package:android_studio_check/widget/app_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddPlanetScreen extends StatefulWidget {
  const AddPlanetScreen({super.key});

  @override
  State<AddPlanetScreen> createState() => _AddPlanetScreenState();
}

class _AddPlanetScreenState extends State<AddPlanetScreen> {
  double _radius = 20;
  double _remote = 50;
  double _speed = 5;

  Color pickerColor = const Color.fromARGB(255, 158, 109, 182);
  Color currentColor = Colors.amber;

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Добавить планету"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Center(
                child: Icon(Icons.language, size: _radius, color: currentColor),
              ),
            ),
            AppSlider(
              min: 16,
              max: 60,
              label: "Радиус",
              value: _radius,
              onChanged: (double value) {
                setState(() {
                  _radius = value;
                });
              },
            ),
            AppSlider(
              min: 50,
              max: MediaQuery.of(context).size.width / 2 - 30,
              label: "Удалённость",
              value: _remote,
              onChanged: (double value) {
                setState(() {
                  _remote = value;
                });
              },
            ),
            AppSlider(
              min: 1,
              max: 60,
              label: "Скорость",
              value: _speed,
              onChanged: (double value) {
                setState(() {
                  _speed = value;
                });
              },
            ),
            ElevatedButton(
              child: const Text('Выбрать цвет'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    title: const Text('Pick a color!'),
                    content: SingleChildScrollView(
                      child: BlockPicker(
                        pickerColor: currentColor,
                        onColorChanged: changeColor,
                      ),
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        child: const Text('Got it'),
                        onPressed: () {
                          setState(() => currentColor = pickerColor);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          child: const Text("Добавить"),
          onPressed: () {
            context.read<GalaxyBloc>().add(
                  AddGalaxyEvent(
                    planet: Planet(
                      remote: _remote,
                      duration: _speed.round(),
                      radius: _radius,
                      color: currentColor,
                    ),
                  ),
                );
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
