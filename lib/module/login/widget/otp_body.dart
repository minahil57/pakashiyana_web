import 'package:global_expert/export.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Column(
      children: [
        Pinput(
          controller: controller.otpController,
          length: 6,
          defaultPinTheme: controller.defaultPinTheme,
          // validator: (s) {
          //   return s == '2222' ? null : 'Pin is incorrect';
          // },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          onCompleted: (pin) => controller.otpController.text = pin,
        ),
        verticalSpaceMedium,
        PrimaryButton(
          text: 'Login',
          onPressed: () {
            controller.verifyOTP(controller.otpController.text);
          },
          color: kcDarkPrimaryColor,
          buttonWidth: MediaQuery.sizeOf(context).width * 0.3,
        ),
      ],
    );
  }
}
