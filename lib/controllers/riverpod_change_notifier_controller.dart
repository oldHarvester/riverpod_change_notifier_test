import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_change_test/controllers/change_notifier_controller.dart';

final riverpodChangeNotifierProvider = ChangeNotifierProvider(
  (ref) {
    return RiverpodChangeNotifierController();
  },
);

class RiverpodChangeNotifierController extends ChangeNotifierController {}
