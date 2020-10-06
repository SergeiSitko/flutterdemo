import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/bloc/ProductBloc.dart';
import 'package:provider/provider.dart';

class ProductView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductState();
}

class ProductState extends State<ProductView> {
  final stream = ProductBloc();
  final viewState = ProductViewState();

  @override
  Widget build(BuildContext context) {
    // stream.allProducts.listen((event) {});

    var changeNotifierProvider = ChangeNotifierProvider<ProductViewState>(
      create: (context) => viewState,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product Bar"),
          backgroundColor: Colors.deepOrange,
        ),
        resizeToAvoidBottomInset: false,
        body: Consumer<ProductViewState>(
          builder: (context, model, child) => Stack(
            children: [
              Visibility(
                visible: model.showData,
                child: Column(
                  children: [
                    RaisedButton(
                      onPressed: () => _loadNewData(model),
                      child: Text("Load new data"),
                    ),
                    Flexible(child: _buildProducts()),
                  ],
                ),
              ),
              Center(
                child: Visibility(
                  child: CircularProgressIndicator(),
                  visible: model.showProgress,
                ),
              )
            ],
          ),
        ),
      ),
    );
    return changeNotifierProvider;
  }

  ListView _buildProducts() => ListView.builder(
        itemCount: viewState.data.list.length,
        itemBuilder: (context, index) => _createItem(index),
      );

  Widget _createItem(int index) => Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(child: Image.asset("assets/cross.webp")),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Flutter is a mobile App SDK by Google which helps in creating modern mobile apps for iOS and Android using a single(almost) code base. It’s a new entrant in the cross platform mobile application development and unlike other frameworks like React Native, it doesn’t use JavaScript but DART as a Programming Language.",
                        style: TextStyle(fontSize: 18, color: Colors.red, decoration: TextDecoration.underline)),
                    Consumer<ProductViewState>(
                        builder: (context, value, child) =>
                            Text("item ${value.data.list.get(index).name}", style: TextStyle(color: Colors.black))),
                    Consumer<ProductViewState>(
                      builder: (context, value, child) => RaisedButton(
                        child: Text('Change name'),
                        onPressed: () {
                          value.data.changeName("Aleksander", value.data.list.get(index));
                          value.notifyListeners();
                          debugPrint("value hash is ${value.hashCode}");
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Future<void> _loadNewData(ProductViewState model) {
    model.showProgress = true;
    model.showData = false;
    model.notifyListeners();

    return Future.delayed(
        Duration(seconds: 3), () => {model.showProgress = false, model.showData = true, model.notifyListeners()});
  }
}

class ProductViewState extends ChangeNotifier {
  bool showProgress = false;
  bool showData = true;

  ProductViewModel data = ProductViewModel();
}

class ProductViewModel extends ChangeNotifier {
  final list = <ProductItem>[
    ProductItem("Sergei", Random().nextInt(80)),
    ProductItem("Alex", Random().nextInt(80)),
    ProductItem("Nick", Random().nextInt(80)),
    ProductItem("Slava", Random().nextInt(80)),
    ProductItem("Peter", Random().nextInt(80)),
    ProductItem("Vova", Random().nextInt(80)),
    ProductItem("Arkadiy", Random().nextInt(80))
  ];

  void addItem(ProductItem item) {
    list.add(item);
  }

  void deleteItem(ProductItem item) {
    list.remove(item);
  }

  void clear() {
    list.clear();
  }

  void changeName(String newName, ProductItem item) {
    item.name = newName;
  }
}

class ProductItem {
  String name = "Sergey";
  int price = 10;

  ProductItem(this.name, this.price);
}

extension ListExtension<T> on List<T> {
  T get(int index) => firstWhere((element) => this.indexOf(element) == index);
}
