import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final Widget value;
  final Color? iconColor;

  const InfoCard({
    Key? key,
    required this.icon,
    required this.value,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: iconColor ?? Colors.green),
        title:  value,
      ),
    );
  }
}
