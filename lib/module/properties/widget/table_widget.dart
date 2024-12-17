import 'package:global_expert/core/config/supabase.dart';
import 'package:global_expert/export.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PropertiesController());
    return GetBuilder<PropertiesController>(
      builder: (controller) => Container(
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Theme(
            data: ThemeData(dividerColor: Colors.grey.withOpacity(0.1)),
            child: DataTable2(
              columnSpacing: 24,
              horizontalMargin: 24,
              headingRowHeight: 60,
              dataRowHeight: 120,
              columns: const [
                DataColumn2(
                  label: Text('Property',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('Details',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                DataColumn(
                  label: Text('Status',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                DataColumn(
                  label: Text('Price',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                DataColumn(
                  label: Text('Actions',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
              rows: properties
                  .map((property) => _buildPropertyRow(property))
                  .toList(),
              empty: const BuildEmptyProperty(),
            ),
          ),
        ),
      ),
    );
  }

  DataRow _buildPropertyRow(PropertyModel property) {
    final formatter = NumberFormat('#,###');
    Get.put(PropertiesController());
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  property.titleImage,
                  width: 100,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 100,
                    height: 80,
                    color: Colors.grey[200],
                    child: const Icon(Icons.broken_image_outlined),
                  ),
                ),
              ),
              horizontalSpaceTiny,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      property.propertyTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      property.location,
                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ID: ${property.propertyId}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        DataCell(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPropertySpec(
                  Icons.hotel_outlined, '${property.bedrooms} Beds'),
              
              _buildPropertySpec(Icons.square_foot_outlined,
                  '${property.areaSize} ${property.areaUnit}'),
            ],
          ),
        ),
        DataCell(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatusBadge('Approval', property.isApproved),
              const SizedBox(height: 4),
              _buildStatusBadge('Promoted', property.isPromoted),
              const SizedBox(height: 4),
              _buildStatusBadge(
                'Blacklist',
                property.isBlacklisted,
              ),
            ],
          ),
        ),
        DataCell(
          Text(
            'Rs-${formatter.format(property.price)}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        DataCell(
          GetBuilder<PropertiesController>(
              id: 'actions',
              builder: (controller) {
                return FittedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          property.isApproved
                              ? Icons.unpublished_outlined
                              : Icons.check_circle_outlined,
                        ),
                        onPressed: () {
                          controller.makePropertyACtive(
                              property.propertyId, property.isApproved);
                        },
                        tooltip:
                            property.isApproved ? 'Deactivate' : 'Activate',
                        color: property.isApproved ? Colors.red : Colors.green,
                      ),
                      IconButton(
                        icon: Icon(
                          property.isPromoted ? Icons.star : Icons.star_border,
                        ),
                        onPressed: () {
                          controller.makePropertyPromoted(
                              property.propertyId, property.isPromoted);
                        },
                        tooltip: property.isPromoted
                            ? 'Remove Promotion'
                            : 'Promote',
                        color: const Color(0xFFFFD700),
                      ),
                      IconButton(
                        icon: Icon(
                          property.isBlacklisted
                              ? Icons.remove_circle_outline
                              : Icons.block,
                        ),
                        onPressed: () async {
                          controller.makePropertyBlackListed(
                              property.propertyId, property.isBlacklisted);
                        },
                        tooltip: property.isBlacklisted
                            ? 'Remove from Blacklist'
                            : 'Blacklist',
                        color: Colors.red,
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget _buildPropertySpec(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String label, bool status, {bool inverse = false}) {
    final bool displayStatus = inverse ? !status : status;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: displayStatus
            ? Colors.green.withOpacity(0.1)
            : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '$label: ${displayStatus ? 'Yes' : 'No'}',
        style: TextStyle(
          color: displayStatus ? Colors.green : Colors.red,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String _getAreaUnit(int unit) {
    switch (unit) {
      case 0:
        return 'sq ft';
      case 1:
        return 'sq m';
      default:
        return 'sq ft';
    }
  }

  //void showPropertyDetails(PropertyModel property) {}

  // void _togglePropertyStatus(PropertyModel property) {
  //   // Implement status toggle
  // }fy7y4

  // void _togglePromoted(PropertyModel property) {
  //   // Implement promotion toggle
  // }

  // void _toggleBlacklist(PropertyModel property) {
  //   // Implement blacklist toggle
  // }
}
