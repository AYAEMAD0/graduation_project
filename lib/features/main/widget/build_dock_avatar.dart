import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../core/theme/app_color.dart';

class BuildDockAvatar extends StatelessWidget {
  final int index;
  final int currentIndex;
  final Function(int) onTap;
  final bool isWeb;
  final String? imageUrl;
  final List<int>? imageBytes;

  const BuildDockAvatar({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    required this.isWeb,
    this.imageUrl,
    this.imageBytes,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = currentIndex == index;

    ImageProvider? avatarImage;
    if (imageBytes != null) {
      avatarImage = MemoryImage(Uint8List.fromList(imageBytes!));
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      avatarImage = NetworkImage(imageUrl!);
    }

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? (isWeb ? const Color(0xA6A806F9) : AppColor.purple)
                : Colors.transparent,
            width: 3,
          ),
        ),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: avatarImage,
          child: avatarImage == null
              ? Icon(
                  Icons.person,
            color: isSelected ? AppColor.purple : Colors.black,
            size: 22,
                )
              : null,
        ),
      ),
    );
  }
}
