/* import 'package:schollinorder/BLoc/bloc.dart';
import 'package:equatable/equatable.dart';

class AlumnoState extends Equatable {
  final bool loading;
  final List<dynamic> algoNuevo;
  AlumnoState({/* required */ this.loading, /* required */ this.algoNuevo});
  static AlumnoState initialState() =>
      AlumnoState(loading: false, algoNuevo: []);
  AlumnoState copiarAlgo(
      {bool loading: true, /* required */ List<dynamic> copiarNuevo}) {
    return AlumnoState(
        loading: loading ?? this.loading,
        algoNuevo: algoNuevo ?? this.algoNuevo);
  }

  @override
  List<Object> get props => [this.loading, this.algoNuevo];
}

class AdministradorState extends Equatable {
  final bool loading;
  final List<dynamic> algoNuevo;
  AdministradorState(
      {/* required */ this.loading, /* required */ this.algoNuevo});
  static AdministradorState initialState() =>
      AdministradorState(loading: false, algoNuevo: []);
  AdministradorState copiarAlgo(
      {bool loading: true, /* required */ List<dynamic> copiarNuevo}) {
    return AdministradorState(
        loading: loading ?? this.loading,
        algoNuevo: algoNuevo ?? this.algoNuevo);
  }

  @override
  List<Object> get props => [this.loading, this.algoNuevo];
}

class ProfesorState extends Equatable {
  final bool loading;
  final List<dynamic> algoNuevo;
  ProfesorState({/* required */ this.loading, /* required */ this.algoNuevo});
  static ProfesorState initialState() =>
      ProfesorState(loading: false, algoNuevo: []);
  ProfesorState copiarAlgo(
      {bool loading: true, /* required */ List<dynamic> copiarNuevo}) {
    return ProfesorState(
        loading: loading ?? this.loading,
        algoNuevo: algoNuevo ?? this.algoNuevo);
  }

  @override
  List<Object> get props => [this.loading, this.algoNuevo];
}
 */