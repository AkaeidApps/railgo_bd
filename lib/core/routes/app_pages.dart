import 'package:get/get.dart';

import '../../features/splash/splash_view.dart';
import '../../features/onboarding/onboarding_view.dart';
import '../../features/authentication/login_view.dart';
import '../../features/authentication/register_view.dart';
import '../../features/authentication/forgot_password_view.dart';
import '../../features/authentication/otp_view.dart';
import '../../features/authentication/profile_setup_view.dart';
import '../../features/main_nav/main_nav_view.dart';
import '../../features/home/home_view.dart';
import '../../features/train_search/train_search_view.dart';
import '../../features/train_search/search_results_view.dart';
import '../../features/train_details/train_details_view.dart';
import '../../features/train_details/route_timeline_view.dart';
import '../../features/stations/station_directory_view.dart';
import '../../features/stations/station_details_view.dart';
import '../../features/seat_selection/seat_selection_view.dart';
import '../../features/booking/passenger_info_view.dart';
import '../../features/booking/booking_review_view.dart';
import '../../features/booking/payment_view.dart';
import '../../features/booking/booking_status_view.dart';
import '../../features/booking/eticket_view.dart';
import '../../features/tickets/my_tickets_view.dart';
import '../../features/notifications/notifications_view.dart';
import '../../features/profile/profile_view.dart';
import '../../features/settings/settings_view.dart';
import '../../features/support/help_support_view.dart';
import '../../features/support/faq_view.dart';
import '../../features/support/about_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashView()),
    GetPage(name: AppRoutes.onboarding, page: () => const OnboardingView()),
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
    GetPage(name: AppRoutes.register, page: () => const RegisterView()),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
    ),
    GetPage(name: AppRoutes.otpVerification, page: () => const OtpView()),
    GetPage(name: AppRoutes.profileSetup, page: () => const ProfileSetupView()),
    GetPage(name: AppRoutes.mainNav, page: () => const MainNavView()),
    GetPage(name: AppRoutes.home, page: () => const HomeView()),
    GetPage(name: AppRoutes.trainSearch, page: () => const TrainSearchView()),
    GetPage(
      name: AppRoutes.searchResults,
      page: () => const SearchResultsView(),
    ),
    GetPage(name: AppRoutes.trainDetails, page: () => const TrainDetailsView()),
    GetPage(
      name: AppRoutes.routeTimeline,
      page: () => const RouteTimelineView(),
    ),
    GetPage(
      name: AppRoutes.stationDirectory,
      page: () => const StationDirectoryView(),
    ),
    GetPage(
      name: AppRoutes.stationDetails,
      page: () => const StationDetailsView(),
    ),
    GetPage(
      name: AppRoutes.seatSelection,
      page: () => const SeatSelectionView(),
    ),
    GetPage(
      name: AppRoutes.passengerInfo,
      page: () => const PassengerInfoView(),
    ),
    GetPage(
      name: AppRoutes.bookingReview,
      page: () => const BookingReviewView(),
    ),
    GetPage(name: AppRoutes.payment, page: () => const PaymentView()),
    GetPage(
      name: AppRoutes.bookingStatus,
      page: () => const BookingStatusView(),
    ),
    GetPage(name: AppRoutes.eticket, page: () => const EticketView()),
    GetPage(name: AppRoutes.myTickets, page: () => const MyTicketsView()),
    GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationsView(),
    ),
    GetPage(name: AppRoutes.profile, page: () => const ProfileView()),
    GetPage(name: AppRoutes.settings, page: () => const SettingsView()),
    GetPage(name: AppRoutes.helpSupport, page: () => const HelpSupportView()),
    GetPage(name: AppRoutes.faq, page: () => const FaqView()),
    GetPage(name: AppRoutes.about, page: () => const AboutView()),
  ];
}
