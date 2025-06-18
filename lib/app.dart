import 'package:fake_instagram/features/auth/data/firebase_auth_repo.dart';
import 'package:fake_instagram/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fake_instagram/features/auth/presentation/cubits/auth_states.dart';
import 'package:fake_instagram/features/auth/presentation/pages/auth_page.dart';
import 'package:fake_instagram/features/post/presentation/pages/home_page.dart';
import 'package:fake_instagram/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final authRepo = FirebaseAuthRepo();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, authState) {
            if (authState is UnAuthenticated) {
              return const AuthPage();
            }

            if (authState is Authenticated) {
              return const HomePage();
            }

            // loading...

            else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
