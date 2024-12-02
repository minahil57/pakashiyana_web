import 'package:global_expert/export.dart';

class UserData {
  final String uuid;
  final String name;
  final String email;
  final String phone;
   bool isActive;
  final String joinDate;
  final String? lastActive;
  final String? profileImage;

  UserData({
    required this.uuid,
    required this.name,
    required this.email,
    required this.phone,
    required this.isActive,
    required this.joinDate,
    required this.lastActive,
    this.profileImage,
  });
  factory UserData.fromMap(Map<String, dynamic> map) {
    final dateTime = DateTime.parse(map['created_at']);
    final formattedDate = DateFormat('dd-MM-yyyy HH:mm').format(dateTime);
    return UserData(
      uuid: map['id'] ?? '',
      name: map['user_name'] ?? '',
      email: map['user_email'] ?? '',
      phone: map['user_mobile'] ?? '',
      joinDate: formattedDate,
      isActive: map['is_active'],
      lastActive: '',
    );
  }
}
