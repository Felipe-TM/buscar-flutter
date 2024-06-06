import 'package:buscar/common_widgets/google_map_widget.dart';
import 'package:buscar/features/rides/add_ride/presentation/add_ride_page1.dart';
import 'package:buscar/features/rides/add_ride/presentation/add_ride_page2.dart';
import 'package:buscar/features/rides/add_ride/presentation/add_ride_page3.dart';
import 'package:buscar/features/rides/ride_model/ride_details_model.dart';
import 'package:buscar/features/rides/ride_model/ride_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class AddRideScreen extends StatefulWidget {
  const AddRideScreen({super.key});

  @override
  State<AddRideScreen> createState() => _AddRideScreenState();
}

class _AddRideScreenState extends State<AddRideScreen>
    with SingleTickerProviderStateMixin {
  late GoogleMapWidget mapWidget;
  late TabController _tabController;

  @override
  void initState() {
    mapWidget = const GoogleMapWidget(
      markers: <Marker>{},
    );
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Oferecer Carona'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider<RideModel>(
              create: (context) => RideModel(),
            ),
            ChangeNotifierProvider<RideDetailsModel>(
              create: (BuildContext context) => RideDetailsModel(),
            )
          ],
          child: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              AddRidePage1(),
              SingleChildScrollView(
                child: AddRidePage2(),
              ),
              AddRidePage3(),
            ],
          ),
        ),
        bottomNavigationBar: const TabBar(tabs: [
          Tab(
            icon: Icon(Icons.map_outlined),
          ),
          Tab(
            icon: Icon(Icons.list_alt),
          ),
          Tab(
            icon: Icon(Icons.check_sharp),
          )
        ]),
      ),
    );
  }
}
