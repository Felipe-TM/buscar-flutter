import 'package:buscar/common_widgets/google_map_widget.dart';
import 'package:flutter/material.dart';

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
    mapWidget = GoogleMapWidget(
      markers: Set(),
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
        body: TabBarView(
          children: [
            mapWidget,
            Page2(),
            Page3(),
          ],
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

class Page3 extends StatelessWidget {
  const Page3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text('Em desenvolvimento')));
  }
}

class Page2 extends StatelessWidget {
  const Page2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text('Em desenvolvimento')));
  }
}
