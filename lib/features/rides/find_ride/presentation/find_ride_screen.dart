import 'package:buscar/features/rides/ride_model/ride_details_model.dart';
import 'package:buscar/features/rides/ride_model/ride_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'find_ride_page1.dart';
import 'find_ride_page2.dart';
import 'find_ride_page3.dart';

class FindRideScreen extends StatefulWidget {
  const FindRideScreen({super.key});

  @override
  State<FindRideScreen> createState() => _FindRideScreenState();
}

class _FindRideScreenState extends State<FindRideScreen> {
  late RideDetailsModel selectedRide;

  @override
  void initState() {
    selectedRide = RideDetailsModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Procurando Carona'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: MultiProvider(
            providers: [
              ChangeNotifierProvider<RideModel>(
                create: (context) => RideModel(),
              ),
            ],
            child: const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                FindRidePage1(),
                SingleChildScrollView(
                  child: FindRidePage2(),
                ),
                FindRidePage3(),
              ],
            ),
          ),
          bottomNavigationBar: const IgnorePointer(
            child: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.map_outlined),
                ),
                Tab(
                  icon: Icon(Icons.list_alt),
                ),
                Tab(
                  icon: Icon(Icons.search),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
