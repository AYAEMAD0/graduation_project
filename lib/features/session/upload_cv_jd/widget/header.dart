import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/constants/app_asset.dart';
import 'package:mock_mate_ai/core/theme/app_color.dart';
import 'package:mock_mate_ai/core/theme/app_style.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _typeController;
  late AnimationController _cursorController;
  late Animation<double> _pulse;
  final String _fullText = 'MockMate.ai';
  String _displayText = '';
  bool _showCursor = false;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _pulse = Tween<double>(begin: 0.8, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _cursorController.addListener(() {
      if (mounted) setState(() => _showCursor = _cursorController.value > 0.5);
    });

    _typeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _fullText.length * 250),
    );

    _typeController.addListener(() {
      final newLength = (_typeController.value * _fullText.length).round();
      if (newLength != _displayText.length) {
        setState(() => _displayText = _fullText.substring(0, newLength));
      }
    });

    _typeController.addStatusListener((status) async {
      if (status == AnimationStatus.forward) {
        _cursorController.repeat(reverse: true);
      } else if (status == AnimationStatus.completed) {
        _cursorController.stop();
        if (mounted) setState(() => _showCursor = false);
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) {
          setState(() => _displayText = '');
          _typeController.forward(from: 0);
        }
      }
    });

    _typeController.forward();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _typeController.dispose();
    _cursorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    if (isMobile) return const SizedBox.shrink();

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.whiteColor.withValues(alpha: 0.3),
      ),
      child: Row(
        children: [
          AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Transform.scale(
                scale: _pulse.value,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(
                          0xFF6C63FF,
                        ).withValues(alpha: 0.3 * _pulseController.value),
                        blurRadius: 15,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    AppAsset.logoAppImage,
                    height: 80,
                    width: 110,
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _displayText,
                overflow: TextOverflow.ellipsis,
                style: AppStyle.font45BlackBoldRounded.copyWith(fontSize: 24),
              ),
              AnimatedOpacity(
                opacity: _showCursor ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 100),
                child: Text(
                  '|',
                  style: AppStyle.font45BlackBoldRounded.copyWith(
                    fontSize: 24,
                    color: AppColor.purple,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}