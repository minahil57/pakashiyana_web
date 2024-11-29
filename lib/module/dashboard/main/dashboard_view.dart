import 'package:global_expert/core/layout/left_layout.dart';
import 'package:global_expert/export.dart';
import 'package:global_expert/module/dashboard/widget/grid_metrics.dart';
import 'package:global_expert/module/dashboard/widget/header.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyLayout(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Header(),
              GridMetrics(),
            ],
          ),
        ),
      ),
    );
  }
}
