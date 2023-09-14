import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/vehicles/vehicles_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/card.dart';

class VehiclesPage extends StatefulWidget {
  const VehiclesPage({super.key});

  @override
  State<VehiclesPage> createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {
  final VehiclesBloc _newsBloc = VehiclesBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: BlocProvider(
        create: (context) => _newsBloc,
        child: BlocBuilder<VehiclesBloc, VehiclesState>(
          builder: (context, state) {
            if (state is VehiclesInitial) {
              return ListView(children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Vehicles",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700)),
                    Icon(Icons.search)
                  ],
                ),
                Text("${state.vehicles.length} in total",
                    style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 20),
                for (var item in state.vehicles) VehicleCard(item: item),
              ]);
            } else {
              return Container();
            }
          },
        ),
      ),
    ));
  }
}
