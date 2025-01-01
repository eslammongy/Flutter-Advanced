import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theme/app_theme.dart';
import 'package:flutter_advanced/core/theme/text_style.dart';
import 'package:flutter_advanced/features/graph_metrics/presentation/cubit/orders_cubit.dart';

enum GraphFilter { hours, days }

class GraphFilterComponent extends StatefulWidget {
  const GraphFilterComponent({super.key});

  @override
  State<GraphFilterComponent> createState() => _GraphFilterComponentState();
}

class _GraphFilterComponentState extends State<GraphFilterComponent> {
  @override
  Widget build(BuildContext context) {
    final currentFilter = OrdersCubit.get(context).graphFilter;
    final List<bool> isSelected = [
      currentFilter == GraphFilter.hours,
      currentFilter == GraphFilter.days,
    ];
    final theme = context.theme;
    return ToggleButtons(
      direction: Axis.horizontal, // Set vertical orientation
      isSelected: isSelected,
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = i == index;
          }
        });
        OrdersCubit.get(context).graphFilter = GraphFilter.values[index];
        OrdersCubit.get(context).aggregateOrdersByMonth();
      },
      borderColor: theme.colorScheme.primary.withOpacity(0.6),
      selectedBorderColor: theme.colorScheme.primary.withOpacity(0.6),
      selectedColor: Colors.white,
      fillColor: theme.colorScheme.primary,
      borderRadius: BorderRadius.circular(12),
      borderWidth: 2,
      constraints: const BoxConstraints(
        minWidth: 55,
        minHeight: 35,
      ),
      children: [
        Text(
          GraphFilter.hours.name,
          style: AppTextStyles.regular14(context),
        ),
        Text(
          GraphFilter.days.name,
          style: AppTextStyles.regular14(context),
        ),
      ],
    );
  }
}
