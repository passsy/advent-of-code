import 'package:seven_segment_display/seven_segment_display.dart';

String displayInConsole(List<SevenSegmentPanel> panels) {
  final sb = StringBuffer();
  for (var line = 0; line < 3; line++) {
    for (final digit in panels) {
      final lines = displaySingleInConsole(digit).split("\n");
      sb.write(lines[line]);
    }
    sb.write("\n");
  }
  return sb.toString();
}

String displaySingleInConsole(SevenSegmentPanel panel) {
  final sb = StringBuffer();
  // line 1
  if (panel.isActivated(Segment.top)) {
    sb.writeln(" _ ");
  } else {
    sb.writeln("   ");
  }

  // line 2
  if (panel.isActivated(Segment.topLeft)) {
    sb.write("|");
  } else {
    sb.write(" ");
  }
  if (panel.isActivated(Segment.middle)) {
    sb.write("_");
  } else {
    sb.write(" ");
  }
  if (panel.isActivated(Segment.topRight)) {
    sb.write("|");
  } else {
    sb.write(" ");
  }
  sb.write("\n");

  // line 3
  if (panel.isActivated(Segment.bottomLeft)) {
    sb.write("|");
  } else {
    sb.write(" ");
  }
  if (panel.isActivated(Segment.bottom)) {
    sb.write("_");
  } else {
    sb.write(" ");
  }
  if (panel.isActivated(Segment.bottomRight)) {
    sb.write("|");
  } else {
    sb.write(" ");
  }

  return sb.toString();
}
