import 'package:buscar/features/account/configuration/model/config_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({super.key});

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  bool theme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Mudar Tema', style: TextStyle(fontSize: 22)),
              Consumer<ConfigurationModel>(
                builder: (BuildContext context, ConfigurationModel model,
                    Widget? child) {
                  theme = model.getThemeMode;
                  return Switch(
                    value: theme,
                    activeColor: Colors.blue,
                    onChanged: (bool value) {
                      setState(() {
                        model.setThemeMode = value;
                        theme = value;
                      });
                    },
                  );
                },
              ),
            ],
          )
        ]),
      ),
    );
  }
}
