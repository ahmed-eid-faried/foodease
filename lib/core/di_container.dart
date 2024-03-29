import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:foodease/core/data/datasource/remote/dio/dio_client.dart';
import 'package:foodease/core/helper/network_info.dart';
import 'package:foodease/core/utill/app_constants.dart';
import 'package:foodease/features/splash/controllers/splash_controller.dart';
import 'package:foodease/features/splash/domain/services/splash_service.dart';
import 'package:foodease/features/splash/domain/services/splash_service_interface.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //************************************* Core ****************************************//

  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(),
      loggingInterceptor: sl(), sharedPreferences: sl()));
//************************************* Repository ****************************************//

  // sl.registerLazySingleton(() => CategoryRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => FlashDealRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => FeaturedDealRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => BrandRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => ProductRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => BannerRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => OnBoardingRepository(dioClient: sl()));
  // sl.registerLazySingleton(
  //     () => AuthRepository(dioClient: sl(), sharedPreferences: sl()));
  // sl.registerLazySingleton(() => ProductDetailsRepository(dioClient: sl()));
  // sl.registerLazySingleton(
  //     () => SearchProductRepository(dioClient: sl(), sharedPreferences: sl()));
  // sl.registerLazySingleton(() => OrderRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => ShopRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => CouponRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => ChatRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => NotificationRepository(dioClient: sl()));
  // sl.registerLazySingleton(
  //     () => ProfileRepository(dioClient: sl(), sharedPreferences: sl()));
  // sl.registerLazySingleton(() => WishListRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => CartRepository(dioClient: sl()));
  // sl.registerLazySingleton(
  //     () => SplashRepository(sharedPreferences: sl(), dioClient: sl()));
  // sl.registerLazySingleton(() => SupportTicketRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => AddressRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => WalletRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => CompareRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => LoyaltyPointRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => CheckoutRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => LocationRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => ShippingRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => ContactUsRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => SellerProductRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => OrderDetailsRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => RefundRepository(dioClient: sl()));
  // sl.registerLazySingleton(() => ReOrderRepository(dioClient: sl()));
//************************************* Provider ****************************************//

  // Provider
  // sl.registerFactory(() => CategoryController(categoryServiceInterface: sl()));
  // sl.registerFactory(() => ShopController(shopServiceInterface: sl()));
  // sl.registerFactory(
  //     () => FlashDealController(flashDealServiceInterface: sl()));
  // sl.registerFactory(
  //     () => FeaturedDealController(featuredDealServiceInterface: sl()));
  // sl.registerFactory(() => BrandController(brandRepo: sl()));
  // sl.registerFactory(() => ProductController(productServiceInterface: sl()));
  // sl.registerFactory(() => BannerController(bannerServiceInterface: sl()));
  // sl.registerFactory(
  //     () => OnBoardingController(onBoardingServiceInterface: sl()));
  // sl.registerFactory(() => AuthController(authServiceInterface: sl()));
  // sl.registerFactory(
  //     () => ProductDetailsController(productDetailsServiceInterface: sl()));
  // sl.registerFactory(
  //     () => SearchProductController(searchProductServiceInterface: sl()));
  // sl.registerFactory(() => OrderController(orderServiceInterface: sl()));
  // sl.registerFactory(() => CouponController(couponRepo: sl()));
  // sl.registerFactory(() => ChatController(chatServiceInterface: sl()));
  // sl.registerFactory(
  //     () => NotificationController(notificationServiceInterface: sl()));
  // sl.registerFactory(() => ProfileController(profileServiceInterface: sl()));
  // sl.registerFactory(() => WishListController(wishlistServiceInterface: sl()));
  sl.registerFactory(() => SplashController(splashServiceInterface: sl()));
  // sl.registerFactory(() => CartController(cartServiceInterface: sl()));
  // sl.registerFactory(
  //     () => SupportTicketController(supportTicketServiceInterface: sl()));
  // sl.registerFactory(
  //     () => LocalizationController(sharedPreferences: sl(), dioClient: sl()));
  // sl.registerFactory(() => ThemeController(sharedPreferences: sl()));
  // sl.registerFactory(() => GoogleSignInController());
  // sl.registerFactory(() => FacebookLoginController());
  // sl.registerFactory(() => AddressController(addressServiceInterface: sl()));
  // sl.registerFactory(() => WalletController(walletServiceInterface: sl()));
  // sl.registerFactory(() => CompareController(compareServiceInterface: sl()));
  // sl.registerFactory(
  //     () => LoyaltyPointController(loyaltyPointServiceInterface: sl()));
  // sl.registerFactory(() => CheckoutController(checkoutServiceInterface: sl()));
  // sl.registerFactory(() => LocationController(locationServiceInterface: sl()));
  // sl.registerFactory(() => ShippingController(shippingServiceInterface: sl()));
  // sl.registerFactory(
  //     () => ContactUsController(contactUsServiceInterface: sl()));
  // sl.registerFactory(() => ReviewController(reviewServiceInterface: sl()));
  // sl.registerFactory(
  //     () => SellerProductController(sellerProductServiceInterface: sl()));
  // sl.registerFactory(
  //     () => OrderDetailsController(orderDetailsServiceInterface: sl()));
  // sl.registerFactory(() => RefundController(refundServiceInterface: sl()));
  // sl.registerFactory(() => ReOrderController(reOrderServiceInterface: sl()));
//************************************* interface ****************************************//

  //interface
  // AddressRepoInterface addressRepoInterface =
  //     AddressRepository(dioClient: sl());
  // sl.registerLazySingleton(() => addressRepoInterface);
  // AddressServiceInterface addressServiceInterface =
  //     AddressService(addressRepoInterface: sl());
  // sl.registerLazySingleton(() => addressServiceInterface);

  // AuthRepoInterface authRepoInterface =
  //     AuthRepository(dioClient: sl(), sharedPreferences: sl());
  // sl.registerLazySingleton(() => authRepoInterface);
  // AuthServiceInterface authServiceInterface =
  //     AuthService(authRepoInterface: sl());
  // sl.registerLazySingleton(() => authServiceInterface);

  // BannerRepositoryInterface bannerRepositoryInterface =
  //     BannerRepository(dioClient: sl());
  // sl.registerLazySingleton(() => bannerRepositoryInterface);
  // BannerServiceInterface bannerServiceInterface =
  //     BannerService(bannerRepositoryInterface: sl());
  // sl.registerLazySingleton(() => bannerServiceInterface);

  // BrandRepoInterface brandRepoInterface = BrandRepository(dioClient: sl());
  // sl.registerLazySingleton(() => brandRepoInterface);
  // BrandServiceInterface brandServiceInterface =
  //     BrandService(brandRepoInterface: sl());
  // sl.registerLazySingleton(() => brandServiceInterface);

  // CartRepositoryInterface cartRepositoryInterface =
  //     CartRepository(dioClient: sl());
  // sl.registerLazySingleton(() => cartRepositoryInterface);
  // CartServiceInterface cartServiceInterface =
  //     CartService(cartRepositoryInterface: sl());
  // sl.registerLazySingleton(() => cartServiceInterface);

  // CategoryRepoInterface categoryRepoInterface =
  //     CategoryRepository(dioClient: sl());
  // sl.registerLazySingleton(() => categoryRepoInterface);
  // CategoryServiceInterface categoryServiceInterface =
  //     CategoryService(categoryRepoInterface: sl());
  // sl.registerLazySingleton(() => categoryServiceInterface);

  // ChatRepositoryInterface chatRepositoryInterface =
  //     ChatRepository(dioClient: sl());
  // sl.registerLazySingleton(() => chatRepositoryInterface);
  // ChatServiceInterface chatServiceInterface =
  //     ChatService(chatRepositoryInterface: sl());
  // sl.registerLazySingleton(() => chatServiceInterface);

  // ShippingRepositoryInterface shippingRepositoryInterface =
  //     ShippingRepository(dioClient: sl());
  // sl.registerLazySingleton(() => shippingRepositoryInterface);
  // ShippingServiceInterface shippingServiceInterface =
  //     ShippingService(shippingRepositoryInterface: sl());
  // sl.registerLazySingleton(() => shippingServiceInterface);

  // CheckoutRepositoryInterface checkoutRepositoryInterface =
  //     CheckoutRepository(dioClient: sl());
  // sl.registerLazySingleton(() => checkoutRepositoryInterface);
  // CheckoutServiceInterface checkoutServiceInterface =
  //     CheckoutService(checkoutRepositoryInterface: sl());
  // sl.registerLazySingleton(() => checkoutServiceInterface);

  // CompareRepositoryInterface compareRepositoryInterface =
  //     CompareRepository(dioClient: sl());
  // sl.registerLazySingleton(() => compareRepositoryInterface);
  // CompareServiceInterface compareServiceInterface =
  //     CompareService(compareRepositoryInterface: sl());
  // sl.registerLazySingleton(() => compareServiceInterface);

  // ContactUsRepositoryInterface contactUsRepositoryInterface =
  //     ContactUsRepository(dioClient: sl());
  // sl.registerLazySingleton(() => contactUsRepositoryInterface);
  // ContactUsServiceInterface contactUsServiceInterface =
  //     ContactUsService(contactUsRepositoryInterface: sl());
  // sl.registerLazySingleton(() => contactUsServiceInterface);

  // CouponRepositoryInterface couponRepositoryInterface =
  //     CouponRepository(dioClient: sl());
  // sl.registerLazySingleton(() => couponRepositoryInterface);
  // CouponServiceInterface couponServiceInterface =
  //     CouponService(couponRepositoryInterface: sl());
  // sl.registerLazySingleton(() => couponServiceInterface);

  // FlashDealRepositoryInterface flashDealRepositoryInterface =
  //     FlashDealRepository(dioClient: sl());
  // sl.registerLazySingleton(() => flashDealRepositoryInterface);
  // FlashDealServiceInterface flashDealServiceInterface =
  //     FlashDealService(flashDealRepositoryInterface: sl());
  // sl.registerLazySingleton(() => flashDealServiceInterface);

  // FeaturedDealRepositoryInterface featuredDealRepositoryInterface =
  //     FeaturedDealRepository(dioClient: sl());
  // sl.registerLazySingleton(() => featuredDealRepositoryInterface);
  // FeaturedDealServiceInterface featuredDealServiceInterface =
  //     FeaturedDealService(featuredDealRepositoryInterface: sl());
  // sl.registerLazySingleton(() => featuredDealServiceInterface);

  // LocationRepositoryInterface locationRepositoryInterface =
  //     LocationRepository(dioClient: sl());
  // sl.registerLazySingleton(() => locationRepositoryInterface);
  // LocationServiceInterface locationServiceInterface =
  //     LocationService(locationRepoInterface: sl());
  // sl.registerLazySingleton(() => locationServiceInterface);

  // LoyaltyPointRepositoryInterface loyaltyPointRepositoryInterface =
  //     LoyaltyPointRepository(dioClient: sl());
  // sl.registerLazySingleton(() => loyaltyPointRepositoryInterface);
  // LoyaltyPointServiceInterface loyaltyPointServiceInterface =
  //     LoyaltyPointService(loyaltyPointRepositoryInterface: sl());
  // sl.registerLazySingleton(() => loyaltyPointServiceInterface);

  // NotificationRepositoryInterface notificationRepositoryInterface =
  //     NotificationRepository(dioClient: sl());
  // sl.registerLazySingleton(() => notificationRepositoryInterface);
  // NotificationServiceInterface notificationServiceInterface =
  //     NotificationService(notificationRepositoryInterface: sl());
  // sl.registerLazySingleton(() => notificationServiceInterface);

  // OnBoardingRepositoryInterface onBoardingRepositoryInterface =
  //     OnBoardingRepository(dioClient: sl());
  // sl.registerLazySingleton(() => onBoardingRepositoryInterface);
  // OnBoardingServiceInterface onBoardingServiceInterface =
  //     OnBoardingService(onBoardingRepositoryInterface: sl());
  // sl.registerLazySingleton(() => onBoardingServiceInterface);

  // OrderRepositoryInterface orderRepositoryInterface =
  //     OrderRepository(dioClient: sl());
  // sl.registerLazySingleton(() => orderRepositoryInterface);
  // OrderServiceInterface orderServiceInterface =
  //     OrderService(orderRepositoryInterface: sl());
  // sl.registerLazySingleton(() => orderServiceInterface);

  // OrderDetailsRepositoryInterface orderDetailsRepositoryInterface =
  //     OrderDetailsRepository(dioClient: sl());
  // sl.registerLazySingleton(() => orderDetailsRepositoryInterface);
  // OrderDetailsServiceInterface orderDetailsServiceInterface =
  //     OrderDetailsService(orderDetailsRepositoryInterface: sl());
  // sl.registerLazySingleton(() => orderDetailsServiceInterface);

  // RefundRepositoryInterface refundRepositoryInterface =
  //     RefundRepository(dioClient: sl());
  // sl.registerLazySingleton(() => refundRepositoryInterface);
  // RefundServiceInterface refundServiceInterface =
  //     RefundService(refundRepositoryInterface: sl());
  // sl.registerLazySingleton(() => refundServiceInterface);

  // ReOrderRepositoryInterface reOrderRepositoryInterface =
  //     ReOrderRepository(dioClient: sl());
  // sl.registerLazySingleton(() => reOrderRepositoryInterface);
  // ReOrderServiceInterface reOrderServiceInterface =
  //     ReOrderService(reOrderRepositoryInterface: sl());
  // sl.registerLazySingleton(() => reOrderServiceInterface);

  // ReviewRepositoryInterface reviewRepositoryInterface =
  //     ReviewRepository(dioClient: sl());
  // sl.registerLazySingleton(() => reviewRepositoryInterface);
  // ReviewServiceInterface reviewServiceInterface =
  //     ReviewService(reviewRepositoryInterface: sl());
  // sl.registerLazySingleton(() => reviewServiceInterface);

  // ProductDetailsRepositoryInterface productDetailsRepositoryInterface =
  //     ProductDetailsRepository(dioClient: sl());
  // sl.registerLazySingleton(() => productDetailsRepositoryInterface);
  // ProductDetailsServiceInterface productDetailsServiceInterface =
  //     ProductDetailsService(productDetailsRepositoryInterface: sl());
  // sl.registerLazySingleton(() => productDetailsServiceInterface);

  // SellerProductRepositoryInterface sellerProductRepositoryInterface =
  //     SellerProductRepository(dioClient: sl());
  // sl.registerLazySingleton(() => sellerProductRepositoryInterface);
  // SellerProductServiceInterface sellerProductServiceInterface =
  //     SellerProductService(sellerProductRepositoryInterface: sl());
  // sl.registerLazySingleton(() => sellerProductServiceInterface);

  // ShopRepositoryInterface shopRepositoryInterface =
  //     ShopRepository(dioClient: sl());
  // sl.registerLazySingleton(() => shopRepositoryInterface);
  // ShopServiceInterface shopServiceInterface =
  //     ShopService(shopRepositoryInterface: sl());
  // sl.registerLazySingleton(() => shopServiceInterface);

  // ProductRepositoryInterface productRepositoryInterface =
  //     ProductRepository(dioClient: sl());
  // sl.registerLazySingleton(() => productRepositoryInterface);
  // ProductServiceInterface productServiceInterface =
  //     ProductService(productRepositoryInterface: sl());
  // sl.registerLazySingleton(() => productServiceInterface);

  // ProfileRepositoryInterface profileRepositoryInterface =
  //     ProfileRepository(dioClient: sl(), sharedPreferences: sl());
  // sl.registerLazySingleton(() => profileRepositoryInterface);
  // ProfileServiceInterface profileServiceInterface =
  //     ProfileService(profileRepositoryInterface: sl());
  // sl.registerLazySingleton(() => profileServiceInterface);

  // SplashRepositoryInterface splashRepositoryInterface =
  //     SplashRepository(dioClient: sl(), sharedPreferences: sl());
  // sl.registerLazySingleton(() => splashRepositoryInterface);
  SplashServiceInterface splashServiceInterface =
      SplashService(splashRepositoryInterface: sl());
  // sl.registerLazySingleton(() => splashServiceInterface);

  // SupportTicketRepositoryInterface supportTicketRepositoryInterface =
  //     SupportTicketRepository(dioClient: sl());
  // sl.registerLazySingleton(() => supportTicketRepositoryInterface);
  // SupportTicketServiceInterface supportTicketServiceInterface =
  //     SupportTicketService(supportTicketRepositoryInterface: sl());
  // sl.registerLazySingleton(() => supportTicketServiceInterface);

  // WishListRepositoryInterface wishListRepositoryInterface =
  //     WishListRepository(dioClient: sl());
  // sl.registerLazySingleton(() => wishListRepositoryInterface);
  // WishlistServiceInterface wishlistServiceInterface =
  //     WishListService(wishListRepositoryInterface: sl());
  // sl.registerLazySingleton(() => wishlistServiceInterface);

  // WalletRepositoryInterface walletRepositoryInterface =
  //     WalletRepository(dioClient: sl());
  // sl.registerLazySingleton(() => walletRepositoryInterface);
  // WalletServiceInterface walletServiceInterface =
  //     WalletService(walletRepositoryInterface: sl());
  // sl.registerLazySingleton(() => walletServiceInterface);

  // SearchProductRepositoryInterface searchProductRepositoryInterface =
  //     SearchProductRepository(dioClient: sl(), sharedPreferences: sl());
  // sl.registerLazySingleton(() => searchProductRepositoryInterface);
  // SearchProductServiceInterface searchProductServiceInterface =
  //     SearchProductService(searchProductRepositoryInterface: sl());
  // sl.registerLazySingleton(() => searchProductServiceInterface);
//************************************* services ****************************************//

  //services
  // sl.registerLazySingleton(() => AddressService(addressRepoInterface: sl()));
  // sl.registerLazySingleton(() => AuthService(authRepoInterface: sl()));
  // sl.registerLazySingleton(
  //     () => BannerService(bannerRepositoryInterface: sl()));
  // sl.registerLazySingleton(() => BrandService(brandRepoInterface: sl()));
  // sl.registerLazySingleton(() => CartService(cartRepositoryInterface: sl()));
  // sl.registerLazySingleton(() => CategoryService(categoryRepoInterface: sl()));
  // sl.registerLazySingleton(() => ChatService(chatRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => ShippingService(shippingRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => CheckoutService(checkoutRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => CompareService(compareRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => ContactUsService(contactUsRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => CouponService(couponRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => FlashDealService(flashDealRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => FeaturedDealService(featuredDealRepositoryInterface: sl()));
  // sl.registerLazySingleton(() => LocationService(locationRepoInterface: sl()));
  // sl.registerLazySingleton(
  //     () => LoyaltyPointService(loyaltyPointRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => NotificationService(notificationRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => OnBoardingService(onBoardingRepositoryInterface: sl()));
  // sl.registerLazySingleton(() => OrderService(orderRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => OrderDetailsService(orderDetailsRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => RefundService(refundRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => ReOrderService(reOrderRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => ReviewService(reviewRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => ProductDetailsService(productDetailsRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => SellerProductService(sellerProductRepositoryInterface: sl()));
  // sl.registerLazySingleton(() => ShopService(shopRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => ProductService(productRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => ProfileService(profileRepositoryInterface: sl()));
  sl.registerLazySingleton(
      () => SplashService(splashRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => SupportTicketService(supportTicketRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => WishListService(wishListRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => WalletService(walletRepositoryInterface: sl()));
  // sl.registerLazySingleton(
  //     () => SearchProductService(searchProductRepositoryInterface: sl()));
}
