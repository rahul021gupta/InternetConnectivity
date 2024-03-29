import 'package:bloc_demo/bloc/internet_bloc/event.dart';
import 'package:bloc_demo/bloc/internet_bloc/state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  //StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
    on<InternetlostEvent>((event, emit) => emit(InternetLostState()));

    _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetlostEvent());
      }
    });

    // @override
    // Future<void> close() {
    //   connectivitySubscription?.cancel();
    //   return super.close();
    // }
  }
}
