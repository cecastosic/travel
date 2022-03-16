import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:travel/injection/injection.dart';
import 'package:travel/presentation/features/details/details_screen.dart';
import 'package:travel/presentation/features/list/list_screen.dart';
import 'package:travel/presentation/features/login/login_screen.dart';
import 'package:travel/presentation/features/profile/profile_screen.dart';
import 'package:travel/providers/login_provider.dart';

final loginInfo = inject<LoginInfo>();

final router = GoRouter(
  initialLocation: LoginScreen.path,
  redirect: (GoRouterState state) {
    final loggedIn = loginInfo.loggedIn;
    final loggingIn = state.subloc == '/login';
    if (!loggedIn) return loggingIn ? null : '/login';

    // google sign in
    final User? user = FirebaseAuth.instance.currentUser;
    print(user);
    if (user != null) return ProfileScreen.path;
    //return loggingIn ? ProfileScreen.path : null;

    // if the user is logged in but still on the login page, send them to
    // the home page
    if (loggingIn) return ListScreen.path;

    // no need to redirect at all
    return null; //return null;
  },
  refreshListenable: inject<LoginInfo>(),
  routes: [
    GoRoute(
      name: LoginScreen.name,
      path: LoginScreen.path,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: ListScreen.path,
      name: ListScreen.name,
      builder: (context, state) => const ListScreen(),
      routes: [
        GoRoute(
          path: DetailsScreen.path,
          name: DetailsScreen.name,
          builder: (context, state) => const DetailsScreen(),
        ),
      ],
    ),
    GoRoute(
      name: ProfileScreen.name,
      path: ProfileScreen.path,
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
