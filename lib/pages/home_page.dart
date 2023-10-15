import 'dart:convert';

import 'package:cloud_app/secrets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'additonal_info.dart';
import 'hourly_forecast.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Map<String, dynamic>> getCurrentWeather() async {
    String cityName = "Nigeria";

    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$OPENWEATHERAPIKEY',
        ),
      );
      final data = jsonDecode(res.body);
      if (data['cod'] != '200') {
        throw data['message'];
      }
      // data['list'][0]['main']['temp'];
      // print(data['city']['name']);
      return data;
      // print(res.body);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cloud App",
          style: GoogleFonts.epilogue(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: FutureBuilder(
          future: getCurrentWeather(),
          builder: (context, snapshot) {
            print(snapshot);
            print(snapshot.runtimeType);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator.adaptive());
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: GoogleFonts.epilogue(),
                ),
              );
            }

            final data = snapshot.data!;
            // final currentWeatherData = data['list']
            final currentTemp = data['list'][0]['main']['temp'];
            final location = data['city']['name'];
            final currentSky = data['list'][0]['weather'][0]['main'];
            final currentPressure = data['list'][0]['main']['pressure'];
            final currentHumidity = data['list'][0]['main']['humidity'];
            final currentWind = data['list'][0]['wind']['speed'];

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Weather confirmation",
                    style: GoogleFonts.epilogue(
                        textStyle: const TextStyle(fontSize: 19)),
                  ),
                  // Main card
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Current Location : $location",
                                      style: GoogleFonts.spaceGrotesk(
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '$currentTemp K ',
                              style: GoogleFonts.epilogue(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                            Icon(
                              currentSky == 'Clouds' || currentSky == "Rain"
                                  ? Icons.cloud
                                  : Icons.sunny,
                              size: 63,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              currentSky,
                              style: GoogleFonts.epilogue(
                                textStyle: const TextStyle(fontSize: 19),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Weather Forecast ",
                    style: GoogleFonts.epilogue(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        final hourlyForecast = data['list'][index + 1];

                        final hourlyTime =
                            DateTime.parse(hourlyForecast['dt_txt'].toString());
                        return HourlyForecastItem(
                            time: DateFormat.j().format(hourlyTime),
                            temperature:
                                hourlyForecast['main']['temp'].toString(),
                            icon: hourlyForecast['weather'][0]['main'] ==
                                        "Clouds" ||
                                    hourlyForecast['weather'][0]['main'] ==
                                        "Rain"
                                ? Icons.cloud
                                : Icons.sunny);
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // This is for the additional information
                  Text(
                    "Additional Information",
                    style: GoogleFonts.epilogue(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdditionalInfo(
                        icon: Icons.water_drop,
                        label: "Humidity",
                        value: currentHumidity.toString(),
                      ),
                      AdditionalInfo(
                        icon: Icons.waves,
                        label: 'Pressure',
                        value: currentPressure.toString(),
                      ),
                      AdditionalInfo(
                        icon: Icons.air,
                        label: "Wind Speed",
                        value: currentWind.toString(),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
