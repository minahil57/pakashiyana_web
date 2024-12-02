import 'package:global_expert/core/layout/left_layout.dart';
import 'package:global_expert/export.dart';
import 'package:global_expert/module/users/widgets/export.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return const MyLayout(
      child: Material(
        color: kcWhitecolor,
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderUserView(),
              SizedBox(height: 32),
              Expanded(
                child: UserTable(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
