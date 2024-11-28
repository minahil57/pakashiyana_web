import 'package:global_expert/core/layout/left_layout.dart';
import 'package:global_expert/export.dart';
import 'package:global_expert/module/dashboard/widget/charts.dart';
import 'package:global_expert/module/dashboard/widget/grid_metrics.dart';
import 'package:global_expert/module/dashboard/widget/header.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MyLayout(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              const Header(),
              verticalSpaceLarge,
              // Enhanced Metrics Grid
              const GridMetrics(),
              verticalSpaceLarge,
              // Charts Section
              const ChartsSection(),
              verticalSpaceLarge,
              // Recent Activity Section
              _buildRecentActivitySection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentActivitySection() {
    return Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Activity',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View All',
                  style: TextStyle(
                    color: kcPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            children: List.generate(
              5,
              (index) => _buildRecentActivityItem(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivityItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: kcSecondaryColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            'Titles',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
