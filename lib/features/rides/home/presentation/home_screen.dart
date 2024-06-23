import 'package:buscar/common_widgets/count_display_widget.dart';
import 'package:buscar/common_widgets/custom_card.dart';
import 'package:buscar/features/account/account_details/presentation/account_screen.dart';
import 'package:buscar/features/rides/add_ride/presentation/add_ride_screen.dart';
import 'package:buscar/features/rides/find_ride/presentation/find_ride_screen.dart';
import 'package:buscar/features/rides/home/presentation/chat_screen.dart';
import 'package:buscar/features/rides/home/presentation/chat_title.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/action_icon_button.dart';
import 'home_bottom_bar.dart';
import 'home_side_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        leadingWidth: 70,
        leading: const LeadingIcon(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountScreen(),
                ),
              );
            },
            icon: const Icon(Icons.account_circle),
            iconSize: 52,
          )
        ],
      ),
      drawer: const Drawer(
        child: HomeSideBar(),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  CustomCard(
                    color: Colors.blue.shade300,
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FindRideScreen(),
                        ),
                      ),
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Procurar Carona',
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.search_rounded,
                              size: 42,
                            ),
                            Icon(
                              Icons.arrow_right_alt_rounded,
                              size: 42,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomCard(
                    color: Colors.blue,
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddRideScreen(),
                        ),
                      ),
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Oferecer Carona',
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.local_taxi_outlined,
                              size: 42,
                            ),
                            Icon(
                              Icons.arrow_right_alt_rounded,
                              size: 42,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]
                    .map((widget) => Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: widget,
                        ))
                    .toList(),
              ),
            ),
          ),
          Positioned(
            left: 25,
            bottom: 30,
            child: CountDisplayWidget(
              child: ActionIconButton(
                size: 48,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ChatScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.chat),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const HomeBottomBar(),
    );
  }
}

class LeadingIcon extends StatelessWidget {
  const LeadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 52,
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: const Icon(Icons.menu_rounded),
    );
  }
}
