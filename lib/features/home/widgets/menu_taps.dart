import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/constant/app_strings.dart';

import 'menu_tap_item.dart';

typedef GetCurrentIndex = void Function(int index);

class MenuTaps extends StatefulWidget {
  const MenuTaps({super.key, this.getCurrentIndex});
  final GetCurrentIndex? getCurrentIndex;

  @override
  State<MenuTaps> createState() => _MenuTapsState();
}

class _MenuTapsState extends State<MenuTaps> {
  int selectedTap = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MenuTapItem(
          text: AppStrings.metric,
          isSelected: selectedTap == 0,
          onPressed: () {
            if (widget.getCurrentIndex != null) {
              widget.getCurrentIndex!(0);
            }
            setState(() => selectedTap = 0);
          },
        ),
        MenuTapItem(
          text: AppStrings.graph,
          isSelected: selectedTap == 1,
          onPressed: () {
            if (widget.getCurrentIndex != null) {
              widget.getCurrentIndex!(1);
            }
            setState(() => selectedTap = 1);
          },
        ),
      ],
    );
  }
}
