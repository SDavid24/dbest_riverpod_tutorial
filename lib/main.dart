import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_dbestech/string_generator.dart';



void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> randomStrList = ref.watch(strGeneratorProvider);
    final random = Random();
    
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Dynamic Widget | Riverpod")),
          backgroundColor: Colors.blue,
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  ...randomStrList.map((e) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(bottom: 10, top: 5),
                        height: 30,
                        width: 280,
                        color: Colors.blue,
                        child:  Text(
                          e.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        child: const Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                        onTap: (){
                          int index = randomStrList.indexOf(e);
                          ref.read(strGeneratorProvider.notifier).removeAnItem(index);
                        },

                      ),
                    ],
                  )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'create',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: (){
                      //add list to list function
                      ref.read(strGeneratorProvider.notifier).addString(
                          "random String ${5 + random.nextInt(1000 + 1 - 5)}");
                    },

                  ),

                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'clear',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    onPressed: (){
                      //clear list function
                      ref.read(strGeneratorProvider.notifier).clearEntireList();
                    },
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
