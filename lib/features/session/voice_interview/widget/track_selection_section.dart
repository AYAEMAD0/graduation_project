import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

import '../../../../core/theme/app_color.dart';

class TrackSelectionSection extends StatelessWidget {
  final List<Map<String, dynamic>> tracks;
  final String? selectedTrack;
  final ValueChanged<String> onTrackSelected;

  const TrackSelectionSection({
    required this.tracks,
    required this.selectedTrack,
    required this.onTrackSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('1. Select Your Track', style: AppStyle.font24BlackBold),
        const SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 4.5,
          ),
          itemCount: tracks.length,
          itemBuilder: (context, index) {
            final track = tracks[index];
            final isSelected = selectedTrack == track['title'];
            return GestureDetector(
              onTap: () => onTrackSelected(track['title']),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isSelected
                      ? (track['color'] as Color).withValues(alpha: 0.2)
                      : AppColor.grayLightColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected ? track['color'] : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(track['icon'], color: track['color'], size: 32),
                    const SizedBox(width: 12),
                    Text(track['title'], style: AppStyle.font16BlackSemiBold),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
