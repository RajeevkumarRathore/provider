import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeAndFutureProvider extends StatelessWidget {
  const ChangeAndFutureProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FutureProvider Demo')),
      body: Center(
        child: FutureProvider<String>(
          // Here, we provide the future
          create: (_) => fetchData(),
          initialData: 'Loading...', // Initial data to display while waiting
          child: Consumer<String>(
            builder: (context, data, child) {
              // Handle different states of the FutureProvider
              if (data == 'Loading...') {
                return const CircularProgressIndicator(); // Show a loading spinner
              } else {
                return Text(data, style: const TextStyle(fontSize: 24)); // Show fetched data
              }
            },
          ),
        ),
      ),
    );
  }
}

Future<String> fetchData() async {
  await Future.delayed(const Duration(seconds: 5)); //delay
  return 'Hello from the future!';
}