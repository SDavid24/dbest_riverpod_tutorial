import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'main.g.dart';


@riverpod
String StringLabel(StringLabelRef ref) => 'Hello world of Riverpod and Bloc';

class NewStringLabel extends Notifier<String>{
  @override
  String build() {
    return "newagedavid";
  }

  void toCamelCase(){
    state = '${state[0].toUpperCase()}${state.substring(1).toLowerCase()}';
    print(state);
  }
}

final newStringLabel = NotifierProvider<NewStringLabel, String>(NewStringLabel.new);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: Scaffold(
        body: Center(
          child: Consumer(
            builder: (context, ref, child) {
              final String val = ref.watch(newStringLabel);
              return ElevatedButton(onPressed: (){
                ref.watch(newStringLabel.notifier.select((value) => value)).toCamelCase();
              }, child: Text(val));
            },
          ),
        ),
      ),
    );
  }
}
