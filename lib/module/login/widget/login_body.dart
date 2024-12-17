// import 'package:global_expert/export.dart';

// class LoginBody extends StatelessWidget {
//   const LoginBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(LoginController());
//     return Form(
//       key: controller.loginFormKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Visibility(
//             visible: controller.showOTPSide,
//             child: IconButton(
//               onPressed: controller.onBackPress,
//               icon: const Icon(
//                 CupertinoIcons.back,
//                 color: kcDarkGreyColor,
//               ),
//             ),
//           ),
//           verticalSpaceMedium,
//           AppTextFieldWithPrefixIcon(
//             prefixIcon: CupertinoIcons.mail_solid,
//             controller: controller.emailController,
//             validator: (p0) => controller.validateEmail(p0!),
//             hintText: 'Email',
//             keyboardType: TextInputType.emailAddress,
//             isPassword: false,
//           ),
//           verticalSpaceMedium,
//           PrimaryButton(
//             text: 'Continue',
//             onPressed: controller.onContinuePressed,
//             color: kcDarkPrimaryColor,
//             buttonWidth: MediaQuery.sizeOf(context).width * 0.3,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:global_expert/export.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: controller.showOTPSide,
            child: IconButton(
              onPressed: controller.onBackPress,
              icon: const Icon(
                CupertinoIcons.back,
                color: kcDarkGreyColor,
              ),
            ),
          ),
          verticalSpaceMedium,
          AppTextFieldWithPrefixIcon(
            prefixIcon: CupertinoIcons.mail_solid,
            controller: controller.emailController,
            validator: (p0) => controller.validateEmail(p0!),
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            isPassword: false,
          ),
          verticalSpaceMedium,
          Center(
            child: PrimaryButton(
              text: 'Continue',
              onPressed: controller.doLogin,
              color: kcDarkPrimaryColor,
              buttonWidth: MediaQuery.of(context).size.width *
                  (MediaQuery.of(context).size.width > 600 ? 0.3 : 0.8),
            ),
          ),
        ],
      ),
    );
  }
}
