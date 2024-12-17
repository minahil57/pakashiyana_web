import 'package:global_expert/export.dart';

class HeaderUserView extends StatelessWidget {
  const HeaderUserView({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'User Management',
          style: getBoldStyle(
            fontSize: isSmallScreen ? 24 : 32,
            fontWeight: FontWeight.bold,
            color: kcSecondaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Manage and monitor user accounts',
          style: getRegularStyle(
            color: kcTextGrey,
            fontSize: isSmallScreen ? 14 : 16,
          ),
        ),
      ],
    );
  }
}