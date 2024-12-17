import 'package:global_expert/core/config/supabase.dart';
import 'package:global_expert/export.dart';

class PropertyListView extends StatelessWidget {
  const PropertyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PropertiesController>(
      builder: (controller) => properties.isEmpty
          ? const BuildEmptyProperty()
          : ListView.builder(
              itemCount: properties.length,
              itemBuilder: (context, index) => PropertyCard(
                property: properties[index],
              ),
            ),
    );
  }
}

// property_card.dart
class PropertyCard extends StatelessWidget {
  final PropertyModel property;

  const PropertyCard({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###');
    final controller = Get.put(PropertiesController());
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                Image.network(
                  property.titleImage,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey[200],
                    child: const Icon(Icons.broken_image_outlined, size: 50),
                  ),
                ),
                // Status Badges
                Positioned(
                  top: 12,
                  right: 12,
                  child: GetBuilder<PropertiesController>(builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (property.isPromoted)
                          const StatusChip(
                            label: 'Promoted',
                            color: Color(0xFFFFD700),
                            icon: Icons.star,
                          ),
                        if (property.isBlacklisted)
                          const StatusChip(
                            label: 'Blacklisted',
                            color: Colors.red,
                            icon: Icons.block,
                          ),
                        if (!property.isApproved)
                          const StatusChip(
                            label: 'Pending',
                            color: Colors.orange,
                            icon: Icons.pending,
                          ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
          // Property Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        property.propertyTitle,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Rs-${formatter.format(property.price)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kcPrimaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  property.location,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                // Property Specifications
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildPropertySpec(
                      Icons.hotel_outlined,
                      '${property.bedrooms} Beds',
                    ),
                    _buildPropertySpec(
                      Icons.square_foot_outlined,
                      '${property.areaSize} ${property.areaUnit}',
                    ),
                  ],
                ),
                const Divider(height: 32),
                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(
                      icon: property.isApproved
                          ? Icons.unpublished_outlined
                          : Icons.check_circle_outlined,
                      label: property.isApproved ? 'Deactivate' : 'Activate',
                      color: property.isApproved ? Colors.red : Colors.green,
                      onTap: () {
                        controller.propertyService.makePropertyACtive(
                          property.propertyId,
                          property.isApproved,
                        );
                        controller.togglePropertyStatus(
                          property.propertyId,
                          property.isApproved,
                        );
                      },
                    ),
                    _buildActionButton(
                      icon:
                          property.isPromoted ? Icons.star : Icons.star_border,
                      label:
                          property.isPromoted ? 'Remove Promotion' : 'Promote',
                      color: const Color(0xFFFFD700),
                      onTap: () {
                        Get.find<PropertiesController>()
                            .propertyService
                            .makePropertyPromoted(
                              property.propertyId,
                              property.isPromoted,
                            );
                        controller.togglePropertyPromotion(
                          property.propertyId,
                          property.isPromoted,
                        );
                      },
                    ),
                    _buildActionButton(
                      icon: property.isBlacklisted
                          ? Icons.remove_circle_outline
                          : Icons.block,
                      label: property.isBlacklisted
                          ? 'Remove Blacklist'
                          : 'Blacklist',
                      color: Colors.red,
                      onTap: () {
                        Get.find<PropertiesController>()
                            .propertyService
                            .makePropertyBlackListed(
                              property.propertyId,
                              property.isBlacklisted,
                            );
                        controller.togglePropertyBlacklisted(
                          property.propertyId,
                          property.isBlacklisted,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertySpec(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // String _getAreaUnit(int unit) {
  //   switch (unit) {
  //     case 0:
  //       return 'sq ft';
  //     case 1:
  //       return 'sq m';
  //     default:
  //       return 'sq ft';
  //   }
  // }
}

// status_chip.dart
class StatusChip extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;

  const StatusChip({
    super.key,
    required this.label,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
