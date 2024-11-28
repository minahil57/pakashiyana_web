import 'package:global_expert/export.dart';
import 'package:global_expert/widgets/header_button.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard Overview',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: kcSecondaryColor,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Welcome back, Admin! Here's what's happening today.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            children: [
              BuildHeaderButton(
                icon: Icons.file_download_outlined,
                tooltip: 'Export Report',
              ),
              SizedBox(width: 16),
              BuildHeaderButton(
                icon: Icons.notifications_outlined,
                tooltip: 'Notifications',
                hasNotification: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
