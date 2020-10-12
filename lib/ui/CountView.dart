import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/bloc/CountBloc.dart';
import 'package:flutter_demo_app/bloc/color_background_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CountsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countBloc = BlocProvider.of<CounterBloc>(context);
    final colorBloc = BlocProvider.of<ColorBackgroundBloc>(context);

    return BlocBuilder<CounterBloc, int>(
      builder: (context, counter) => Scaffold(
        appBar: AppBar(title: Text("data")),
        body: Center(
          child: Column(
            children: [
              Text("Data is $counter"),
              BlocBuilder<ColorBackgroundBloc, Color>(
                  builder: (context, backgroundColor) => Container(
                        color: backgroundColor,
                        width: 100,
                        height: 100,
                      )),
              RaisedButton(
                onPressed: () => colorBloc.getAnotherColor(),
                child: Text("Get color"),
              ),
              BlocListener<CounterBloc, int>(
                listener: (context, count) {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Sending Message $count")));
                  Fluttertoast.showToast(
                      msg: "This is $count",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                child: Container(),
              )
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(onPressed: () => countBloc.add(CountEvent.minus), child: Icon(Icons.minimize)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(onPressed: () => countBloc.add(CountEvent.plus), child: Icon(Icons.add)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
