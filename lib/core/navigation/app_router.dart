import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../presentation/features/home/home_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        // GoRoute(
        //   path: 'details/:id',
        //   builder: (context, state) => DetailsScreen(
        //     id: state.params['id']!,
        //   ),
        // ),
      ],
    ),
  ],
);