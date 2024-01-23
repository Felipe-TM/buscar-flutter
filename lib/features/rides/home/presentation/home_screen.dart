import 'package:buscar/features/account/account_details/presentation/account_screen.dart';
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
          Container(
            color: Colors.grey,
          ),
          Positioned(
            left: 20,
            bottom: 30,
            child: ActionIconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 30,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ActionIconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  ),
                ),
                ActionIconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ],
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
