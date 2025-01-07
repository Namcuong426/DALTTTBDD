import 'package:app/route/app_route.dart';
import 'package:get/get.dart';
import 'package:app/controller/dashboard_controller.dart';

class DashboardBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(DashboardController());
  }

}