import 'package:get/get.dart';
import 'package:waseet_app/core/constant/routing.dart';
import 'package:waseet_app/features/add_property/add_property_view1.dart';
import 'package:waseet_app/features/add_property/add_property_view2.dart';
import 'package:waseet_app/features/auth/bindings/login_binding.dart';
import 'package:waseet_app/features/auth/bindings/signin_bindings.dart';
import 'package:waseet_app/features/auth/bindings/signup_bindings.dart';
import 'package:waseet_app/features/auth/views/login_view.dart';
import 'package:waseet_app/features/auth/views/signin_view.dart';
import 'package:waseet_app/features/auth/views/signup_view.dart';
import 'package:waseet_app/features/bottom_navigation_bar/bottom_navigation_bar_binding.dart';
import 'package:waseet_app/features/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:waseet_app/features/details/details_binding.dart';
import 'package:waseet_app/features/details/details_view.dart';
import 'package:waseet_app/features/home/bindings.dart';
import 'package:waseet_app/features/home/home_view.dart';
import 'package:waseet_app/features/profile/profile_binding.dart';
import 'package:waseet_app/features/profile/profile_view.dart';
import 'package:waseet_app/features/save/save_binding.dart';
import 'package:waseet_app/features/save/save_view.dart';
import 'package:waseet_app/features/search/bindings/search_binding.dart';
import 'package:waseet_app/features/search/views/filter_view.dart';
import 'package:waseet_app/features/search/views/search_view.dart';
import 'package:waseet_app/features/splash_screen/splash_screen_binding.dart';
import 'features/splash_screen/splash_screen_view.dart';

final List<GetPage> pages = <GetPage>[
  GetPage(
    name: AppRouting.splashview,
    page: () => const SplashScreen(),
    binding: SplashScreenBinding(),
  ), 
  GetPage(
      name: AppRouting.bottomNavigationBarView,
      page: () => const BottomNavigationBarView(),
      binding: BottomNavigationBarBinding()),
  GetPage(
      name: AppRouting.homeView,
      page: () => const ViewHome(),
      binding: BindingHome()),
      GetPage(
      name: AppRouting.signInView,
      page: () => const SignInView(),
      binding: SignInBinding()),
      GetPage(
      name: AppRouting.signUpView,
      page: () => const SignUpView(),
      binding: SignUpBinding()),
      GetPage(
      name: AppRouting.loginView,
      page: () => const LoginView(),
      binding: LoginBinding()),
       GetPage(
      name: AppRouting.addPropertyView1,
      page: () => const AddPropertyView1()),
      GetPage(
      name: AppRouting.addPropertyView2,
      page: () => const AddPropertyView2()),
      GetPage(
      name: AppRouting.searchView,
      page: () =>  SearchView(),
      binding: SearchBinding()),
      GetPage(
      name: AppRouting.filterView,
      page: () => const FilterView(),),
      GetPage(
      name: AppRouting.detailsView,
      page: () => const DetailsView(),
      binding: DetailsBinding()),
      GetPage(
      name: AppRouting.saveView,
      page: () => const SavedView(),
      binding: SaveBinding()),
      GetPage(
      name: AppRouting.profileView,
      page: () => const ProfileView(),
      binding: ProfileBinding()),
];
