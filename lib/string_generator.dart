import 'package:flutter_riverpod/flutter_riverpod.dart';

class StringGenerator extends Notifier<List<String>>{
  @override
  List<String> build() {
    return [];
  }

  void addString(String randomStr){
    state = [...state, randomStr];
  }

  void removeAnItem(int index){
    state.removeAt(index);
    state = [...state];

  }

  void clearEntireList(){
    state = [];
  }

}

final strGeneratorProvider =
NotifierProvider<StringGenerator, List<String>>(StringGenerator.new);