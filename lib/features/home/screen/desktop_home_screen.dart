import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_advanced/features/home/widgets/main_app_bar.dart';
import 'package:flutter_advanced/features/graph_metrics/presentation/cubit/orders_cubit.dart';

class DesktopHomeScreen extends StatefulWidget {
  const DesktopHomeScreen({super.key});

  @override
  State<DesktopHomeScreen> createState() => _DesktopHomeScreenState();
}

class _DesktopHomeScreenState extends State<DesktopHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        getCurrentIndex: (index) {
         
        },
      ),
      body: BlocListener<OrdersCubit, OrdersStatus>(
        listener: (context, state) {
          if (state is OrdersLoadedState) {
            OrdersCubit.get(context).calculateMetrics(state.orders);
          }
        },
        child:Center(),
      ),
    );
  }
}
