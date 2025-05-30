import 'package:my_test/app/app.locator.dart';
import 'package:my_test/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
mixin NavigationMixin {
  final NavigationService _navigationService = locator<NavigationService>();
  
  void goToDashboard() =>
      _navigationService.navigateTo(Routes.homeView);
  
  
  
  
  
  
  }