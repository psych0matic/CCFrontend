import 'package:flag_explorer_web/service/ApiService.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.countryName});

  final String countryName;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Country Details"),
      ),
      body: FutureBuilder(
        future: ApiService(
          Uri.parse("http://localhost:3000"),
        ).getCountryDetails(widget.countryName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var countryDetails = snapshot.data!;
            return Center(
              child: SizedBox(
                width: 700,
                height: 700,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${countryDetails.name}",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Image.network(
                            countryDetails.flag!,
                            width: 400,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Population:",
                                  style: TextStyle(fontSize: 24),
                                ),
                                Text(
                                  "${countryDetails.population}",
                                  style: TextStyle(fontSize: 24),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text(
                                  "Capital City:",
                                  style: TextStyle(fontSize: 24),
                                ),
                                Text(
                                  "${countryDetails.capital}",
                                  style: TextStyle(fontSize: 24),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }
}
