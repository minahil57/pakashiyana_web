import 'package:flutter/material.dart';

class ChartCard extends StatelessWidget {
 final String title;
 final  Widget chart ;
  const ChartCard({super.key, required this.title, required this.chart});

  @override
  Widget build(BuildContext context) {
    return     Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          chart,
        ],
      ),
    );
  }
}