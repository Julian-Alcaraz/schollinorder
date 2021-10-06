//importar pagina genera eventoç
// login al iniciar sesion
//--------------------- al inicar sesion se dispara este evento-----------------
class PrincipalEvent {
  String tipoCuenta;
  String contrasenia;
  String correoElectronico;
  void tipoDeCuenta() {
    switch (tipoCuenta) {
      case 'alumno':
        AlumnoEvent(/* contrasenia, correoElectronico */);
        break;
      case 'profesor':
        ProfesorEvent(/* contrasenia, correoElectronico */);
        break;

      case 'administradores':
        AdministradoresEvent(/* contrasenia, correoElectronico */);
        break;

      default:
      //statment

    }
  }
}

//-------------dependiendo el tipo de cuenta se disapar un estado-------------
class AlumnoEvent {}

class AdministradoresEvent {}

class ProfesorEvent {}

//--------- una vez sabemos que tipo de  cuenta es ejecutamos el evento correspondiente---------------------
// eventos de cargaod exitoso de las 3 variables
class LoadedAlumnoEvent extends AlumnoEvent {}

class LoadedAdminEvent extends AdministradoresEvent {}

class LoadedProfesorEvent extends ProfesorEvent {}
// evento de no cargado de las 3 variables

class DenegadoAlumnoEvent extends AlumnoEvent {}

class DenegadoAdministradoresEvent extends AdministradoresEvent {}

class DenegadoProfesoresEvent extends ProfesorEvent {}

//evento de errores de las 3 variables

class ErrorAlumnoEvent extends AlumnoEvent {}

class ErrorAdministradoresEvent extends AdministradoresEvent {}

class ErrorProfesorEvent extends ProfesorEvent {}

//------ Evento de registrar una CrearCuenta--------------
class LoginEvent {}

//------ acepta la cuenta
class AceptadaEvent extends LoginEvent {}

//------ existe la cuenta
class ExisteEvent extends LoginEvent {}
