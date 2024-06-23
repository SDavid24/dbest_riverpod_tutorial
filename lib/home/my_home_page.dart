import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numbersProvider =
StateNotifierProvider<NumberNotifier, List<String>>((ref){
  return NumberNotifier();
});


class NumberNotifier extends StateNotifier<List<String>> {
  NumberNotifier() : super(['number 12', 'number 38']);

  void add(String number){
    state = [...state, number];
  }
  
  void remove(String number){
    state = [...state.where((element) => element != number)];
  }

  void update(String number, String updatedNumber){
    final updatedList = <String>[];
    for (var i = 0; i < state.length; i++){
      if(state[i] == number){
        updatedList.add(updatedNumber);
      }else{
        updatedList.add(state[i]);
      }
    }
    state = updatedList;
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final numbers = ref.watch(numbersProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('StateNotifier & StateNotifierProvider'),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: (){
              ref
                  .read(numbersProvider.notifier)
                  .add('number ${Random().nextInt(100)}');
            },
            child: const Icon((Icons.add)),
          ),
        ),
        body: Center(
          child: Column(
            children: numbers.map((e) => GestureDetector(
              onLongPress: (){
                ref.read(numbersProvider.notifier).update(e, '${e } ${Random().nextInt(100)}');
              },
              onTap: (){
                ref.read(numbersProvider.notifier).remove(e);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(e),
              ),
            )).toList(),
          ),
        ),
      ),
    );
  }
}
