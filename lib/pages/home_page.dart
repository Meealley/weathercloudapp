import 'dart:convert';

import 'package:cloud_app/secrets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'additonal_info.dart';
import 'hourly_forecast.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future getCurrentWeather() async {
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
      data['list'][0]['main']['temp'];
      print(data['city']['name']);

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
              print("clicked on the button");
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
                    height: 220,
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
                                      "Current Location : ",
                                      style: GoogleFonts.spaceGrotesk(
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              '200 K ',
                              style: GoogleFonts.epilogue(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 28),
                              ),
                            ),
                            const Icon(
                              Icons.cloud,
                              size: 63,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Rain',
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

                  // this scrollable list
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        HourlyForecastItem(
                          icon: Icons.cloud,
                          time: "07:00",
                          temperature: '310',
                        ),
                        HourlyForecastItem(
                          icon: Icons.sunny,
                          time: "09:00",
                          temperature: '230',
                        ),
                        HourlyForecastItem(
                          icon: Icons.cloud,
                          time: "12:00",
                          temperature: '257',
                        ),
                        HourlyForecastItem(
                          icon: Icons.sunny_snowing,
                          time: "14:00",
                          temperature: '208',
                        ),
                        HourlyForecastItem(
                          icon: Icons.cloud,
                          time: "05:00",
                          temperature: '220',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 12,
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdditionalInfo(
                        icon: Icons.water_drop,
                        label: "Humidity",
                        value: "90",
                      ),
                      AdditionalInfo(
                        icon: Icons.waves,
                        label: 'Pressure',
                        value: '1000',
                      ),
                      AdditionalInfo(
                        icon: Icons.air,
                        label: "Wind Speed",
                        value: "7.8",
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
