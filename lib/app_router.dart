import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app/features/Home/Logic/cubit/home_cubit.dart';

import 'features/Home/presentation/screens/home.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) {
        return BlocProvider(
          create: (context) => HomeCubit()..getHomeData(),
          child: HomeScreen(),
        );
      },
    ),
  ],
);
