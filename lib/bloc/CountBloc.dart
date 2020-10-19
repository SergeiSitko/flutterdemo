import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CountEvent, int> {
  @override
  Stream<int> mapEventToState(CountEvent event) async* {
    switch (event) {
      case CountEvent.plus:
        yield state + 1;
        break;
      case CountEvent.minus:
        yield state - 1;
        break;
    }
  }

  CounterBloc() : super(0);
}

enum CountEvent { plus, minus }


