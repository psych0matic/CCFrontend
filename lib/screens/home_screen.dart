import 'package:flutter/material.dart';

import '../service/ApiService.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.apiService});

  final ApiService apiService;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Countries"),
      ),
      body: FutureBuilder(
        future: widget.apiService.getCountries(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
              crossAxisCount: 6,
              children:
                  snapshot.data!.map((country) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    DetailsScreen(countryName: country.name!),
                          ),
                        );
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Image.network(country.flag!, width: 100),
                            Text(country.name!, style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
            );
          } else if (snapshot.hasError) {
            var msg = snapshot.error.toString();
            return Center(child: Text("Something went wrong!: ${msg}"));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
