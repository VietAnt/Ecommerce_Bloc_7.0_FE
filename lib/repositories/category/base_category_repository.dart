//*--Category--//
import 'package:ecommerce_smart/models/models.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
