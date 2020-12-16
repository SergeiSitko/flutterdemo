part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryError extends CategoryState {
  Exception exception;

  CategoryError(this.exception);
}

class CategoryData extends CategoryState {
  List<CategoryItem> items;

  CategoryData(this.items);
}
