import 'package:buscar/common_widgets/google_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../common_widgets/navigation_button.dart';

class FindRidePage3 extends StatefulWidget {
  const FindRidePage3({super.key});

  @override
  State<FindRidePage3> createState() => _FindRidePage3State();
}

class _FindRidePage3State extends State<FindRidePage3> {
  late Set<Marker> _markers;

  @override
  void initState() {
    _markers = <Marker>{};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  DefaultTabController.of(context).animateTo(3);
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
                  children: [Icon(Icons.arrow_back), const Text('Voltar')],
                )),
          ),
        )
      ],
    );
  }
}