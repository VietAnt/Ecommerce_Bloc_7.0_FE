import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_smart/models/category_model.dart';
import 'package:ecommerce_smart/repositories/category/category_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  //*--Bien--//
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubcription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading());

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is LoadCategories) {
      yield* _mapLoadCategoriesToState();
    }
    if (event is UpdateCategories) {
      yield* _mapUpdateCategoriesToState(event);
    }
  }

  //*----//
  Stream<CategoryState> _mapLoadCategoriesToState() async* {
    _categorySubcription?.cancel();
    _categorySubcription = _categoryRepository.getAllCategories().listen(
          (categories) => add(
            UpdateCategories(categories),
          ),
        );
  }

  //*--//
  Stream<CategoryState> _mapUpdateCategoriesToState(
      UpdateCategories event) async* {
    yield CategoryLoaded(categories: event.categories);
  }
}
