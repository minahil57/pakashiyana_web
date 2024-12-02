
import 'package:global_expert/export.dart';

class HeaderUserView extends StatelessWidget {
  const HeaderUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Management',
              style: getBoldStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: kcSecondaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Manage and monitor user accounts',
              style: getRegularStyle(
                color: kcTextGrey,
                fontSize: 16,
              ),
            ),
          ],
        ),
        // Row(
        //   children: [
        //     _buildActionButton(
        //       'Export Users',
        //       Icons.file_download_outlined,
        //       onPressed: () {},
        //     ),
        //     const SizedBox(width: 16),
        //     _buildActionButton(
        //       'Add User',
        //       Icons.person_add_outlined,
        //       isPrimary: true,
        //       onPressed: () {},
        //     ),
        //   ],
        // ),
      ],
    );
  }
}