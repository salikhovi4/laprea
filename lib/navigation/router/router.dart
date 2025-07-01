import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:laprea/navigation/router/router.gr.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      page: BottomBar.page,
      durationInMilliseconds: 300,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      children: [
        CustomRoute(
          page: EmptyRoute.page,
          durationInMilliseconds: 300,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          children: [
            CustomRoute(
              page: HomeRouteRoot.page,
              durationInMilliseconds: 300,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              children: [
                CustomRoute(
                  page: HomeMainRoute.page,
                  durationInMilliseconds: 300,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  initial: true,
                ),
              ],
            ),
            CustomRoute(
              page: FavorsRouteRoot.page,
              durationInMilliseconds: 300,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              children: [
                CustomRoute(
                  page: FavorsMainRoute.page,
                  durationInMilliseconds: 300,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  initial: true,
                ),
              ],
            ),
            CustomRoute(
              page: AppointmentRouteRoot.page,
              durationInMilliseconds: 300,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              children: [
                CustomRoute(
                  initial: true,
                  page: AppointmentMainRoute.page,
                  durationInMilliseconds: 300,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                ),
                AutoRoute(page: SelectFavorCategoryRoute.page),
                AutoRoute(page: SelectFavorRoute.page),
                AutoRoute(page: SelectSpecialistCategoryRoute.page),
                AutoRoute(page: SelectSpecialistRoute.page),
              ],
            ),
            CustomRoute(
              page: ProfileRouteRoot.page,
              durationInMilliseconds: 300,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              children: [
                CustomRoute(
                  initial: true,
                  page: ProfileMainRoute.page,
                  durationInMilliseconds: 300,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                ),
              ],
            ),
          ],
        ),
      ],
    ),

    // /// Auth
    // CustomRoute(
    //   page: AuthMainRoute.page,
    //   durationInMilliseconds: 300,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    // CustomRoute(
    //   page: LoginOrRegisterRoute.page,
    //   durationInMilliseconds: 300,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    // CustomRoute(
    //   page: AuthPhoneVerificationRoute.page,
    //   durationInMilliseconds: 300,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    // CustomRoute(
    //   page: AuthPrivacyRoute.page,
    //   durationInMilliseconds: 300,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    // CustomRoute(
    //   page: AuthSuccessRoute.page,
    //   durationInMilliseconds: 300,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    //
    // /// Project
    // CustomRoute(
    //   page: ProjectDetailsRoute.page,
    //   durationInMilliseconds: 300,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    // CustomRoute(
    //   page: ProjectCardGalleryRoute.page,
    //   durationInMilliseconds: 300,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    // CustomRoute(
    //   page: MediaViewerRoute.page,
    //   durationInMilliseconds: 300,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    //
    // /// Room
    // CustomRoute(
    //   page: RoomsMainRoute.page,
    //   durationInMilliseconds: 300,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    // CustomRoute(
    //   page: RoomDetailsRoute.page,
    //   durationInMilliseconds: 300,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    // CustomRoute(
    //   page: RoomInterestFormRoute.page,
    //   durationInMilliseconds: 300,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    //
    // /// PDF
    // CustomRoute(
    //   page: PdfDocumentViewerRoute.page,
    //   durationInMilliseconds: 300,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    //
    // /// Notification details
    // CustomRoute(
    //   page: NotificationDetailsRoute.page,
    //   durationInMilliseconds: 300,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    //
    // /// Booking
    // CustomRoute(
    //   page: BookingPaymentMethodRoute.page,
    //   durationInMilliseconds: 300,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    // CustomRoute(
    //   page: BookingMainRoute.page,
    //   durationInMilliseconds: 300,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    // CustomRoute(
    //   page: BookingProcessDescriptionRoute.page,
    //   durationInMilliseconds: 300,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    //
    // /// Chat
    // CustomRoute(
    //   page: ChatMainRoute.page,
    //   durationInMilliseconds: 300,
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    //
    /// Splash
    CustomRoute(
      page: SplashRoute.page,
      durationInMilliseconds: 300,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),
  ];
}
