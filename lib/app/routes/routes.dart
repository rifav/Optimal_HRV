import 'package:flutter/widgets.dart';
import 'package:optimal_hrv_bloc/app/app.dart';
import 'package:optimal_hrv_bloc/home/home.dart';
import 'package:optimal_hrv_bloc/login/login.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}
