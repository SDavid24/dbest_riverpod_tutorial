import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final listProvider = StateProvider<List<String>>((_) {
  return List.generate(5, (_) => Faker().person.firstName());
});

final indexProvider = Provider<int>((_) {
  return 0;
});

class WelcomePage extends ConsumerWidget{
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(".....page build....");
    return Scaffold(
      appBar: AppBar(),
      body: _ListView(),
    );
  }

}

class _ListView extends ConsumerWidget{

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: ref.watch(listProvider.select((value) => value.length)), //Only rebuild if all the items change at once
      itemBuilder: (_, index){
        if (kDebugMode) {
          print(".....list view  build....");
        }
        //We want to be able to pass list[index] into the _ElevatedButton below, but to do that,
        //We also need the the widget to be a const so it doesn't rebuilt which means, we can't pass it as an
        //argument. To effectively achieve this, we will be using ProviderScope
        return  ProviderScope(
          overrides: [indexProvider.overrideWith((ref) => index)], //reset the index
          child: const _ListItem(),
        );
      },
    );
  }

}

class _ListItem extends ConsumerWidget {

  const _ListItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.read(indexProvider);
    //final item = ref.watch(listProvider)[index];
    final item = ref.watch(listProvider.select((value) => value[index]));

    return ElevatedButton(
      onPressed: (){
        final list = ref.read(listProvider);

        if (kDebugMode) {
          print(".....list item  build....$item");
          print(".....list index  build....${list[index]}");
        }

        list[index] = Faker().person.firstName(); //replace the clicked button name with a random one

        ref.watch(listProvider.notifier).state = [...list]; //Update the list
      }, child: Text(item),
    );
  }

}