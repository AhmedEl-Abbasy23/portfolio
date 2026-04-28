import 'dart:ui';
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';

class CursorManager {
  static bool _initialized = false;

  static Future<void> init() async {
    if (!kIsWeb || _initialized) return;
    _initialized = true;
    await _injectCursorStyles();
  }

  static Future<void> _injectCursorStyles() async {
    final defaultCursor = await _buildCursorDataUri(_drawDefault);
    final hoverCursor   = await _buildCursorDataUri(_drawHover);
    final textCursor    = await _buildCursorDataUri(_drawText);
    final waitCursor    = await _buildCursorDataUri(_drawWait);

    final style = html.StyleElement();
    style.text = '''
      * { cursor: url("$defaultCursor") 4 2, auto !important; }
      a, button, [role="button"] {
        cursor: url("$hoverCursor") 4 2, pointer !important;
      }
      input[type="text"], textarea, [contenteditable] {
        cursor: url("$textCursor") 8 16, text !important;
      }
      .loading, [aria-busy="true"] {
        cursor: url("$waitCursor") 4 2, wait !important;
      }
    ''';
    html.document.head!.append(style);
  }

  static Future<String> _buildCursorDataUri(
      void Function(Canvas, Size) painter,
      ) async {
    const size = Size(32, 32);
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    painter(canvas, size);
    final picture = recorder.endRecording();
    final image = await picture.toImage(32, 32);
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    final list = bytes!.buffer.asUint8List();
    final blob = html.Blob([list], 'image/png');
    return html.Url.createObjectUrl(blob);
  }

  static const _primary = Color(0xFF3736AE);
  static const _dark    = Color(0xFF23228A);
  static const _faded   = Color(0x883736AE);

  // Default arrow
  static void _drawDefault(Canvas c, Size s) {
    final fill = Paint()..color = _primary;
    final stroke = Paint()
      ..color = _dark
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeJoin = StrokeJoin.round;
    final path = Path()
      ..moveTo(4, 2)..lineTo(4, 26)..lineTo(10, 20)
      ..lineTo(14, 29)..lineTo(18, 27)..lineTo(14, 18)
      ..lineTo(23, 18)..close();
    c.drawPath(path, fill);
    c.drawPath(path, stroke);
  }

  // Hover (inverted + diamond)
  static void _drawHover(Canvas c, Size s) {
    final fill = Paint()..color = _dark;
    final stroke = Paint()
      ..color = _primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeJoin = StrokeJoin.round;
    final arrow = Path()
      ..moveTo(4, 2)..lineTo(4, 26)..lineTo(10, 20)
      ..lineTo(14, 29)..lineTo(18, 27)..lineTo(14, 18)
      ..lineTo(23, 18)..close();
    c.drawPath(arrow, fill);
    c.drawPath(arrow, stroke);
    final diamond = Path()
      ..moveTo(26, 4)..lineTo(29, 7)
      ..lineTo(26, 10)..lineTo(23, 7)..close();
    c.drawPath(diamond, Paint()..color = _primary);
    c.drawPath(diamond, stroke);
  }

  // Text I-beam with diamond
  static void _drawText(Canvas c, Size s) {
    final p = Paint()
      ..color = _primary
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    c.drawLine(const Offset(16, 4),  const Offset(16, 28), p);
    c.drawLine(const Offset(12, 4),  const Offset(20, 4),  p);
    c.drawLine(const Offset(12, 28), const Offset(20, 28), p);
    final gem = Path()
      ..moveTo(16, 13)..lineTo(19, 16)
      ..lineTo(16, 19)..lineTo(13, 16)..close();
    c.drawPath(gem, Paint()..color = _dark);
    c.drawPath(gem, p..color = _dark);
  }

  // Wait: faded arrow + two cascading diamonds
  static void _drawWait(Canvas c, Size s) {
    final arrow = Path()
      ..moveTo(4, 2)..lineTo(4, 26)..lineTo(10, 20)
      ..lineTo(14, 29)..lineTo(18, 27)..lineTo(14, 18)
      ..lineTo(23, 18)..close();
    c.drawPath(arrow, Paint()..color = _faded);
    final d1 = Path()
      ..moveTo(22, 11)..lineTo(26, 15)
      ..lineTo(22, 19)..lineTo(18, 15)..close();
    c.drawPath(d1, Paint()..color = _primary);
    final d2 = Path()
      ..moveTo(25, 11)..lineTo(29, 15)
      ..lineTo(25, 19)..lineTo(21, 15)..close();
    c.drawPath(d2, Paint()..color = _dark);
  }
}