import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schollinorder/BLoc/bloc.dart';

class ProfesoresPage extends StatefulWidget {
  ProfesoresPage({/* required */ Key key}) : super(key: key);

  @override
  _ProfesorPageState createState() => _ProfesorPageState();
}

class _ProfesorPageState extends State<ProfesoresPage> {
  final ProfesoresBloc _profesoresBloc = ProfesoresBloc(bool, ProfesoresBloc);

  @override
  void dispose() {
    super.dispose();
    _profesoresBloc.close();
  }

  Widget build(BuildContext context) {
    print("estoy en el home");
    return BlocProvider.value(
      value: _profesoresBloc,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<bool, AlumnosBloc>(
                builder: (_, state) {
                  print('estoy construyendo el patrón');
                  return Text('Termine de hacer $state');
                  //falta poner el input
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
