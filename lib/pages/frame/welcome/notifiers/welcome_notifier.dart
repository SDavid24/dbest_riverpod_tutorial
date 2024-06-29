import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'welcome_state.dart';

//It notifies the UI that the shared data has changed
class WelcomeNotifier extends StateNotifier<WelcomeState> {
  WelcomeNotifier() : super(const WelcomeState());

  void pageChanged(int page) {
    state = state.copyWith(page: page);
  }
}

//This is globally available to the UI, so we can use it access the methods inside WelcomeNotifier()
final welcomeProvider = StateNotifierProvider<WelcomeNotifier, WelcomeState>((ref){
  return WelcomeNotifier();
});