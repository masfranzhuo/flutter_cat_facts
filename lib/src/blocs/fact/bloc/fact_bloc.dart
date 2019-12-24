import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  @override
  FactState get initialState => InitialFactState();

  @override
  Stream<FactState> mapEventToState(FactEvent event) async* {
    // TODO: Add Logic
  }
}
