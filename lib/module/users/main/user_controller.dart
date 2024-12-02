import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:global_expert/export.dart';
import 'package:global_expert/services/get_users.dart';

class UserController extends GetxController {
  GetUsers getUsers = GetUsers();
  List<UserData> users = [];
  @override
  Future<void> onInit() async {
    users = await getUsers.fetchUsers();

    update(['table']);
    super.onInit();
  }

  Future<void> onActiveToggle(UserData user) async {
    log(user.uuid);
    user.isActive = !user.isActive;
    final response = await getUsers.activeUser(user.uuid, user.isActive);
    log(response.toString());
    if (response == true) {
      EasyLoading.showToast(
          user.isActive == true
              ? 'User Activated Succesfully'
              : 'User Deactivated Successfully',
          toastPosition: EasyLoadingToastPosition.top);
    } else {
      EasyLoading.showToast('Something went wrong',
          toastPosition: EasyLoadingToastPosition.top);
      user.isActive = !user.isActive;
    }
    update(['table']);
  }
}
