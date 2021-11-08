import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/constants/images.dart';
import 'on_boarding.service.dart';

const _titleData = [
  {
    'title': 'Lleva ya, comida rápida',
    'imagePath': ImagesPaths.sushiPlato,
    'description': 'Market place de comida rápida por restaurantes o tiendas',
  },
  {
    'title': 'Monitorea tu pedido',
    'imagePath': ImagesPaths.breakFastPlato,
    'description': 'Todo el proceso en tu mano: pago, pedido, envio y entrega',
  },
  {
    'title': 'Justa competencia',
    'imagePath': ImagesPaths.hamburgerPlato,
    'description': 'Precios justos para los clientes y vendedores',
  },
];

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
    _titleItems = _titleData
        .map(
          (e) => OnBoardingTitleItem(
            title: e['title']!,
            imagePath: e['imagePath']!,
            description: e['description']!,
          ),
        )
        .toList();
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
