import 'package:go_router/go_router.dart';
import '../presentation/screens/auth/sign_in.dart';

final router = GoRouter(
  routes: [
    //GoRoute(path: '/', builder: (context, state) => Home()),
    GoRoute(path: '/', builder: (context, state) => SignIn()),
  ],
);