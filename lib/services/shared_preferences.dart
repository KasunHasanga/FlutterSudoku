library shared_preferences_service;

import 'package:shared_preferences/shared_preferences.dart';

Future setPlayerLevel(int data) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('player_level', data);
  return;
}

Future getPlayerLevel() async {
  final prefs = await SharedPreferences.getInstance();
  int? getFlashLightOn = prefs.getInt('player_level');
  getFlashLightOn ??= 1;
  return getFlashLightOn;
}