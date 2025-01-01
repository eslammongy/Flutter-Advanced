import 'package:flutter_advanced/features/graph_metrics/data/repositories/order_repository_impl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_advanced/features/graph_metrics/data/datasource/order_data_source.dart';
import 'package:flutter_advanced/features/graph_metrics/domain/repositories/order_repository.dart';
import 'package:flutter_advanced/features/graph_metrics/domain/usecases/fetch_orders_use_case.dart';
import 'package:flutter_advanced/features/graph_metrics/presentation/cubit/orders_cubit.dart';

final getIt = GetIt.instance;

Future<void> initAppDependencies() async {
  await dotenv.load(fileName: ".env");
  final publishableKey = dotenv.get('STRIPE_PUBLISHABLE_KEY');
  Stripe.publishableKey = publishableKey;
  getIt.registerLazySingleton<OrderDataSource>(
    () => OrderDataSource(),
  );
  getIt.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(orderDataSource: getIt<OrderDataSource>()),
  );
  getIt.registerLazySingleton<FetchOrdersUseCase>(
    () => FetchOrdersUseCase(ordersRepository: getIt<OrderRepository>()),
  );

  getIt.registerFactory<OrdersCubit>(
    () => OrdersCubit(fetchOrdersUseCase: getIt<FetchOrdersUseCase>()),
  );
}
