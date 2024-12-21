
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:global_expert/export.dart';


class CustomDropdown extends StatelessWidget {
  final String? labelText;
  final String? preText;
  final Color? fillColor;
  final Color? textColor;
  final double? borderRadius;
  final List<String> items;
  final String? selectedItem;
  final Function(String?)? onChanged;

  const CustomDropdown({
    super.key,
    this.labelText,
    this.preText,
    this.fillColor,
    this.textColor,
    this.borderRadius,
    required this.items,
    this.selectedItem,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: selectedItem,
      dropdownStyleData: DropdownStyleData(
         
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 5.0),
            color: kcWhitecolor,
          )),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        hintText: labelText,
        filled: true,
        prefixText: preText,
        fillColor: kcLightGrey, // kcLightGrey
        hintStyle: getRegularStyle(
          fontSize: 12,
          color: kcTextGrey, // kcTextGrey
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5.0),
          borderSide:
              const BorderSide(color: kcBorderColor, width: 1), // kcBorderColor
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5.0),
          borderSide:
              const BorderSide(color: kcBorderColor, width: 1), // kcBorderColor
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5.0),
          borderSide:
              const BorderSide(color: kcBorderColor, width: 1), // kcBorderColor
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5.0),
          borderSide:
              const BorderSide(color: kcBorderColor, width: 1), // kcBorderColor
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5.0),
          borderSide:
              const BorderSide(color: kcBorderColor, width: 1), // kcBorderColor
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 13,
        ),
      ),
      isExpanded: true,
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }
}
