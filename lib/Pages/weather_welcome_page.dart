import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}


class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) => null);
    
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/weather.png"),fit: BoxFit.contain)
          ),
        ),
      ),
    );
  }
}
