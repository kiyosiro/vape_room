import 'package:flutter/material.dart';
import 'package:vape_room/models/liquid.dart';

class RecipeBookPage extends StatefulWidget {
  const RecipeBookPage({Key? key}) : super(key: key);

  @override
  State<RecipeBookPage> createState() => _RecipeBookPageState();
}

class _RecipeBookPageState extends State<RecipeBookPage> {
  @override
  Widget build(BuildContext context) {
    final List<MixedLiquid> mixedLiquids = [
      MixedLiquid(
        name: 'NicoPeach',
        liqA: Liquid(name: 'peach', nicoRatio: 0),
        liqB: Liquid(name: 'nicoNonFlaver', nicoRatio: 0.1),
        amount: 100,
        nicoRaito: 0.1,
      ),
      MixedLiquid(
        name: 'NicoEnergyDrink',
        liqA: Liquid(name: 'EnergyDrink', nicoRatio: 0),
        liqB: Liquid(name: 'nicoNonFlaver', nicoRatio: 0.1),
        amount: 200,
        nicoRaito: 0.1,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          'My Recipe',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: ListView(
        children: mixedLiquidsToTiles(mixedLiquids),
      ),
    );
  }

  List<Widget> mixedLiquidsToTiles(List<MixedLiquid> mixedLiquids) {
    final List<Widget> tiles = <Widget>[];

    for (MixedLiquid mixedLiquid in mixedLiquids) {
      tiles.add(
        ListTile(
          title: Text(mixedLiquid.name),
          isThreeLine: true,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Amount: ${mixedLiquid.amount}ml'),
              Text('Nico raito: ${mixedLiquid.nicoRaito * 100}%'),
              Text('LiquidA: ${mixedLiquid.liqA.name}'),
              Text('  Amount: ${mixedLiquid.getLiqAAmount()}ml'),
              Text('LiquidB: ${mixedLiquid.liqB.name}'),
              Text(
                  '  Amount: ${mixedLiquid.amount - mixedLiquid.getLiqAAmount()}ml')
            ],
          ),
          onTap: () {},
          leading: const Icon(Icons.local_drink),
        ),
      );
    }
    return tiles;
  }
}
