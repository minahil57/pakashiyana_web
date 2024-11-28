import 'package:global_expert/export.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Property Management',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: kcSecondaryColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Manage and monitor property listings',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
        PrimaryButton(
          buttonWidth: 160,
          text: 'Add Property',
          onPressed: () {},
        ),
      ],
    );
  }
}
