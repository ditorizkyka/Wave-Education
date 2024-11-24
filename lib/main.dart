import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import google fonts
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_education/src/core/auth/login_page/login_page.dart';
import 'package:wave_education/src/core/auth/signup/signup_page.dart';
import 'package:wave_education/src/core/dashboard/dashboard_page.dart';
import 'package:wave_education/src/core/profile/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        path: "/dashboard",
        name: 'dashboard',
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: "/profile",
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),
    ],
    initialLocation: "/login",
    debugLogDiagnostics: true,
  );

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MainHeader(),
        ),
        body: DashboardPage());
  }
}

class MainHeader extends StatelessWidget {
  const MainHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFDFE9FF),
      title: Container(
        margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
        width: 200,
        child: Image.asset(
          "assets/images/logo.png",
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 8, 60, 0),
          child: Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "Dashboard",
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF5B5B5B),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Course",
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF5B5B5B),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "About Us",
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF5B5B5B),
                  ),
                ),
              ),
              // Foto profile
              const SizedBox(width: 30),
              Row(
                children: [
                  Container(
                      // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: 35,
                      // height: 45,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                            fit: BoxFit.cover),
                      )),
                  const SizedBox(width: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Ghefin",
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 5),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                        child: Icon(
                          size: 15,
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
