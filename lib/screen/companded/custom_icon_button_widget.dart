import 'package:flutter/material.dart';

class CustomIconButtonWidget extends StatelessWidget {
  const CustomIconButtonWidget({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        child: IconButton(
          style: const ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          padding: const EdgeInsets.all(4),
          constraints: const BoxConstraints(),
          onPressed: onPressed,
          icon: Icon(
            icon,
          ),
        ),
      ),
    );
  }
}
