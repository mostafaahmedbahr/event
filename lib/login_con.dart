import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:dio/dio.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

import '../model.dart';

class LoginController extends GetxController {
  bool isLoadingUsers = false;
  Data? user;

  late ConfettiController _controllerCenter;
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;
  late ConfettiController _controllerTopCenter;
  late ConfettiController _controllerBottomCenter;
  ConfettiController get controllerCenter => _controllerCenter;

  ConfettiController get controllerCenterRight => _controllerCenterRight;

  ConfettiController get controllerCenterLeft => _controllerCenterLeft;

  ConfettiController get controllerTopCenter => _controllerTopCenter;

  ConfettiController get controllerBottomCenter => _controllerBottomCenter;

  Future<Data?> getRandomData() async {
    Future.delayed(const Duration(seconds: 50), () {});
    isLoadingUsers = true;
    update();
    Response response = await Dio().get(
        "https://askyourmentor.eraasoft.com/api/event/askyourmentor/flter-users");
    Future.delayed(const Duration(seconds: 10), () {});
    isLoadingUsers = false;
    update();
    final Model model = Model.fromJson(response.data);
    final Data? random = model.data?[Random().nextInt(model.data?.length ?? 0)];

    return random;
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    startAudio();
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  void onInit() {

    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    super.onInit();
  }

  @override
  void onClose() {
    _controllerCenter.dispose();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    _controllerTopCenter.dispose();
    _controllerBottomCenter.dispose();
    super.onClose();
  }

  final player = AudioCache(fixedPlayer: AudioPlayer());
  String audio = 'happy-loop-6978.mp3';

  void startAudio() {
    player.play('happy-loop-6978.mp3');
  }

  void stop() {
    player.fixedPlayer!.stop();
  }
}
