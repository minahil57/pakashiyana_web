import 'package:global_expert/module/properties/widget/category_selector.dart';
import 'package:global_expert/module/properties/widget/selector_tabs.dart';

import '../../../export.dart';

class AddProperty extends StatelessWidget {
  const AddProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: const Column(
        children: [
          CategorySelector(),
          verticalSpaceMedium,
          //const SelectorTabs(),
        ],
      ),
    ));
  }
}
