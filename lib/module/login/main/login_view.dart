import 'package:global_expert/export.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth > 600;
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  maxWidth: 600, // Limit maximum width for larger screens
                ),
                child: IntrinsicHeight(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isDesktop ? 32 : 16,
                        vertical: 32,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(isDesktop ? 40 : 24),
                        child: GetBuilder<LoginController>(
                          id: 'login',
                          builder: (controller) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Logo with Animation
                                Center(
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              kcPrimaryColor.withOpacity(0.2),
                                          blurRadius: 15,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      AssetPath.logo,
                                      height: isDesktop ? 100 : 70,
                                    ),
                                  ),
                                ),
                                verticalSpaceLarge,
                                // Welcome Text
                                Text(
                                  controller.showOTPSide
                                      ? 'Enter OTP Sent To Email'
                                      : 'Welcome to Pakashiyana',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: isDesktop ? 28 : 24,
                                    fontWeight: FontWeight.bold,
                                    color: kcPrimaryColor,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  controller.showOTPSide
                                      ? 'Please check your email for the OTP code'
                                      : 'Sign in to continue to your account',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                    height: 1.5,
                                  ),
                                ),
                                verticalSpaceLarge,
                                // Login/OTP Form
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: controller.showOTPSide
                                      ? const OtpBody()
                                      : const LoginBody(),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
