import 'package:go_router/go_router.dart';
import 'package:store_app/features/home/presentation/views/update_view.dart';
import '../../features/home/presentation/views/home_page.dart';


abstract class AppRouter {
  static const home = '/home';
  static const update = '/update';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: update,
        builder: (context, state) =>  UpdateView(
         category:  state.extra.toString()
        ),
      ),
    ],
  );
}
