import 'package:flutter/material.dart';
import 'package:global_expert/core/constants/colors.dart';

import '../core/helpers/export.dart';

class TabSelector extends StatelessWidget {
  final String firstTabText;
  final String secondTabText;
  final String selectedTab;
  final Function(String) onTabSelected;

  const TabSelector({
    super.key,
    required this.firstTabText,
    required this.secondTabText,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.45,
      ),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: kcLightGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onTabSelected(firstTabText),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
              decoration: BoxDecoration(
                color: selectedTab == firstTabText
                    ? kcSecondaryColor
                    : kcWhitecolor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                firstTabText == 'Sell' ? 'Buy' : firstTabText,
                style: TextStyle(
                  color:
                      selectedTab == firstTabText ? kcWhitecolor : kcBlackColor,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        horizontalSpace(5),
        Expanded(
          child: GestureDetector(
            onTap: () => onTabSelected(secondTabText),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
              decoration: BoxDecoration(
                color: selectedTab == secondTabText
                    ? kcSecondaryColor
                    : kcWhitecolor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                secondTabText,
                style: TextStyle(
                  color: selectedTab == secondTabText
                      ? kcWhitecolor
                      : kcBlackColor,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
