import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schollinorder/BLoc/bloc.dart';

class AdministradoresPage extends StatefulWidget {
  AdministradoresPage({/* required */ Key key}) : super(key: key);

  @override
  _AdministradorPageState createState() => _AdministradorPageState();
}

class _AdministradorPageState extends State<AdministradoresPage> {
  final AdministradoresBloc _administradoresBloc =
      AdministradoresBloc(bool, AdministradoresBloc);

  @override
  void dispose() {
    super.dispose();
    _administradoresBloc.close();
  }

  Widget build(BuildContext context) {
    print("estoy en el home");
    return BlocProvider.value(
      value: _administradoresBloc,
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
