//*---base_product---//

import 'package:ecommerce_smart/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
