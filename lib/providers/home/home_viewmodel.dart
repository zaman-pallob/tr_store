import 'package:tr_store/providers/home/home_interface.dart';

class HomeViewModel {
  late HomeInterface interface;
  void setHomeViewModel(HomeInterface interface) {
    this.interface = interface;
  }
}
