import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        child: Padding(
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
                                  "Current Weather",
                                  style: GoogleFonts.spaceGrotesk(fontSize: 16),
                                ),
                                IconButton(
                                  onPressed: () {
                                    print("eyes");
                                  },
                                  icon:
                                      const Icon(Icons.remove_red_eye_outlined),
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '300 F',
                          style: GoogleFonts.epilogue(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 28),
                          ),
                        ),
                        Icon(
                          Icons.cloud,
                          size: 63,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Rain',
                          style: GoogleFonts.epilogue(
                            textStyle: TextStyle(fontSize: 19),
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
              SizedBox(
                height: 15,
              ),

              // this scrollable list
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "03:00",
                                style: GoogleFonts.epilogue(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Icon(Icons.cloud),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "320.12",
                                style: GoogleFonts.epilogue(
                                    textStyle: TextStyle(fontSize: 14)),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
