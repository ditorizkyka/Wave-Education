import 'package:go_router/go_router.dart';
import 'package:wave_education/src/core/auth/login_page/login_page.dart';
import 'package:wave_education/src/core/auth/signup/signup_page.dart';
import 'package:wave_education/src/core/dashboard/course/course_detail/course_detail_page.dart';
import 'package:wave_education/src/core/dashboard/course/module_detail/module_detail_page.dart';
import 'package:wave_education/src/core/dashboard/course/course_page.dart';
import 'package:wave_education/src/core/dashboard/dashboard_page.dart';
import 'package:wave_education/src/core/profile/profile_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/login",
      name: 'login',
      builder: (context, state) => const LoginPage(),
      pageBuilder: (context, state) => const NoTransitionPage(
        child: LoginPage(),
      ),
    ),
    GoRoute(
      path: "/signup",
      name: 'signup',
      builder: (context, state) => const SignupPage(),
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SignupPage(),
      ),
    ),
    GoRoute(
      path: "/",
      name: 'dashboard',
      builder: (context, state) => const DashboardPage(),
      routes: [
        GoRoute(
          path: "profile",
          name: 'profile',
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: 'courses',
          name: 'courses',
          builder: (context, state) => const CoursePage(),
        ),
        GoRoute(
          path: "courses/:courseName",
          name: 'DBCourse',
          builder: (context, state) {
            final courseName =
                state.pathParameters['courseName'] ?? 'no course';
            return CourseDetailPage(
              courseName: courseName,
            );
          },
          routes: [
            GoRoute(
              path: "/module/:moduleName",
              name: 'module',
              builder: (context, state) {
                final courseName = Uri.decodeComponent(
                    state.pathParameters['courseName'] ?? 'no_course');
                final moduleName = Uri.decodeComponent(
                    state.pathParameters['moduleName'] ?? 'no_module');
                return ModuleDetailPage(
                  courseName: courseName,
                  moduleName: moduleName,
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
  routerNeglect: false,
  initialLocation: "/login",
  // debugLogDiagnostics: true,
);
