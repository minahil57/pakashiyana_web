import 'package:global_expert/export.dart';

class LocationDropdown extends StatelessWidget {
  const LocationDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PropertiesController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            dropdownColor: kcWhitecolor,
            value: controller.selectedLocation,
            hint: const Text('Filter by Location'),
            isExpanded: true,
            items: [
              const DropdownMenuItem<String>(
                value: null,
                child: Text('All Locations'),
              ),
              ...controller.uniqueLocations.map((location) {
                return DropdownMenuItem<String>(
                  value: location,
                  child: Text(location),
                );
              }),
            ],
            onChanged: controller.setLocation,
          ),
        ),
      ),
    );
  }
}
