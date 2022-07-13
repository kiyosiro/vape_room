import 'package:flutter/material.dart';
import 'package:vape_room/pages/archive_page.dart';
import 'package:vape_room/pages/create_liquid_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.appName}) : super(key: key);
  final String appName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAlreadyMix = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.appName,
              style: Theme.of(context).textTheme.headline3,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateLiquidPage()));
              },
              child: const Text('Mixing'),
            ),
            ElevatedButton(
              onPressed: isAlreadyMix == false
                  ? null
                  : () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ArchivePage()));
                    },
              child: const Text('Recipe Book'),
            ),
            ElevatedButton(
              onPressed: isAlreadyMix == false
                  ? null
                  : () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ArchivePage()));
                    },
              child: const Text('My tools'),
            )
          ],
        ),
      ),
    );
  }
}
