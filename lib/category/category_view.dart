import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/category/category_cubit.dart';
import 'package:flutter_demo_app/category/category_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoryView extends StatelessWidget {
  double _height;
  double _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    var root = Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(padding: EdgeInsets.all(10), child: Container(color: Colors.red, child: Text("Data", style: TextStyle(fontSize: 20)))),
              Padding(padding: EdgeInsets.all(10), child: Container(color: Colors.red, child: Text("Data", style: TextStyle(fontSize: 20)))),
              Padding(padding: EdgeInsets.all(10), child: Container(color: Colors.red, child: Text("Data", style: TextStyle(fontSize: 20)))),
              _buildGridView(),
              Padding(padding: EdgeInsets.all(10), child: Container(color: Colors.red, child: Text("Data", style: TextStyle(fontSize: 20)))),
              Padding(padding: EdgeInsets.all(10), child: Container(color: Colors.red, child: Text("Data", style: TextStyle(fontSize: 20)))),
              Padding(padding: EdgeInsets.all(10), child: Container(color: Colors.red, child: Text("Data", style: TextStyle(fontSize: 20)))),
            ],
          ),
        ),
      ),
    );
    return root;
  }

  Widget _buildGridView() {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        Widget view;
        switch (state.runtimeType) {
          case CategoryLoading:
            view = Center(child: Container(height: 40, width: 40, child: CircularProgressIndicator()));
            break;
          case CategoryError:
            view = Padding(padding: EdgeInsets.all(20), child: Text("Error"));
            break;
          case CategoryData:
            view = _gridView(state as CategoryData);
            break;
        }
        return view;
      },
    );
  }

  Widget _gridView(CategoryData state) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      itemCount: state.items.length,
      shrinkWrap: true,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      primary: false,
      itemBuilder: (context, index) => _createItem(state.items[index]),
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
    );
  }

  _createItem(CategoryItem item) => Container(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          splashColor: Colors.grey.withOpacity(0.5),
          highlightColor: Colors.black54,
          child: Container(child: Column(children: [Text(item.title), Image.asset(item.resImage)])),
          onTap: () => debugPrint("You tapped on item $item"),
        ),
      ),
    ),
  );
}
