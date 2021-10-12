/* import 'package:schollinorder/BLoc/Events/events.dart';
import 'package:schollinorder/BLoc/State/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

// <>
class AlumnosBloc extends Bloc<AlumnoEvent, AlumnoState> {
  AlumnosBloc(AlumnoEvent initialState) : super(initialState) {
    add(LoadedAlumnoEvent());
  }
  @override
  Stream<AlumnoState> mapEventToState(AlumnoEvent event) async* {
    if (event is LoadedAlumnoEvent) {
      print('Cargando algo');
      yield this.state.copiarAlgo(loading: true, copiarNuevo: []);
      await Future.delayed(Duration(seconds: 2));
    } else if (event is NotLoadedAlumnoEvent) {
      print('No se pudo: ${event.position}');
    }
  }
} */
