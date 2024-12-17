import 'package:global_expert/export.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      id: 'table',
      builder: (controller) {
        if (controller.users.isEmpty) {
          return const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person_off_outlined,
                  size: 48,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  'No users found',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (context, index) => UserCard(
            user: controller.users[index],
          ),
        );
      },
    );
  }
}

class UserCard extends StatelessWidget {
  final UserData user;

  const UserCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Row
            Row(
              children: [
                _buildProfileImage(user),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name.isNotEmpty ? user.name : 'Unnamed User',
                        style: getMediumStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user.email,
                        style: getRegularStyle(
                          color: kcDarkGreyColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                _buildStatusBadge(user.isActive),
              ],
            ),
            const Divider(height: 24),
            // Contact Info & Join Date
            Row(
              children: [
                Expanded(
                  child: _buildInfoItem(
                    Icons.phone_outlined,
                    'Phone',
                    user.phone.isNotEmpty ? user.phone : 'No phone',
                  ),
                ),
                Expanded(
                  child: _buildInfoItem(
                    Icons.calendar_today_outlined,
                    'Joined',
                    user.joinDate.isNotEmpty ? user.joinDate : 'Unknown',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Action Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () => _toggleUserStatus(user),
                  icon: Icon(
                    user.isActive
                        ? Icons.block_outlined
                        : Icons.check_circle_outlined,
                    color: user.isActive ? Colors.red : Colors.green,
                  ),
                  label: Text(
                    user.isActive ? 'Deactivate' : 'Activate',
                    style: TextStyle(
                      color: user.isActive ? Colors.red : Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(UserData user) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF1A237E).withOpacity(0.1),
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
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
    // Get initials safely from name
    final initials = user.name.isNotEmpty ? user.name[0].toUpperCase() : '?';

    return Container(
      color: kcDarkPrimaryColor.withOpacity(0.1),
      child: Center(
        child: Text(
          initials,
          style: getRegularStyle(
            color: kcDarkPrimaryColor,
            fontSize: 20,
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

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.grey,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: getRegularStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            Text(
              value,
              style: getMediumStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _toggleUserStatus(UserData user) {
    final controller = Get.put(UserController());
    controller.onActiveToggle(user);
  }
}
