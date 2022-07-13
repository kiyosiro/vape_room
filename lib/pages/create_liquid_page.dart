import 'package:flutter/material.dart';

class CreateLiquidPage extends StatefulWidget {
  const CreateLiquidPage({Key? key}) : super(key: key);

  @override
  State<CreateLiquidPage> createState() => _CreateLiquidPageState();
}

class _CreateLiquidPageState extends State<CreateLiquidPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          'Mix',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: ListView(children: const [
        LiquidCard(
          cardTitle: 'First Liquid',
          flavorHint: 'peach',
          nicotineHint: '0',
          pgHint: '70',
          vgHint: '30',
        ),
        LiquidCard(
          cardTitle: 'Second Liquid',
          flavorHint: 'Non flavor nicotin',
          nicotineHint: '10',
          pgHint: '50',
          vgHint: '50',
        ),
      ]),
    );
  }
}

class LiquidCard extends StatelessWidget {
  final String cardTitle;
  final String flavorHint;
  final String nicotineHint;
  final String pgHint;
  final String vgHint;

  const LiquidCard({
    Key? key,
    required this.cardTitle,
    required this.flavorHint,
    required this.nicotineHint,
    required this.pgHint,
    required this.vgHint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        child: ListTile(
          dense: true,
          contentPadding: const EdgeInsets.all(12),
          isThreeLine: true,
          title: Row(
            children: [
              Text(cardTitle),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text('Liquidを保存'),
              ),
            ],
          ),
          subtitle: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Flavor',
                    hintText: flavorHint,
                  ),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Nicotine/%',
                        hintText: nicotineHint,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: TextField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'PG/%',
                          hintText: pgHint,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: TextField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'VG/%',
                          hintText: vgHint,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
