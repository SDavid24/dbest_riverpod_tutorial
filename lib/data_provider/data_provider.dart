import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_dbestech/models/user_models.dart';
import 'package:riverpod_dbestech/services/services.dart';

//wrap the provider into a FutureProvider if it is an asynchronous request. SO you can get access to the state when
//when it is successful, loading or an error occurred
final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});


