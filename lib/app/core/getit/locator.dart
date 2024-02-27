import 'package:andac_case/app/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:andac_case/app/features/home/viewmodel/home_viewmodel.dart';
import 'package:andac_case/app/features/mainview/viewmodel/main_viewmodel.dart';
import 'package:andac_case/app/features/posts/viewmodel/add_post_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => AuthViewModel());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => AddPostsViewModel());
  locator.registerLazySingleton(() => MainViewModel());
}
