import 'package:dartz/dartz.dart';
import 'package:route_task/core/errors/failuer.dart';
import 'package:route_task/features/products/data/models/product_model.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductModel>>> getProducts();
}
