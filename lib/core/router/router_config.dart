import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:snap_blind/core/router/route_enum.dart';
import 'package:snap_blind/presenter/chat/chat_list_screen.dart';
import 'package:snap_blind/presenter/chat/chat_screen.dart';
import 'package:snap_blind/presenter/home/home_screen.dart';
import 'package:snap_blind/presenter/login/login_screen.dart';
import 'package:snap_blind/presenter/my/my_info_screen.dart';
import 'package:snap_blind/presenter/widget/app_bottom_navigation_bar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;

GoRouter? _goRouter;
GoRouter? get goRouter => _goRouter;

void createRouter({String? initialLocation}) {
  _goRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: initialLocation,
    redirect: (context, state) {
      /// app TODO: 리다이렉트 로직 작성
      return null;
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppBottomNavigationBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.home.path,
                builder: (context, state) {
                  return const HomeScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.chatList.path,
                builder: (context, state) {
                  return const ChatListScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.myInfo.path,
                builder: (context, state) {
                  return const MyInfoScreen();
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoute.login.path,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: AppRoute.chat.path,
        builder: (context, state) {
          return const ChatScreen();
        },
      ),
    ],
  );
}
