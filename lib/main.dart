import 'package:flutter/material.dart';
import 'package:route_task/di.dart';
import 'package:route_task/features/products/presentation/views/product_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInj();
  runApp(const RouteTask());
}

class RouteTask extends StatelessWidget {
  const RouteTask({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Route Task',
      home: ProductView(),
    );
  }
}
