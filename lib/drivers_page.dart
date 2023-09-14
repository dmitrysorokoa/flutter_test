
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/models/drivers_model.dart';
import 'bloc/drivers/drivers_bloc.dart';

class DriversPage extends StatefulWidget {
  const DriversPage({super.key});

  @override
  _DriversPageState createState() => _DriversPageState();
}

class _DriversPageState extends State<DriversPage> {
  final DriversBloc _newsBloc = DriversBloc();

  @override
  void initState() {
    _newsBloc.add(GetDriversList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drivers')),
      body: _buildListDrivers(),
    );
  }

  Widget _buildListDrivers() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<DriversBloc, DriversState>(
          listener: (context, state) {
            if (state is DriversError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<DriversBloc, DriversState>(
            builder: (context, state) {
              if (state is DriversInitial) {
                return _buildLoading();
              } else if (state is DriversLoading) {
                return _buildLoading();
              } else if (state is DriversLoaded) {
                return _buildCard(context, state.driversModel);
              } else if (state is DriversError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, DriversModel model) {
    return ListView.builder(
      itemCount: model.drivers!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("id: ${model.drivers![index].id}"),
                  Text("name: ${model.drivers![index].name}"),
                  Text("username: ${model.drivers![index].username}"),
                  Text("email: ${model.drivers![index].email}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
