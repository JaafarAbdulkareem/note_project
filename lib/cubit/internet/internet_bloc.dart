import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/cubit/internet/internet_event.dart';
import 'package:note_application/cubit/internet/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? _streamSubscription;
  InternetBloc() : super(InitialState()) {
    on<InternetEvent>((event, emit) {
      if (event is ConnectedEvent) {
        emit(ConnectedState());
      }
      if (event is NotConnectedEvent) {
        emit(NotConnectedState());
      }
    });

    _streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      for (var element in result) {
        if (element == ConnectivityResult.wifi ||
            element == ConnectivityResult.mobile) {
          add(ConnectedEvent());
        } else {
          add(NotConnectedEvent());
        }
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription!.cancel();
    return super.close();
  }
}
