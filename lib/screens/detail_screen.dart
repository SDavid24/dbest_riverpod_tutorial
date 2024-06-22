import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_dbestech/models/user_models.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.e}) : super(key: key);

  final UserModel e;
  @override
  Widget build(BuildContext context) {
    print('UserModel: $e');

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(e.avatarLarge),
                ),

              ),
              Text(e.firstname + " " + e.lastname,),
              Text(e.email,),


            ],
          ),
        ),
      ),
    );
  }
}
