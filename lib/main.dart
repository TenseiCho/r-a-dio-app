import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'package:radio_app/screens/player_screen.dart';
import 'package:radio_app/config/theme.dart';

Future<void> main() async {
  runApp(MyMusicPlayerApp());
}

class MyMusicPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Music Player',
      theme: appTheme, // This comes from config/theme.dart
      home: PlayerScreen(),
    );
  }
}