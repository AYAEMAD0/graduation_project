import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

import 'segmented_bar.dart';
import 'sub_track_panel.dart';

class TrackSelectionSection extends StatefulWidget {
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
  State<TrackSelectionSection> createState() => _TrackSelectionSectionState();
}

class _TrackSelectionSectionState extends State<TrackSelectionSection>
    with SingleTickerProviderStateMixin {
  String? _activeMain;
  late AnimationController _animCtrl;
  late Animation<double> _fadeAnim;

  String? get _resolvedMain {
    if (_activeMain != null) return _activeMain;
    if (widget.selectedTrack == null) return null;
    for (final t in widget.tracks) {
      if ((t['subTracks'] as List<String>).contains(widget.selectedTrack)) {
        return t['title'] as String;
      }
    }
    return null;
  }

  Map<String, dynamic>? get _activeData => _resolvedMain == null
      ? null
      : widget.tracks.firstWhere(
          (t) => t['title'] == _resolvedMain,
          orElse: () => {},
        );

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    _fadeAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut);
    if (_resolvedMain != null) _animCtrl.value = 1;
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    super.dispose();
  }

  void _onSegmentTap(String title) {
    setState(() {
      if (_activeMain == title) {
        _activeMain = null;
        _animCtrl.reverse();
      } else {
        _activeMain = title;
        _animCtrl.forward(from: 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '1. Select Your Track',
          style: AppStyle.font24BlackBold.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 12),
        SegmentedBar(
          tracks: widget.tracks,
          activeMain: _resolvedMain,
          onTap: _onSegmentTap,
        ),

        FadeTransition(
          opacity: _fadeAnim,
          child: SizeTransition(
            sizeFactor: _fadeAnim,
            axisAlignment: -1,
            child: _activeData != null
                ? SubTrackPanel(
                    trackData: _activeData!,
                    selectedSub: widget.selectedTrack,
                    onSubSelected: widget.onTrackSelected,
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}

