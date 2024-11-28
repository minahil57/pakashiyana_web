
import 'package:global_expert/core/layout/left_layout.dart';
import 'package:global_expert/export.dart';

class UserData {
  final String name;
  final String email;
  final String phone;
  final bool isActive;
  final String joinDate;
  final String lastActive;
  final String? profileImage;

  UserData({
    required this.name,
    required this.email,
    required this.phone,
    required this.isActive,
    required this.joinDate,
    required this.lastActive,
    this.profileImage,
  });
}

class UserManagementScreen extends StatelessWidget {
  UserManagementScreen({super.key});

  // Added more sample data to ensure proper rendering
  final List<UserData> users = [
    UserData(
      name: "John Doe",
      email: "john.doe@example.com",
      phone: "+1 234 567 8900",
      isActive: true,
      joinDate: "Nov 20, 2024",
      lastActive: "2 hours ago",
      profileImage: null,
    ),
    UserData(
      name: "Jane Smith",
      email: "jane.smith@example.com",
      phone: "+1 234 567 8901",
      isActive: true,
      joinDate: "Nov 19, 2024",
      lastActive: "1 day ago",
      profileImage: null,
    ),
    UserData(
      name: "Robert Johnson",
      email: "robert.j@example.com",
      phone: "+1 234 567 8902",
      isActive: false,
      joinDate: "Nov 18, 2024",
      lastActive: "3 days ago",
      profileImage: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MyLayout(
      child: Material(
        color: const Color(0xFFF8F9FD),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),
              _buildSearchAndFilter(),
              const SizedBox(height: 24),
              Expanded(
                child: _buildUsersTable(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
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
                color: Colors.grey,
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

  Widget _buildSearchAndFilter() {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
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
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search users...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF5F6FA),
                ),
              ),
            ),
            const SizedBox(width: 16),
            _buildFilterChip('Status', Icons.filter_list),
            const SizedBox(width: 8),
            _buildFilterChip('Date', Icons.calendar_today),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, IconData icon) {
    return Material(
      color: Colors.transparent,
      child: FilterChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16),
            const SizedBox(width: 8),
            Text(label),
          ],
        ),
        onSelected: (bool selected) {},
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.grey.withOpacity(0.2)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildUsersTable() {
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
              DataColumn(
                label: Text(
                  'Last Active',
                  style: getBoldStyle(
                    fontSize: 16,
                  ),
                ),
              ),
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
            rows: users.map((user) => _buildUserRow(user)).toList(),
          ),
        ),
      ),
    );
  }

  DataRow _buildUserRow(UserData user) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              _buildProfileImage(user),
              horizontalSpaceTiny,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    user.name,
                    overflow: TextOverflow.ellipsis,
                    style: getRegularStyle(),
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
        DataCell(
          Text(user.lastActive),
        ),
        DataCell(
          _buildStatusBadge(user.isActive),
        ),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.visibility_outlined),
                onPressed: () => _showUserDetails(user),
                tooltip: 'View Details',
                color: const Color(0xFF1A237E),
              ),
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

  Widget _buildProfileImage(UserData user) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF1A237E).withOpacity(0.1),
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: user.profileImage != null
            ? Image.network(
                user.profileImage!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildProfilePlaceholder(user),
              )
            : _buildProfilePlaceholder(user),
      ),
    );
  }

  Widget _buildProfilePlaceholder(UserData user) {
    return Container(
      color: const Color(0xFF1A237E).withOpacity(0.1),
      child: Center(
        child: Text(
          user.name.substring(0, 1).toUpperCase(),
          style: getRegularStyle(
            color: const Color(0xFF1A237E),
            fontSize: 16,
          ),
        ),
      ),
    );
  }

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

  Widget _buildActionButton(String label, IconData icon,
      {bool isPrimary = false, required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? const Color(0xFF1A237E) : Colors.white,
        foregroundColor: isPrimary ? Colors.white : const Color(0xFF1A237E),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isPrimary
              ? BorderSide.none
              : const BorderSide(color: Color(0xFF1A237E)),
        ),
      ),
      icon: Icon(icon),
      label: Text(label),
    );
  }

  void _showUserDetails(UserData user) {
    // Implement user details modal/dialog
  }

  void _toggleUserStatus(UserData user) {
    // Implement status toggle functionality
  }
}
