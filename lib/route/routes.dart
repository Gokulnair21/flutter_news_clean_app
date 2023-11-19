import 'package:go_router/go_router.dart';
import 'package:news_app/features/news/domain/entity/news.dart';
import 'package:news_app/features/news/presentation/details/details_page.dart';
import 'package:news_app/features/news/presentation/home/home_page.dart';

import 'app_routes.dart';

final router = GoRouter(
  initialLocation: AppRoutes.HOME_PAGE,
  routes: [
    GoRoute(
      path: AppRoutes.HOME_PAGE,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          name: AppRoutes.DETAILS_PAGE,
          path: AppRoutes.DETAILS_PAGE,
          builder: (context, state) {
            final news = state.extra as News;
            return DetailsPage(news: news);
          },
        )
      ],
    ),
  ],
);
