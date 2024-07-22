import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getIt.get<HomeReboImpl>())..getFeaturedBox(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(getIt.get<HomeReboImpl>())..fetchNewestBox(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
