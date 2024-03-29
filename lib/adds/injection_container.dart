// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:vendors/core/api/dio_consumer.dart';
// import 'package:vendors/features/profile/presentation/controllers/phone_countries_cubit/phone_countries_cubit.dart';
// import 'package:vendors/features/settings/presentation/controllers/areas_cubit/areas_cubit.dart';
// import 'package:vendors/features/settings/presentation/controllers/cities_cubit/cities_cubit.dart';
// import 'package:vendors/features/settings/presentation/controllers/countries_cubit/countries_cubit.dart';
// import 'package:vendors/features/settings/presentation/controllers/currencies_cubit/currencies_cubit.dart';
// import 'package:vendors/features/settings/presentation/controllers/languages_cubit/languages_cubit.dart';

// import '../core/api/api_consumer.dart';
// import '../core/api/app_interceptors.dart';
// import '../core/network/network_info.dart';
// import '../features/auth/data/data_sources/auth_remote_datasources.dart';
// import '../features/auth/data/repositories/auth_repository_impl.dart';
// import '../features/auth/domain/repositories/auth_repository.dart';
// import '../features/auth/presentation/controller/cubit/auth_cubit.dart';
// import '../features/profile/data/data_sources/countries_remote_datasources.dart';
// import '../features/profile/data/repositories/countries_repository_impl.dart';
// import '../features/profile/domain/repositories/country_repository.dart';
// import '../features/profile/domain/use_cases/countries_usecase.dart';
// import '../features/settings/data/data_sources/settings_remote_datasources.dart';
// import '../features/settings/data/repositories/settings_repository_impl.dart';
// import '../features/settings/domain/repositories/settings_repository.dart';
// import '../features/settings/domain/use_cases/settings_usecase.dart';

// final sl = GetIt.instance;

// Future<void> init() async {
//   //! Features
//   // sl.registerLazySingleton<CurrenciesCubit>(
//   //     () => CurrenciesCubit(currenciesUsecase: sl()));

//   //********************************************// Blocs \\*************************************\\
//   sl.registerLazySingleton<AuthCubit>(() => AuthCubit(loginUsecase: sl()));
//   // sl.registerLazySingleton<CollectionProductsBlocBloc>(
//   //     () => CollectionProductsBlocBloc(searchProductsUsecase: sl()));

//   // sl.registerLazySingleton<ProductsForYouBloc>(
//   //     () => ProductsForYouBloc(productsForYouUsecase: sl()));
//   //---------------------------------------// Settings Cubits \\------------------------------\\
//   sl.registerLazySingleton<CountriesCubit>(
//       () => CountriesCubit(countriesUsecase: sl()));
//   sl.registerLazySingleton<CitiesCubit>(() => CitiesCubit(citiesUsecase: sl()));
//   sl.registerLazySingleton<AreasCubit>(() => AreasCubit(areasUsecase: sl()));
//   sl.registerLazySingleton<CurrenciesCubit>(
//       () => CurrenciesCubit(currenciesUsecase: sl()));
//   sl.registerLazySingleton<LanguagesCubit>(
//       () => LanguagesCubit(languagesUsecase: sl()));

//   //---------------------------------------// Collections Cubits \\------------------------------\\
//   // sl.registerLazySingleton<HomeBannerCubit>(
//   //     () => HomeBannerCubit(bannersUsecase: sl()));
//   // sl.registerLazySingleton<CollectionsCubit>(
//   //     () => CollectionsCubit(collectionsUsecase: sl()));

//   // sl.registerLazySingleton<CollectionCategoriesCubit>(
//   //     () => CollectionCategoriesCubit(collectionCategoriesUsecase: sl()));

//   // sl.registerLazySingleton<SubCategoriesCubit>(
//   //     () => SubCategoriesCubit(subCategoriesUsecase: sl()));

//   // sl.registerLazySingleton<CategoriesCubit>(
//   //     () => CategoriesCubit(categoriesUsecase: sl()));
//   //---------------------------------------// Filters Cubits \\------------------------------\\

//   // sl.registerLazySingleton<FiltersCubit>(() => FiltersCubit(
//   //       // collarUsecase: sl(),
//   //       // colorUsecase: sl(),
//   //       // fitUsecase: sl(),
//   //       // lengthUsecase: sl(),
//   //       // materialUsecase: sl(),
//   //       // sleeveUsecase: sl(),
//   //       // sizeUsecase: sl(),
//   //       filtersUsecase: sl(),
//   //     ));

//   //---------------------------------------// Collection Products Cubits \\------------------------------\\
//   // sl.registerLazySingleton<CollectionProductsCubit>(
//   //     () => CollectionProductsCubit(
//   //           filtersCountUsecase: sl(),
//   //           trendingItemsUsecase: sl(),
//   //           searchItemsUsecase: sl(),
//   //           searchProductsUsecase: sl(),
//   //         ));

//   // sl.registerLazySingleton<FlashSaleCubit>(
//   //     () => FlashSaleCubit(flashSaleItemsUsecase: sl()));
//   // sl.registerLazySingleton<ProductCubit>(() => ProductCubit(
//   //       productUsecase: sl(),
//   //     ));
//   //---------------------------------------// Cart Cubits \\------------------------------\\
//   // sl.registerLazySingleton<GetCartCubit>(() => GetCartCubit(
//   //       cartUsecase: sl(),
//   //     ));
//   // sl.registerLazySingleton<AddRemoveCartCubit>(() => AddRemoveCartCubit(
//   //       // removeFromCartUsecase: sl(),
//   //       removeCartLineUsecase: sl(),
//   //       addToCartUsecase: sl(),
//   //     ));
//   // sl.registerLazySingleton<UpdateCartCubit>(() => UpdateCartCubit(
//   //       // removeFromCartUsecase: sl(),
//   //       updateCartUsecase: sl(),
//   //     ));
//   //---------------------------------------// Profile Cubits \\------------------------------\\
//   sl.registerLazySingleton<PhoneCountriesCubit>(() => PhoneCountriesCubit(
//         countriesUsecase: sl(),
//       ));

//   //*******************************************// Usecases \\****************************************\\
//   // sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(sl()));
//   // sl.registerLazySingleton<ProductsForYouUsecase>(
//   //     () => ProductsForYouUsecase(sl()));

//   //-------------------------------------// Settings Usecases \\------------------------------\\
//   sl.registerLazySingleton<CountriesUsecase>(() => CountriesUsecase(sl()));
//   sl.registerLazySingleton<CitiesUsecase>(() => CitiesUsecase(sl()));
//   sl.registerLazySingleton<AreasUsecase>(() => AreasUsecase(sl()));
//   sl.registerLazySingleton<CurrenciesUsecase>(() => CurrenciesUsecase(sl()));
//   sl.registerLazySingleton<LanguagesUsecase>(() => LanguagesUsecase(sl()));

//   //-------------------------------------// Collections Usecases \\------------------------------\\

//   // sl.registerLazySingleton<BannersUsecase>(() => BannersUsecase(sl()));
//   // sl.registerLazySingleton<CollectionsUsecase>(() => CollectionsUsecase(sl()));
//   // sl.registerLazySingleton<CollectionCategoriesUsecase>(
//   //     () => CollectionCategoriesUsecase(sl()));
//   // sl.registerLazySingleton<SubCategoriesUsecase>(
//   //     () => SubCategoriesUsecase(sl()));
//   // sl.registerLazySingleton<CategoriesUsecase>(() => CategoriesUsecase(sl()));
//   //-------------------------------------// Cart Usecases \\------------------------------\\
//   // sl.registerLazySingleton<CartUsecase>(() => CartUsecase(sl()));
//   // sl.registerLazySingleton<AddToCartUsecase>(() => AddToCartUsecase(sl()));
//   // sl.registerLazySingleton<RemoveFromCartUsecase>(
//   //     () => RemoveFromCartUsecase(sl()));
//   // sl.registerLazySingleton<RemoveCartLineUsecase>(
//   //     () => RemoveCartLineUsecase(sl()));
//   // sl.registerLazySingleton<EmptyCartUsecase>(() => EmptyCartUsecase(sl()));
//   // sl.registerLazySingleton<UpdateCartUsecase>(() => UpdateCartUsecase(sl()));
//   //-------------------------------------// Filters Usecases \\------------------------------\\

//   // sl.registerLazySingleton<FiltersUsecase>(() => FiltersUsecase(sl()));
//   // sl.registerLazySingleton<CollarUsecase>(() => CollarUsecase(sl()));
//   // sl.registerLazySingleton<ColorUsecase>(() => ColorUsecase(sl()));
//   // sl.registerLazySingleton<FitUsecase>(() => FitUsecase(sl()));
//   // sl.registerLazySingleton<MaterialUsecase>(() => MaterialUsecase(sl()));
//   // sl.registerLazySingleton<LengthUsecase>(() => LengthUsecase(sl()));
//   // sl.registerLazySingleton<SizeUsecase>(() => SizeUsecase(sl()));
//   // sl.registerLazySingleton<SleeveUsecase>(() => SleeveUsecase(sl()));
//   //-------------------------------------// Collection Products Usecases \\------------------------------\\

//   // sl.registerLazySingleton<FiltersCountUsecase>(
//   //     () => FiltersCountUsecase(sl()));
//   // sl.registerLazySingleton<SearchProductsUsecase>(
//   //     () => SearchProductsUsecase(sl()));
//   // sl.registerLazySingleton<SearchItemsUsecase>(() => SearchItemsUsecase(sl()));
//   // sl.registerLazySingleton<TrendingItemsUsecase>(
//   //     () => TrendingItemsUsecase(sl()));
//   // sl.registerLazySingleton<FlashSaleItemsUsecase>(
//   //     () => FlashSaleItemsUsecase(sl()));
//   // sl.registerLazySingleton<ProductUsecase>(() => ProductUsecase(sl()));

//   //-------------------------------------// Collection Products Usecases \\------------------------------\\

//   sl.registerLazySingleton<PhoneCountriesUsecase>(
//       () => PhoneCountriesUsecase(sl()));

//   //*******************************************// Repository \\****************************************\\
//   sl.registerLazySingleton<AuthRepository>(
//       () => AuthRepositoryImpl(loginRemoteDataSource: sl(), networkInfo: sl()));

//   // sl.registerLazySingleton<ProductsForYouRepository>(() =>
//   //     ProductsForYouRepositoryImpl(
//   //         productsForYouRemoteDataSource: sl(), networkInfo: sl()));

//   sl.registerLazySingleton<SettingsRepository>(() => SettingsRepositoryImpl(
//       settingsRemoteDataSource: sl(), networkInfo: sl()));

//   // sl.registerLazySingleton<BannersRepository>(() =>
//   //     BannersRepositoryImpl(bannersRemoteDataSource: sl(), networkInfo: sl()));

//   // sl.registerLazySingleton<CollectionsRepository>(() =>
//   //     CollectionsRepositoryImpl(
//   //         collectionsRemoteDataSource: sl(), networkInfo: sl()));

//   // sl.registerLazySingleton<FiltersRepository>(() =>
//   //     FiltersRepositoryImpl(filtersRemoteDataSource: sl(), networkInfo: sl()));

//   // sl.registerLazySingleton<CollectionProductsRepository>(() =>
//   //     CollectionProductsRepositoryImpl(
//   //         collectionProductsRemoteDataSource: sl(), networkInfo: sl()));

//   // sl.registerLazySingleton<ProductRepository>(() =>
//   //     ProductRepositoryImpl(productRemoteDataSource: sl(), networkInfo: sl()));

//   sl.registerLazySingleton<CountriesRepository>(() => CountriesRepositoryImpl(
//       countriesRemoteDataSource: sl(), networkInfo: sl()));

//   // sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(
//   //     cartRemoteDataSource: sl(),
//   //     networkInfo: sl(),
//   //     cartLocaleDataSource: sl()));

//   //*************************************************// Data Sources \\***********************************\\
//   sl.registerLazySingleton<AuthRemoteDataSource>(
//       () => AuthRemoteDataSourceImpl(apiConsumer: sl()));

//   // sl.registerLazySingleton<ProductsForYouRemoteDataSource>(
//   //     () => ProductsForYouRemoteDataSourceImpl(apiConsumer: sl()));

//   sl.registerLazySingleton<SettingsRemoteDataSource>(
//       () => SettingsRemoteDataSourceImpl(apiConsumer: sl()));

//   // sl.registerLazySingleton<CollectionsRemoteDataSource>(
//   //     () => CollectionsRemoteDataSourceImpl(apiConsumer: sl()));

//   // sl.registerLazySingleton<BannersRemoteDataSource>(
//   //     () => BannersRemoteDataSourceImpl(apiConsumer: sl()));

//   // sl.registerLazySingleton<FiltersRemoteDataSource>(
//   //     () => FiltersRemoteDataSourceImpl(apiConsumer: sl()));

//   // sl.registerLazySingleton<CollectionProductsRemoteDataSource>(
//   //     () => CollectionProductsRemoteDataSourceImpl(apiConsumer: sl()));

//   // sl.registerLazySingleton<ProductRemoteDataSource>(
//   //     () => ProductRemoteDataSourceImpl(apiConsumer: sl()));

//   sl.registerLazySingleton<CountriesRemoteDataSource>(
//       () => CountriesRemoteDataSourceImpl(apiConsumer: sl()));

//   // sl.registerLazySingleton<CartRemoteDataSource>(
//   //     () => CartRemoteDataSourceImpl(apiConsumer: sl()));

//   // sl.registerLazySingleton<CartLocaleDataSource>(
//   //     () => CartLocaleDataSourceImpl(apiConsumer: sl()));
//   //!*************************************************// Recent Orders  \\********************************************\\

//   // sl.registerLazySingleton<RecentOrdersCubitUsecase>(
//   //     () => RecentOrdersCubitUsecase(sl()));
//   //!*************************************************// Core \\********************************************\\
//   sl.registerLazySingleton<NetworkInfo>(
//       () => NetworkInfoImpl(connectionChecker: sl()));
//   sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

//   //! External
//   final sharedPreferences = await SharedPreferences.getInstance();
//   sl.registerLazySingleton(() => sharedPreferences);
//   sl.registerLazySingleton(() => AppInterceptors());
//   sl.registerLazySingleton(() => LogInterceptor(
//       request: true,
//       requestBody: true,
//       requestHeader: true,
//       responseBody: true,
//       responseHeader: true,
//       error: true));
//   sl.registerLazySingleton(() => InternetConnectionChecker());
//   sl.registerLazySingleton(() => Dio());
// }
