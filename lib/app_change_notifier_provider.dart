import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppChangeNotifierProvider extends StatelessWidget {
  const AppChangeNotifierProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Consumer<AppProvider>(
                  builder: (context, value, child) => ListView.builder(
                    itemCount: value.list.length,
                    itemBuilder: (context, index) => Consumer<AppProvider>(
                      builder: (context, value, child) => GestureDetector(
                          onTap: () {
                            value.updateListValue(index);
                          },
                          child: Text(value.list[index])),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppProvider with ChangeNotifier {
  List<String> list = ["A", "B", "C", "D"];

  updateListValue(int index) {
    list.removeAt(index);
    notifyListeners();
  }
}