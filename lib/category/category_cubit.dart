import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/category/category_item.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryLoading()) {
    loadData();
  }

  loadData() async {
    try {
      final items = await _fetchData();
      emit(CategoryData(items));
    } catch (e) {
      emit(CategoryError(Exception("some thing wrong with fetching data")));
    }
  }

  Future<List<CategoryItem>> _fetchData() {
    return Future.delayed(
      Duration(seconds: 2),
      () => [
        CategoryItem("Book", "assets/category_book.png"),
        CategoryItem("Clothe", "assets/category_clothe.png"),
        CategoryItem("Drink", "assets/category_drink.png"),
        CategoryItem("Pizza", "assets/category_pizza.png"),
        CategoryItem("Present", "assets/category_present.png"),
        CategoryItem("Shoes", "assets/category_shoes.png"),
        CategoryItem("Sport", "assets/category_sport.png"),
        CategoryItem("Sushi", "assets/category_sushi.png"),
        CategoryItem("Book", "assets/category_book.png"),
        CategoryItem("Clothe", "assets/category_clothe.png"),
        CategoryItem("Drink", "assets/category_drink.png"),
        CategoryItem("Pizza", "assets/category_pizza.png"),
        CategoryItem("Present", "assets/category_present.png"),
        CategoryItem("Shoes", "assets/category_shoes.png"),
        CategoryItem("Sport", "assets/category_sport.png"),
        CategoryItem("Sushi", "assets/category_sushi.png"),
        CategoryItem("Book", "assets/category_book.png"),
        CategoryItem("Clothe", "assets/category_clothe.png"),
        CategoryItem("Drink", "assets/category_drink.png"),
        CategoryItem("Pizza", "assets/category_pizza.png"),
        CategoryItem("Present", "assets/category_present.png"),
        CategoryItem("Shoes", "assets/category_shoes.png"),
        CategoryItem("Sport", "assets/category_sport.png"),
        CategoryItem("Sushi", "assets/category_sushi.png"),
        CategoryItem("Book", "assets/category_book.png"),
        CategoryItem("Clothe", "assets/category_clothe.png"),
        CategoryItem("Drink", "assets/category_drink.png"),
        CategoryItem("Pizza", "assets/category_pizza.png"),
        CategoryItem("Present", "assets/category_present.png"),
        CategoryItem("Shoes", "assets/category_shoes.png"),
        CategoryItem("Sport", "assets/category_sport.png"),
        CategoryItem("Sushi", "assets/category_sushi.png"),

      ],
    );
  }
}
