//importar pagina genera eventoç
// login al iniciar sesion
class principalEvent {
  String tipoCuenta;
  String contrasenia;
  String correoElectronico;
  /* switch(tipoCuenta) {
          case alumno: {
            AlumnoEvent(contrasenia, correoElectronico);
            }
            break;

          case profesor: {
            ProfesorEvent(contrasenia, correoElectronico);
            }
            break;

          case administradores: {
          AdministradoresEvent(contrasenia, correoElectronico);
          } 
            break;

          default :{
            //statment
          }
        } */
}

class AlumnoEvent {}

class AdministradoresEvent {}

class ProfesorEvent {}

class LoadedAlumnoEvent extends AlumnoEvent {}

class LoadedAdminEvent extends AdministradoresEvent {}

class LoadedProfesorEvent extends ProfesorEvent {}

class DenegadoAlumnoEvent extends AlumnoEvent {}

class DenegadoAdministradoresEvent extends AdministradoresEvent {}

class DenegadoProfesoresEvent extends ProfesorEvent {}

class ErrorAlumnoEvent extends AlumnoEvent {}

class ErrorAdministradoresEvent extends AdministradoresEvent {}

class ErrorProfesorEvent extends ProfesorEvent {}

//CrearCuenta
class LoginEvent {}

class AceptadaEvent extends LoginEvent {}

class ExisteEvent extends LoginEvent {}
