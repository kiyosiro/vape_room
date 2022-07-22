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
    final List<Liquid> mixedLiquids = [
      goastLiqMixed,
      goastLiqOrigin,
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

  List<Widget> mixedLiquidsToTiles(List<Liquid> mixedLiquids) {
    final List<Widget> tiles = <Widget>[];

    for (Liquid mixedLiquid in mixedLiquids) {
      tiles.add(
        ListTile(
          title: Text(mixedLiquid.flavor ?? 'No name flavor'),
          isThreeLine: true,
          onTap: () {},
          leading: const Icon(Icons.local_drink),
        ),
      );
    }
    return tiles;
  }
}
