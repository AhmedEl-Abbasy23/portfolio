import 'package:portfolio/exports.dart';

GetIt sl = GetIt.instance;

setupDI({String? newBaseUrl}) async {
  // -------> Main Settings <-------- \\

  sl.allowReassignment = true;
  sl.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  sl.registerSingleton<CacheHelper>(await CacheHelper.getInstance());
  Constants.lang = StorageHelper.getLanguagePrefs();
  // String currentBaseUrl = await StorageHelper.getClientBaseUrl();

  // --> REPOSITORIES <-- \\
  //* Auth SCREENS REPOS *\\
  // sl.registerLazySingleton<LoginRepo>(() => LoginRepo(sl()));

  // --> CUBITS <-- \\

  //* Auth SCREENS CUBITS *\\

  // sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
}