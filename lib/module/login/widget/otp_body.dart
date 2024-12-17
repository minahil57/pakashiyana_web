// import 'package:global_expert/export.dart';

// class OtpBody extends StatelessWidget {
//   const OtpBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(LoginController());
//     return Column(
//       children: [
//         Pinput(
//           defaultPinTheme: controller.defaultPinTheme,
//           validator: (s) {
//             return s == '2222' ? null : 'Pin is incorrect';
//           },
//           pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//           showCursor: true,
//           onCompleted: (pin) => print(pin),
//         ),
//         verticalSpaceMedium,
//         PrimaryButton(
//           text: 'Login',
//           onPressed: controller.login,
//           color: kcDarkPrimaryColor,
//           buttonWidth: MediaQuery.sizeOf(context).width * 0.3,
//         ),
//       ],
//     );
//   }
// }
import 'package:global_expert/export.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Column(
      children: [
        Pinput(
          defaultPinTheme: controller.defaultPinTheme,
          validator: (s) {
            return s == '2222' ? null : 'Pin is incorrect';
          },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          onCompleted: (pin) => print(pin),
        ),
        verticalSpaceMedium,
        Center(
          child: PrimaryButton(
            text: 'Login',
            onPressed: controller.login,
            color: kcDarkPrimaryColor,
            buttonWidth: MediaQuery.of(context).size.width *
                (MediaQuery.of(context).size.width > 600 ? 0.3 : 0.8),
          ),
        ),
      ],
    );
  }
}