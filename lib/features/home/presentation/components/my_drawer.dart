import 'package:fake_instagram/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fake_instagram/features/home/presentation/components/my_drawer_tile.dart';
import 'package:fake_instagram/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
              MyDrawerTile(
                title: 'H o m e',
                icon: Icons.home,
                onTap: Navigator.of(context).pop,
              ),
              MyDrawerTile(
                title: 'P r o f i l e',
                icon: Icons.person,
                onTap: () {
                  Navigator.of(context).pop();

                  final user = context.read<AuthCubit>().currentUser;
                  String? uid = user!.uid;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(uid: uid),
                    ),
                  );
                },
              ),
              MyDrawerTile(
                title: 'S e a r c h',
                icon: Icons.search,
                onTap: () {},
              ),
              MyDrawerTile(
                title: 'S e t t i n g s',
                icon: Icons.settings,
                onTap: () {},
              ),
              const Spacer(),
              MyDrawerTile(
                title: 'L o g o u t',
                icon: Icons.logout,
                onTap: () {
                  context.read<AuthCubit>().logOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
