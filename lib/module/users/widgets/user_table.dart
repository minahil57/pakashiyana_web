import 'package:global_expert/export.dart';

class UserTable extends StatelessWidget {
  const UserTable({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        id: 'table',
        builder: (controller) {
          return Container(
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
                data: ThemeData(
                  dividerColor: Colors.grey.withOpacity(0.1),
                ),
                child: DataTable2(
                  columnSpacing: 24,
                  horizontalMargin: 24,
                  headingRowHeight: 60,
                  dataRowHeight: 80,
                  columns: [
                    DataColumn2(
                      label: Text(
                        'User',
                        style: getBoldStyle(
                          fontSize: 16,
                        ),
                      ),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Text(
                        'Contact Info',
                        style: getBoldStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Join Date',
                        style: getBoldStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // DataColumn(
                    //   label: Text(
                    //     'Last Active',
                    //     style: getBoldStyle(
                    //       fontSize: 16,
                    //     ),
                    //   ),
                    // ),
                    DataColumn(
                      label: Text(
                        'Status',
                        style: getBoldStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Actions',
                        style: getBoldStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                  empty: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(64),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.person_off_outlined,
                            size: 48,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No users found',
                            style: getRegularStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  rows: controller.users
                      .map((user) => _buildUserRow(user))
                      .toList(),
                ),
              ),
            ),
          );
        });
  }

  DataRow _buildUserRow(UserData user) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              // _buildProfileImage(user),
              horizontalSpaceTiny,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    user.name,
                    overflow: TextOverflow.ellipsis,
                    style: getMediumStyle(),
                  ),
                  FittedBox(
                    child: Text(
                      user.email,
                      overflow: TextOverflow.ellipsis,
                      style: getRegularStyle(
                        color: kcDarkGreyColor,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        DataCell(
          Text(user.phone),
        ),
        DataCell(
          Text(user.joinDate),
        ),
        // DataCell(
        //   Text(user.lastActive),
        // ),
        DataCell(
          _buildStatusBadge(user.isActive),
        ),
        DataCell(
          Row(
            children: [
              // IconButton(
              //   icon: const Icon(Icons.visibility_outlined),
              //   onPressed: () => _showUserDetails(user),
              //   tooltip: 'View Details',
              //   color: const Color(0xFF1A237E),
              // ),
              IconButton(
                icon: Icon(
                  user.isActive
                      ? Icons.block_outlined
                      : Icons.check_circle_outlined,
                ),
                onPressed: () => _toggleUserStatus(user),
                tooltip: user.isActive ? 'Deactivate' : 'Activate',
                color: user.isActive ? Colors.red : Colors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget _buildProfileImage(UserData user) {
  //   return Container(
  //     width: 40,
  //     height: 40,
  //     decoration: BoxDecoration(
  //       shape: BoxShape.circle,
  //       border: Border.all(
  //         color: const Color(0xFF1A237E).withOpacity(0.1),
  //         width: 2,
  //       ),
  //     ),
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(20),
  //       child: user.profileImage != null
  //           ? Image.network(
  //               user.profileImage!,
  //               fit: BoxFit.cover,
  //               errorBuilder: (context, error, stackTrace) =>
  //                   _buildProfilePlaceholder(user),
  //             )
  //           : _buildProfilePlaceholder(user),
  //     ),
  //   );
  // }

  // Widget _buildProfilePlaceholder(UserData user) {
  //   return Container(
  //     color: kcDarkPrimaryColor.withOpacity(0.1),
  //     child: Center(
  //       child: Text(
  //         user.name.substring(0, 1).toUpperCase(),
  //         style: getRegularStyle(
  //           color: kcDarkPrimaryColor,
  //           fontSize: 16,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildStatusBadge(bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive
            ? Colors.green.withOpacity(0.1)
            : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isActive ? 'Active' : 'Inactive',
        style: getBoldStyle(
          color: isActive ? Colors.green : Colors.red,
          fontSize: 12,
        ),
      ),
    );
  }

  // void _showUserDetails(UserData user) {
  //   // Implement user details modal/dialog
  // }

  void _toggleUserStatus(UserData user) {
    final controller = Get.put(UserController());
    controller.onActiveToggle(user);
  }
}
