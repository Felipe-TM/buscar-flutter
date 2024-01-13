import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conta'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AccountHero(
            userRating: "4,8",
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Felipe Torres Maciel',
                  style: TextStyle(fontSize: 16),
                ),
                Text('felipemaciel@exemplo.com',
                    style: TextStyle(fontSize: 16)),
                Text('+55 43 912345678', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                  label: const Text('Editar')),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Informações do Veiculo',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Fiat', style: TextStyle(fontSize: 16)),
                          Text('Palio', style: TextStyle(fontSize: 16)),
                          Text('DIA8265', style: TextStyle(fontSize: 16)),
                          Text('Cinza', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(
                        height: 110,
                        width: 110,
                        child: ColoredBox(color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                  label: const Text('Editar')),
            ),
          ),
        ],
      ),
    );
  }
}

class AccountHero extends StatelessWidget {
  final String userRating;

  const AccountHero({
    super.key,
    required this.userRating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
              width: 180,
              height: 180,
              decoration: const ShapeDecoration(
                color: Color(0xFFD9D9D9),
                shape: OvalBorder(),
              )),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Text(
          'Felipe Torres',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.star), Text('4,8')],
      )
    ]);
  }
}
