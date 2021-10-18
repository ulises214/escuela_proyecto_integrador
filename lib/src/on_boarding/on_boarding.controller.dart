import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/constants/images.dart';
import 'on_boarding.service.dart';

class OnBoardingController with ChangeNotifier {
  final OnBoardingService _service;
  late bool _isFirstTime;
  late List<OnBoardingTitleItem> _titleItems;
  late int _currentStep;
  late int _stepCount;
  OnBoardingController(this._service);
  int get currentStep => _currentStep;
  bool get isFirstTime => _isFirstTime;
  bool get isLastStep => _currentStep == _stepCount;
  int get stepCount => _stepCount;
  List<OnBoardingTitleItem> get titleItems => _titleItems;
  Future<void> finishOnBoarding() async {
    await _service.setIsFistTime(false);
    _isFirstTime = false;
    notifyListeners();
  }

  Future<void> init() async {
    _isFirstTime = await _service.getIsFistTime();
    _titleItems = const [
      OnBoardingTitleItem(
        title: 'Entrega de alimentos',
        imagePath: ImagesPaths.sushiPlato,
        description: 'Buscamos los restaurantes mejor valorados cerca de ti y '
            'te los llevamos directamente a la puerta',
      ),
      OnBoardingTitleItem(
        title: 'Entrega de alimentos',
        imagePath: ImagesPaths.breakFastPlato,
        description: 'Buscamos los restaurantes mejor valorados cerca de ti y '
            'te los llevamos directamente a la puerta',
      ),
      OnBoardingTitleItem(
        title: 'Entrega de alimentos',
        imagePath: ImagesPaths.hamburgerPlato,
        description: 'Buscamos los restaurantes mejor valorados cerca de ti y '
            'te los llevamos directamente a la puerta',
      ),
    ];
    _currentStep = 0;
    _stepCount = _titleItems.length - 1;
  }

  void nextStep() {
    if (!isLastStep) {
      _currentStep++;
    } else {
      finishOnBoarding();
    }
    notifyListeners();
  }

  Future<void> reset() async {
    await _service.clear();
    _isFirstTime = true;
    notifyListeners();
  }

  void toStep(int step) {
    _currentStep = step;
    notifyListeners();
  }

  static OnBoardingController of(BuildContext context) => context.watch();
  static OnBoardingController read(BuildContext context) => context.read();
}

class OnBoardingTitleItem {
  final String imagePath;
  final String title;
  final String description;

  const OnBoardingTitleItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}
