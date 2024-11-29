import 'package:global_expert/export.dart';

class AstericText extends StatelessWidget {
  final String? label;
  const AstericText({super.key, this.label});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: label,
              style: getRegularStyle(color: kcBlackColor, fontSize: 12)),
          TextSpan(
              text: '*',
              style: getRegularStyle(color: kcRedColor, fontSize: 12)),
        ],
      ),
    );
  }
}
