import 'package:global_expert/module/properties/widget/category_selector.dart';

import '../../../export.dart';

class AddProperty extends StatelessWidget {
  const AddProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          CategorySelector(),
          verticalSpaceMedium,
        ],
      ),
    ));
  }
}
