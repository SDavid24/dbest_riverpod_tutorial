import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Provider vs StateProvider'),
        ),
        body: SelectedButton(),
      ),
    );
  }
}

//You can access other providers insdie it and also makes changes to it but must be done internally not externally
final isRedProvider = Provider<bool>((ref) {
  final color = ref.watch(selectedButtonProvider);
  return color == 'red';
});

List<String> colorPatterns = [];
final colorPatternsProvider = StateProvider<List<String>>((ref) {
  final color = ref.watch(selectedButtonProvider);
  colorPatterns.add(color);
  return colorPatterns;
});

final selectedButtonProvider = StateProvider<String>((ref) => '');

class SelectedButton extends ConsumerWidget{
  const SelectedButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRed = ref.watch(isRedProvider);
    final selectedButton = ref.watch(selectedButtonProvider);
    final colorList = ref.watch(colorPatternsProvider);

    print('colorList is: $colorList');
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(selectedButton),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () => ref.read(selectedButtonProvider.notifier).state = 'red', //We can change the state of StateProvider from the outside
            child: Text('Red'),
           ),

          ElevatedButton(
            onPressed: () => ref.read(selectedButtonProvider.notifier).state = 'blue',
            child: Text('Blue'),
          ),
          SizedBox(height: 10,),
          isRed ? Text('Color is red') : Text('Color is blue'),
          selectedButton == 'red' ? Text('Color is red') : Text('Color is blue'),
        ]
      ),
    );
  }

}
