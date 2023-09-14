import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login/login_bloc.dart';
import 'drivers_page.dart';
import 'login_page.dart';
import 'vehicles_page/vehicles_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginInitial) {
              return const LoginPage();
            } else if (state is LoginSuccess) {
              return buildTabs();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget buildTabs() {
    return DefaultTabController(
      length: 4,
        child: Scaffold(
          bottomNavigationBar: buildTabsNavigationBar(),
          body: const SafeArea(
            child: TabBarView(
              children: [
                Placeholder(),
                Placeholder(),
                DriversPage(),
                VehiclesPage(),
              ],
            ),
          ),
        ),
    );
  }

    Widget buildTabsNavigationBar() {
    return Container(
      color: const Color(0xFF3F5AA6),
      child: const TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.blue,
        tabs: [
          Tab(text: "Home", icon: Icon(Icons.euro_symbol)),
          Tab(text: "Calendar", icon: Icon(Icons.assignment)),
          Tab(text: "Drivers", icon: Icon(Icons.account_balance_wallet)),
          Tab(text: "Vehicles", icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
