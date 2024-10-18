import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_player_app/provider/music_provider.dart';
import 'package:music_player_app/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // Makes the status bar color transparent
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MusicProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          onSurface: Colors.white,
          primary: Colors.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
