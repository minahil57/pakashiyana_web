import 'package:global_expert/export.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kcWhitecolor, // Deep blue
                  kcPrimaryColor, // Lighter blue
                ],
              ),
            ),
          ),
          // Decorative circles
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            left: -150,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          // Main Content
          Center(
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.75,
              width: MediaQuery.sizeOf(context).width * 0.7,
              margin: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Left side - Welcome Image
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F6FA),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          bottomLeft: Radius.circular(32),
                        ),
                        image: DecorationImage(
                          image: AssetImage(AssetPath.logingif),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.05),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Right side - Login Form
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: GetBuilder<LoginController>(
                          id: 'login',
                          builder: (controller) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Logo
                                Center(
                                  child: Image.asset(
                                    AssetPath.logo,
                                    height: 120,
                                  ),
                                ),

                                Text(
                                  controller.showOTPSide
                                      ? 'Enter OTP Sended To Email'
                                      : 'Welcome to Pakashiyana',
                                  style: getBoldStyle(
                                    color: kcPrimaryColor,
                                  ),
                                ),
                                verticalSpaceMedium,

                                // Login Form
                                controller.showOTPSide
                                    ? const OtpBody()
                                    : const LoginBody(),
                              ],
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}