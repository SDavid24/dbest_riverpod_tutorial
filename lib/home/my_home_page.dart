import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_dbestech/data_provider/data_provider.dart';
import 'package:riverpod_dbestech/models/user_models.dart';
import 'package:riverpod_dbestech/screens/detail_screen.dart';

import '../services/services.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod'),
      ),
      body: _data.when(
        data: (_data) {
          List<UserModel> userList = _data.map((e) => e).toList();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(child: ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (_, index){
                    return InkWell(
                      onTap: () => Navigator.of(context).push( //Pass the data of the clicked row into the next page
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            e: userList[index],
                          ),
                        )
                      ) ,
                      child: Card(
                        color: Colors.blue,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(userList[index].firstname, style: const TextStyle(
                            color: Colors.white,
                          ),),
                          subtitle: Text(userList[index].lastname, style: const TextStyle(
                            color: Colors.white
                          ),),
                          trailing: CircleAvatar(
                            backgroundImage: NetworkImage(userList[index].avatar),
                          ),
                        ),
                      ),
                    );
                  },
                ))
              ],
            ),
          );
        },
        error: (error, e) => Text(error.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
