import 'package:ecommerce/screens/selector/consumer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConsumerScreen extends StatefulWidget {
  const ConsumerScreen({super.key});

  @override
  State<ConsumerScreen> createState() => _ConsumerScreenState();
}

class _ConsumerScreenState extends State<ConsumerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'all',
            onPressed: () {
              context.read<NumberProvider>().add();
            },
            child: const Text("All"),
          ),
          FloatingActionButton(
            heroTag: 'one',
            onPressed: () {
              context.read<NumberProvider>().addtoone();
            },
            child: const Text("one"),
          ),
          FloatingActionButton(
            heroTag: 'two',
            onPressed: () {
              context.read<NumberProvider>().addtotwo();
            },
            child: const Text("two"),
          )
        ],
      ),
      body: SafeArea(child: Center(
        child: Consumer<NumberProvider>(
          builder: (context, provider, child) {
            debugPrint('rebuild screee');
            return Column(
              children: [
                Container(
                  color: Colors.red,
                  padding: const EdgeInsets.all(10),
                  child: Text('${provider.number1}'),
                ),
                Container(
                  color: Colors.green,
                  padding: const EdgeInsets.all(10),
                  child: Text('${provider.number2}'),
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}
