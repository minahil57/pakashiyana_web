import 'package:global_expert/export.dart';

import 'package:global_expert/core/layout/left_layout.dart';

class PropertyManagementScreen extends StatelessWidget {
  const PropertyManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyLayout(
      child: Material(
        color: Color(0xFFF8F9FD),
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderView(),
              verticalSpaceLarge,
              Expanded(
                child: TableWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
