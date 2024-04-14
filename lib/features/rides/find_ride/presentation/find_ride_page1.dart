import 'package:buscar/common_widgets/google_map_widget.dart';
import 'package:buscar/common_widgets/location_input_box.dart';
import 'package:flutter/material.dart';

class FindRidePage1 extends StatelessWidget {
  const FindRidePage1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMapWidget(),
        LocationInputBox(),
      ],
    );
  }
}
