import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../tabs/profile/viewmodel/profile/profile_cubit.dart';
import '../tabs/profile/viewmodel/profile/profile_state.dart';
import 'build_dock_avatar.dart';
import 'nav_item.dart';

class BuildNavTab extends StatelessWidget {
  const BuildNavTab({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        NavItem(
          title: "Home",
          index: 0,
          currentIndex: currentIndex,
          onTap: () => onTap(0),
        ),
        NavItem(
          title: "History",
          index: 1,
          currentIndex: currentIndex,
          onTap: () => onTap(1),
        ),
        NavItem(
          title: "FAQ",
          index: 2,
          currentIndex: currentIndex,
          onTap: () => onTap(2),
        ),
        const SizedBox(width: 10),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            String? imageUrl;
            if (state is ProfileSuccess) {
              imageUrl = state.user.avatarPath;
            } else if (state is ProfileUpdateSuccess) {
              imageUrl = state.user.avatarPath;
            } else if (state is ProfileImageSelected) {
              imageUrl = state.user?.avatarPath;
            }
            return BuildDockAvatar(
              isWeb: true,
              index: 3,
              currentIndex: currentIndex,
              onTap: onTap,
              imageUrl: imageUrl,
              imageBytes: null,
            );
          },
        ),
      ],
    );
  }
}
