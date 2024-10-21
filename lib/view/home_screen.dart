import 'package:flutter/material.dart';
import 'package:music_player_app/provider/music_provider.dart';
import 'package:music_player_app/view/component/custom_rows.dart';
import 'package:music_player_app/view/component/my_drawer.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // GlobalKey to manage the drawer

  @override
  Widget build(BuildContext context) {
    // instance of the provider
    final providerTrue = Provider.of<MusicProvider>(context);
    final providerFalse = Provider.of<MusicProvider>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey, // Assign the key to Scaffold
      drawer: const MyDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [black1, black2],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  // opening drawer
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: const Icon(Icons.menu, size: 30, color: Colors.white),
              ),
              SizedBox(height: height * 0.02),
              Text(
                'Hi There,',
                style: TextStyle(
                  color: green,
                  letterSpacing: 1.5,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Sahil',
                style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: height * 0.03),
              TextField(
                cursorColor: green,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: green,
                  ),
                  hintText: 'Songs, albums or artists',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              FutureBuilder(
                future: providerFalse.fetchApiData('a'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return const CustomRows(
                    text: 'Trending Now',
                  );
                },
              ),
              SizedBox(height: height * 0.03),
              FutureBuilder(
                future: providerFalse.fetchApiData('b'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('');
                  }

                  return const CustomRows(
                    text: 'Top Charts',
                  );
                },
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
