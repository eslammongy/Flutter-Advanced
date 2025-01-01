import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theme/app_theme.dart';
import 'package:flutter_advanced/core/theme/text_style.dart';
import 'package:flutter_advanced/features/graph_metrics/presentation/cubit/orders_cubit.dart';

enum MonthEnum {
  January,
  February,
  March,
  April,
  May,
  June,
  July,
  August,
  September,
  October,
  November,
  December,
}

class MonthsDropdownMenu extends StatefulWidget {
  const MonthsDropdownMenu({super.key});

  @override
  State<MonthsDropdownMenu> createState() => _MonthsDropdownMenuState();
}

class _MonthsDropdownMenuState extends State<MonthsDropdownMenu> {
  String getMonthString(MonthEnum month) {
    return month.name;
  }

  @override
  void initState() {
    super.initState();
    OrdersCubit.get(context).aggregateOrdersByMonth();
  }

  @override
  Widget build(BuildContext context) {
    final ordersCubit = OrdersCubit.get(context);
    return DropdownButtonHideUnderline(
      child: DropdownButton2<MonthEnum>(
        isExpanded: true,
        hint: Text(
          'Select Item',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: MonthEnum.values
            .map((MonthEnum item) => DropdownMenuItem<MonthEnum>(
                  value: item,
                  child: Text(
                    item.name,
                    style: AppTextStyles.bold16(context).copyWith(fontSize: 14),
                  ),
                ))
            .toList(),
        value: ordersCubit.selectedMonth,
        onChanged: (MonthEnum? value) {
          setState(() {
            ordersCubit.selectedMonth = value!;
            OrdersCubit.get(context).aggregateOrdersByMonth();
          });
        },
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          elevation: 0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: context.theme.colorScheme.surface,
            border:
                Border.all(color: context.theme.colorScheme.primary, width: 2),
          ),
          height: 40,
          width: 130,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
