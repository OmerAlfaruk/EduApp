part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initOnBoarding();
  await _initAuth();
  await _initCourse();
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(
      () => AuthBloc(
        signIn: sl(),
        signUp: sl(),
        forgotPassword: sl(),
        updateUser: sl(),
      ),
    )
    ..registerLazySingleton(() => SignIn(sl()))
    ..registerLazySingleton(() => SignUp(sl()))
    ..registerLazySingleton(() => ForgotPassword(sl()))
    ..registerLazySingleton(() => UpdateUser(sl()))
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()))
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        authClient: sl(),
        cloudStoreClient: sl(),
        dbClient: sl(),
      ),
    )
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseFirestore.instance)
    ..registerLazySingleton(() => FirebaseStorage.instance);
}

Future<void> _initOnBoarding() async {
  final prefs = await SharedPreferences.getInstance();
  // Feature --> OnBoarding
  // Business Logic
  sl
    ..registerFactory(
      () => OnBoardingCubit(
        cacheFirstTimer: sl(),
        checkIfUserIsFirstTimer: sl(),
      ),
    )
    ..registerLazySingleton(() => CacheFirstTimer(sl()))
    ..registerLazySingleton(() => CheckIfUserIsFirstTimer(sl()))
    ..registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl(sl()))
    ..registerLazySingleton<OnBoardingLocalDataSource>(
      () => OnBoardingLocalDataSrcImpl(sl()),
    )
    ..registerLazySingleton(() => prefs);
}

// Feature --> Course
Future<void> _initCourse() async {
  sl
    ..registerFactory(
      () => CourseCubit(
        addCourseUseCase: sl(),
        getCoursesUseCase: sl(),
      ),
    )
    ..registerLazySingleton(() => AddCourseUseCase(sl()))
    ..registerLazySingleton(() => GetCoursesUseCase(sl()))
    ..registerLazySingleton<CourseRepo>(() => CourseRepoImpl(sl()))
    ..registerLazySingleton<CourseRemoteDataSrc>(
      () => CourseRemoteDataSrcImpl(
        fireStore: sl(),
        storage: sl(),
        auth: sl(),
      ),
    );
}