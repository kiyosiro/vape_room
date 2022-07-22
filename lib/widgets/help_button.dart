import 'package:flutter/material.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.help),
      iconSize: 20,
      padding: const EdgeInsets.all(0),
      alignment: Alignment.center,
      constraints: const BoxConstraints(minHeight: 12, minWidth: 12),
    );
  }
}
