import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/theme/app_gradient.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';
import 'package:mock_mate_ai/features/home/widget/nav_item.dart';

class Navbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const Navbar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Container(
      height: isMobile ? 70 : 100,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 60),
      decoration: BoxDecoration(gradient: AppGradient.primaryGradient),
      child: Row(
        children: [
        
          Image.asset(
            AppAsset.logoAppImage,
            height: isMobile ? 40 : 80,
            width: isMobile ? 60 : 110,
          ),

        
          Expanded(
            child: Text(
              "MockMate.ai",
              overflow: TextOverflow.ellipsis,
              style: AppStyle.font45BlackBoldRounded.copyWith(
                fontSize: isMobile ? 18 : 24, 
              ),
            ),
          ),

    
          if (!isMobile) ...[
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
          ] else
  
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),

          const SizedBox(width: 10),

    
          const CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.black, size: 20),
          ),
        ],
      ),
    );
  }
}