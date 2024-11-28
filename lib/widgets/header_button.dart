import 'package:flutter/material.dart';

class BuildHeaderButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final bool hasNotification;
  const BuildHeaderButton({super.key, required this.icon, required this.tooltip, this.hasNotification = false});

  @override
  Widget build(BuildContext context) {
    return   Tooltip(
      message: tooltip,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 10,
            ),
          ],
        ),
        child: Stack(
          children: [
            Icon(icon, color: Colors.grey[800]),
            if (hasNotification)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}