import 'package:buscar/common_widgets/google_map_widget.dart';
import 'package:buscar/common_widgets/loading_widget.dart';
import 'package:buscar/features/rides/find_ride/presentation/find_ride_page4.dart';
import 'package:buscar/features/rides/ride_model/ride_details_model.dart';
import 'package:buscar/features/rides/ride_model/ride_model.dart';
import 'package:buscar/features/rides/ride_repository/ride_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/navigation_button.dart';

class FindRidePage3 extends StatefulWidget {
  const FindRidePage3({super.key});

  @override
  State<FindRidePage3> createState() => _FindRidePage3State();
}

class _FindRidePage3State extends State<FindRidePage3>
    with TickerProviderStateMixin {
  late Set<Marker> _markers;
  bool isLoading = true;
  late AnimationController controller;
  late Set<RideDetailsModel> rides;
  late String loadingLabel;
  late RideDetailsModel currentSelection;

  @override
  void initState() {
    _markers = <Marker>{};
    rides = <RideDetailsModel>{};
    loadingLabel = 'Carregando...';
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    findRides();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void findRides() async {
    setState(() {
      loadingLabel = 'Procurando Caronas...';
    });
    RideModel model = Provider.of<RideModel>(context);
    rides = await Provider.of<RideRepository>(context).findRides(model);
    setState(() {
      loadingLabel = 'Adicionando pontos no mapa...';
    });
    for (var ride in rides) {
      _markers.add(
        Marker(
          markerId: MarkerId(ride.rideId!),
          position: ride.originCoord,
          infoWindow: InfoWindow(title: ride.getDriverName),
          onTap: () {
            currentSelection = ride;
          },
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return LoadingWidget(
        controller: controller,
        label: Text(loadingLabel),
      );
    }

    return Stack(
      children: [
        GoogleMapWidget(
          markers: _markers,
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: SizedBox(
            width: 120,
            child: NavigationButton(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return FindRidePage4(
                        model: currentSelection,
                      );
                    },
                  ));
                },
                content: const Row(
                  children: [Text('Proximo'), Icon(Icons.arrow_forward)],
                )),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 30,
          child: SizedBox(
            width: 120,
            child: NavigationButton(
                onTap: () {
                  DefaultTabController.of(context).animateTo(1);
                },
                content: const Row(
                  children: [Icon(Icons.arrow_back), Text('Voltar')],
                )),
          ),
        )
      ],
    );
  }
}
