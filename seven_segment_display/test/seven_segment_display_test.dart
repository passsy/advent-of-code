import 'package:seven_segment_display/seven_segment_display.dart';
import 'package:test/test.dart';

void main() {
  group('input validation', () {
    test("can't show negative numbers", () {
      expect(() => SevenSegmentPanel(-1), throwsA(isA<RangeError>()));
    });
    test("can't show numbers larger than 9 numbers", () {
      expect(() => SevenSegmentPanel(10), throwsA(isA<RangeError>()));
    });
    test("shows numbers 0-9", () {
      expect(SevenSegmentPanel(0), isNotNull);
      expect(SevenSegmentPanel(1), isNotNull);
      expect(SevenSegmentPanel(2), isNotNull);
      expect(SevenSegmentPanel(3), isNotNull);
      expect(SevenSegmentPanel(4), isNotNull);
      expect(SevenSegmentPanel(5), isNotNull);
      expect(SevenSegmentPanel(6), isNotNull);
      expect(SevenSegmentPanel(7), isNotNull);
      expect(SevenSegmentPanel(8), isNotNull);
      expect(SevenSegmentPanel(9), isNotNull);
    });
  });

  group('isActive', () {
    test("test activation of 0", () {
      final panel = SevenSegmentPanel(0);
      expect(panel.isActivated(Segment.top), isTrue);
      expect(panel.isActivated(Segment.topLeft), isTrue);
      expect(panel.isActivated(Segment.topRight), isTrue);
      expect(panel.isActivated(Segment.middle), isFalse);
      expect(panel.isActivated(Segment.bottomLeft), isTrue);
      expect(panel.isActivated(Segment.bottomRight), isTrue);
      expect(panel.isActivated(Segment.bottom), isTrue);
    });
    test("switch display 3 -> 0", () {
      final panel = SevenSegmentPanel(3);
      expect(panel.isActivated(Segment.top), isTrue);
      expect(panel.isActivated(Segment.topLeft), isFalse);
      expect(panel.isActivated(Segment.topRight), isTrue);
      expect(panel.isActivated(Segment.middle), isTrue);
      expect(panel.isActivated(Segment.bottomLeft), isFalse);
      expect(panel.isActivated(Segment.bottomRight), isTrue);
      expect(panel.isActivated(Segment.bottom), isTrue);

      panel.display(0);
      expect(panel.isActivated(Segment.top), isTrue);
      expect(panel.isActivated(Segment.topLeft), isTrue);
      expect(panel.isActivated(Segment.topRight), isTrue);
      expect(panel.isActivated(Segment.middle), isFalse);
      expect(panel.isActivated(Segment.bottomLeft), isTrue);
      expect(panel.isActivated(Segment.bottomRight), isTrue);
      expect(panel.isActivated(Segment.bottom), isTrue);
    });
  });
}
