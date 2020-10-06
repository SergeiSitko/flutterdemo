import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorBackgroundBloc extends Cubit<Color> {
  ColorBackgroundBloc() : super(getNewColor());

  void getAnotherColor() => emit(getNewColor());

  static Color getNewColor() => Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}
