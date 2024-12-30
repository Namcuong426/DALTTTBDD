import 'package:app/route/app_route.dart';
import 'package:app/view/dashboard/dashboard_binding.dart';
import 'package:app/view/dashboard/dashboard_screen.dart';
import 'package:get/get.dart';
import 'package:app/route/app_page.dart';

class AppPage{
  static var List =[
    GetPage(
        name: AppRoute.dashboard,
        page: () => const DashboardScreen(),
        binding: DashboardBinding()
    )
  ];
}