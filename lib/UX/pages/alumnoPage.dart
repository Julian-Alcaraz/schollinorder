/* import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schollinorder/BLoc/bloc.dart';

class AlumnosPage extends StatefulWidget {
  AlumnosPage({/* required */ Key key}) : super(key: key);
  @override
  _AlumnosPageState createState() => _AlumnosPageState();
}

class _AlumnosPageState extends State<AlumnosPage> {
  final AlumnosBloc _alumnosBloc = AlumnosBloc(bool, AlumnosBloc);

  @override
  void dispose() {
    super.dispose();
    _alumnosBloc.close();
  }

  Widget build(BuildContext context) {
    print("estoy en el home");
    return BlocProvider.value(
      value: _alumnosBloc,
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
} */
