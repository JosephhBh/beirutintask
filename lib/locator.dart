import 'package:get_it/get_it.dart';
import 'package:tipperapp/core/controller/services/authentication_service/authenticaion_service.dart';
import 'package:tipperapp/core/controller/services/notification_service/notification_service.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthenticaionService());
  locator.registerLazySingleton(() => NotificationService());
}
