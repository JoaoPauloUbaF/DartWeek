import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const RoundedButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 3,
        shadowColor: Colors.grey.withOpacity(0.2),
        shape: const CircleBorder(),
        child: DecoratedBox(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  icon,
                  color: context.colors.greyDart,
                ))));
  }
}
