import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';

class NotificationsCubit extends Cubit<int> {
  Random rng = Random();

  NotificationsCubit() : super(0) {
    Timer.periodic(const Duration(seconds: 5), (Timer t) => _generate());
  }

  void _generate() {
    emit(rng.nextInt(99));
  }
}
