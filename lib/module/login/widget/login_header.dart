import 'package:flutter/material.dart';
import 'package:global_expert/core/assets/asset_path.dart';
import 'package:global_expert/core/theme/text_style.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AssetPath.logo,
          width: MediaQuery.sizeOf(context).width * 0.25,
          height: MediaQuery.sizeOf(context).height * 0.25,
        ),
        Text(
          'Welcome To Pakashiyana',
          style: getBoldStyle(fontSize: 20),
        ),
        Text(
          'Enter your credentials to continue',
          style: getMediumStyle(fontSize: 20),
        ),
      ],
    );
  }
}
