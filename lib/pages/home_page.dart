import 'package:flutter/material.dart';

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
              onPressed: () {},
              child: const Text('new'),
            ),
            ElevatedButton(
              onPressed: isAlreadyMix == false ? null : () {},
              child: const Text('archieve'),
            )
          ],
        ),
      ),
    );
  }
}
