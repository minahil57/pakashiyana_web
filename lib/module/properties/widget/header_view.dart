import 'package:global_expert/export.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PropertiesController());
    return GetBuilder<PropertiesController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Property Management',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 600 ? 32 : 24,
                  fontWeight: FontWeight.bold,
                  color: kcSecondaryColor,
                ),
              ),
              verticalSpaceSmall,
              Text(
                'Manage and monitor property listings',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: MediaQuery.of(context).size.width > 600 ? 16 : 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
