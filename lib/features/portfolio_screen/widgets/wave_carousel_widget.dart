import 'dart:math';
import 'package:flutter/material.dart';

import '../../../exports.dart';

/// Wave carousel with built-in dots indicator.
/// Usage: WaveCarousel(images: project.images)
class WaveCarousel extends StatefulWidget {
  const WaveCarousel({super.key, required this.images});

  final List<String> images;

  @override
  State<WaveCarousel> createState() => _WaveCarouselState();
}

class _WaveCarouselState extends State<WaveCarousel>
    with SingleTickerProviderStateMixin {
  // ── constants ────────────────────────────────────────────────
  static const double _itemWidth    = 150.0;
  static const double _itemSpacing  = 14.0;
  static const double _stride       = _itemWidth + _itemSpacing * 2;
  static const double _waveAmp      = 38.0;
  static const double _waveFreq     = 0.025;
  static const double _autoSpeed    = 0.7;
  static const double _momentumDecay = 0.90;
  static const double _containerH   = 380.0;

  // ── state ────────────────────────────────────────────────────
  late AnimationController _ticker;
  double _scrollX   = 0;
  bool   _hovered   = false;
  bool   _dragging  = false;
  double _dragStartX      = 0;
  double _dragScrollStart = 0;
  double _velocity        = 0;
  double _prevPointerX    = 0;

  late List<String> _loopedImages;
  late double       _loopLength;

  /// index of the image closest to viewport center
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _loopedImages = [...widget.images, ...widget.images];
    _loopLength   = widget.images.length * _stride;

    _ticker = AnimationController(
      vsync: this,
      duration: const Duration(days: 1),
    )
      ..addListener(_onTick)
      ..repeat();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _onTick() {
    if (!mounted) return;
    setState(() {
      if (!_hovered && !_dragging) _scrollX += _autoSpeed;

      if (!_dragging && _velocity.abs() > 0.2) {
        _scrollX -= _velocity * 0.5;
        _velocity *= _momentumDecay;
      }

      _scrollX = _scrollX % _loopLength;
      if (_scrollX < 0) _scrollX += _loopLength;

      // which image slot is closest to the viewport center
      _activeIndex =
          ((_scrollX + _containerH * 0.5) / _stride).round() %
              widget.images.length;
    });
  }

  // ── gestures ─────────────────────────────────────────────────
  void _onPanStart(DragStartDetails d) {
    _dragging       = true;
    _dragStartX     = d.globalPosition.dx;
    _dragScrollStart = _scrollX;
    _prevPointerX   = d.globalPosition.dx;
    _velocity       = 0;
  }

  void _onPanUpdate(DragUpdateDetails d) {
    if (!_dragging) return;
    _velocity     = _prevPointerX - d.globalPosition.dx;
    _prevPointerX = d.globalPosition.dx;
    setState(() {
      _scrollX =
          (_dragScrollStart + (_dragStartX - d.globalPosition.dx)) %
              _loopLength;
      if (_scrollX < 0) _scrollX += _loopLength;
    });
  }

  void _onPanEnd(DragEndDetails _) => _dragging = false;

  // ── build ─────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.grab,
      child: GestureDetector(
        onHorizontalDragStart:  _onPanStart,
        onHorizontalDragUpdate: _onPanUpdate,
        onHorizontalDragEnd:    _onPanEnd,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: _containerH,
              child: ClipRect(
                child: _WaveTrack(
                  images:          _loopedImages,
                  originalCount:   widget.images.length,
                  scrollX:         _scrollX,
                  itemWidth:       _itemWidth,
                  itemSpacing:     _itemSpacing,
                  stride:          _stride,
                  waveAmplitude:   _waveAmp,
                  waveFrequency:   _waveFreq,
                  containerHeight: _containerH,
                ),
              ),
            ),

            // ── dots indicator ──────────────────────────────────
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (i) {
                final active = i == _activeIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  width:  active ? 18 : 5,
                  height: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: active
                        ? const Color(0xFF7C3AED)
                        : Colors.white12,
                  ),
                );
              }),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}

// ── Track ─────────────────────────────────────────────────────────────────────
class _WaveTrack extends StatelessWidget {
  const _WaveTrack({
    required this.images,
    required this.originalCount,
    required this.scrollX,
    required this.itemWidth,
    required this.itemSpacing,
    required this.stride,
    required this.waveAmplitude,
    required this.waveFrequency,
    required this.containerHeight,
  });

  final List<String> images;
  final int          originalCount;
  final double       scrollX;
  final double       itemWidth;
  final double       itemSpacing;
  final double       stride;
  final double       waveAmplitude;
  final double       waveFrequency;
  final double       containerHeight;

  static const _baseHeights = [260.0, 225.0, 275.0, 240.0, 290.0, 230.0];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      final viewWidth    = constraints.maxWidth;
      final centerX      = viewWidth / 2;
      final visibleCount = (viewWidth / stride).ceil() + 3;
      final firstIndex   = (scrollX / stride).floor();
      final List<Widget> items = [];

      for (int i = firstIndex - 1; i < firstIndex + visibleCount; i++) {
        final imgIndex = i % images.length;
        if (imgIndex < 0) continue;

        final x     = i * stride - scrollX;
        final phase = i * stride * waveFrequency + scrollX * waveFrequency;
        final yOff  = sin(phase) * waveAmplitude;

        // distance from viewport centre → scale focal card up
        final distFromCenter = (x + itemWidth / 2 - centerX).abs();
        final maxDist        = viewWidth * 0.6;
        final t              = (1 - (distFromCenter / maxDist).clamp(0.0, 1.0));
        final scale          = 0.82 + 0.18 * t;   // 0.82 → 1.00
        final opacity        = 0.45 + 0.55 * t;   // 0.45 → 1.00

        final baseH = _baseHeights[imgIndex % _baseHeights.length];
        final itemH = baseH * scale;
        final top   = (containerHeight - itemH) / 2 + yOff;

        items.add(
          Positioned(
            left:   x + itemSpacing,
            top:    top,
            width:  itemWidth * scale,
            height: itemH,
            child: Opacity(
              opacity: opacity,
              child: _CarouselCard(imagePath: images[imgIndex]),
            ),
          ),
        );
      }

      return Stack(clipBehavior: Clip.none, children: items);
    });
  }
}

// ── Card ──────────────────────────────────────────────────────────────────────
class _CarouselCard extends StatelessWidget {
  const _CarouselCard({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (_) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ImageNetworkZoomWidget(
            image: AssetGenImage(imagePath),
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.asset(
          imagePath,
          width:  double.infinity,
          height: double.infinity,
          fit:    BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            decoration: BoxDecoration(
              color:        Colors.white10,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Center(
              child: Icon(
                Icons.image_not_supported_outlined,
                color: Colors.white24,
                size:  32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}