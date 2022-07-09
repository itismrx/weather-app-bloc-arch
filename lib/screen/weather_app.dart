import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/weather_bloc.dart';

class WeatherApp extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherLoadInProgress) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Loading...')));
          }
        },
        builder: (context, state) {
          if (state is WeatherLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherLoadingFailed) {
            return const Text('Something went wrong');
          } else if (state is WeatherLoadingSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter City Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.sunny,
                        color: Colors.yellow,
                        size: 120,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${state.weather.temp.toString()} °C',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Text(
                        state.weather.city,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.text.isNotEmpty) {
                            context
                                .read<WeatherBloc>()
                                .add(WeatherRequest(city: controller.text));
                          }
                        },
                        child: const Text('Get Weather'),
                      )
                    ],
                  )
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
