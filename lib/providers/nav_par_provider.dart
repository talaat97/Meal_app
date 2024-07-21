import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarNotifer extends StateNotifier<int> {
  NavBarNotifer() : super(0);

  void selectPage(int index) {
    state = index;
  }
}

final navBarProvider =
    StateNotifierProvider<NavBarNotifer, int>((_) => NavBarNotifer());
