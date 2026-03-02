import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_gradient.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/features/main/widget/build_dock_avatar.dart';

import '../tabs/profile/viewmodel/profile/profile_cubit.dart';
import '../tabs/profile/viewmodel/profile/profile_state.dart';
import 'nav_item.dart';

class Navbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const Navbar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    if (isMobile) {
      return Container();
    }
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(gradient: AppGradient.primaryGradient),
      child: Row(
        children: [
          Image.asset(AppAsset.logoAppImage, height: 80, width: 110),
          const SizedBox(width: 10),
          Text(
            "MockMate.ai",
            overflow: TextOverflow.ellipsis,
            style: AppStyle.font45BlackBoldRounded.copyWith(
              fontSize: 24,
              color: AppColor.whiteColor,
            ),
          ),
          const Spacer(),
          Row(
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
                  List<int>? imageBytes;
                  if (state is ProfileSuccess) {
                    imageUrl = state.user.avatarPath;
                  } else if (state is ProfileUpdateSuccess) {
                    imageUrl = state.user.avatarPath;
                  } else if (state is ProfileImageSelected) {
                    imageBytes = state.imageBytes;
                    imageUrl = state.user?.avatarPath;
                  }
                  return BuildDockAvatar(
                    isWeb: true,
                    index: 3,
                    currentIndex: currentIndex,
                    onTap: onTap,
                    imageUrl: imageUrl,
                    imageBytes: imageBytes,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
