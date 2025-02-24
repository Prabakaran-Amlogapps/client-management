import 'package:get_it/get_it.dart';
import 'employee_service.dart';
import 'services_employee.dart';

final GetIt locator = GetIt.instance;

void setupServiceLocator() {
  // Register services as singletons
  locator.registerLazySingleton<StorageService>(() => StorageService());
  locator.registerLazySingleton<EmployeeService>(() => EmployeeService());
}
