import 'package:go_router/go_router.dart';
import 'package:obesity_calculator/pages/man_result_page.dart';
import 'package:obesity_calculator/pages/start_page.dart';
import 'package:obesity_calculator/pages/woman_result_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const StartPage(),
    ),
    GoRoute(
      path: '/manresult',
      builder: (context, state) {
        double height = double.parse(state.uri.queryParameters['height']!);
        double weight = double.parse(state.uri.queryParameters['weight']!);
        return ManResultPage(
          height: height,
          weight: weight,
        );
      },
    ),
    GoRoute(
      path: '/womanresult',
      builder: (context, state) {
        double height = double.parse(state.uri.queryParameters['height']!);
        double weight = double.parse(state.uri.queryParameters['weight']!);
        return WomanResultPage(
          height: height,
          weight: weight,
        );
      },
    ),
  ],
);
