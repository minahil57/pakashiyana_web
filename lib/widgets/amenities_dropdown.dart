import 'package:flutter_remix/flutter_remix.dart';
import 'package:global_expert/export.dart';

class AmenityDropdownButton extends StatefulWidget {
  final List<String> items;
  final Function(List<String>) onSelectionChanged;
  final List<String> selectedItems;

  const AmenityDropdownButton({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onSelectionChanged,
  });

  @override
  State<AmenityDropdownButton> createState() => _AmenityDropdownButtonState();
}

class _AmenityDropdownButtonState extends State<AmenityDropdownButton> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.06,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: kcLightGrey,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kcBorderColor),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.selectedItems.isEmpty
                        ? [
                            Text(
                              'Select Amenities',
                              style: getRegularStyle(
                                color: kcTextGrey,
                                fontSize: 12,
                              ),
                            ),
                          ]
                        : widget.selectedItems
                            .map((item) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: kcPrimaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    item,
                                    style: getRegularStyle(
                                      color: kcPrimaryColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ))
                            .toList(),
                  ),
                ),
                Icon(
                  _isExpanded
                      ? FlutterRemix.arrow_up_s_line
                      : FlutterRemix.arrow_down_s_line,
                  color: kcPrimaryColor,
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded)
          Container(
            margin: const EdgeInsets.only(top: 4),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.3,
            ),
            decoration: BoxDecoration(
              color: kcWhitecolor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kcBorderColor),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final isSelected = widget.selectedItems.contains(item);
                return ListTile(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        widget.selectedItems.remove(item);
                      } else {
                        widget.selectedItems.add(item);
                      }
                      widget.onSelectionChanged(widget.selectedItems);
                    });
                  },
                  title: Text(
                    item,
                    style: getRegularStyle(fontSize: 12),
                  ),
                  leading: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? kcSecondaryColor : kcBorderColor,
                        width: 1,
                      ),
                      color: isSelected ? kcSecondaryColor : Colors.transparent,
                    ),
                    child: isSelected
                        ? const Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          )
                        : null,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
