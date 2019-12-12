enum Segment {
  top,
  topLeft,
  topRight,
  middle,
  bottomLeft,
  bottomRight,
  bottom,
}

class SevenSegmentPanel {
  List<Segment> get activatedSegments => List.unmodifiable(_activatedSegments);
  List<Segment> _activatedSegments = [];

  SevenSegmentPanel(int n) {
    display(n);
  }

  void display(int n) {
    switch (n) {
      case 0:
        _activatedSegments = [
          Segment.top,
          Segment.topLeft,
          Segment.topRight,
          Segment.bottomLeft,
          Segment.bottomRight,
          Segment.bottom,
        ];
        break;
      case 1:
        _activatedSegments = [
          Segment.topRight,
          Segment.bottomRight,
        ];
        break;
      case 2:
        _activatedSegments = [
          Segment.top,
          Segment.topRight,
          Segment.middle,
          Segment.bottomLeft,
          Segment.bottom,
        ];
        break;
      case 3:
        _activatedSegments = [
          Segment.top,
          Segment.topRight,
          Segment.middle,
          Segment.bottomRight,
          Segment.bottom,
        ];
        break;
      case 4:
        _activatedSegments = [
          Segment.topRight,
          Segment.topLeft,
          Segment.middle,
          Segment.bottomRight,
        ];
        break;
      case 5:
        _activatedSegments = [
          Segment.top,
          Segment.topLeft,
          Segment.middle,
          Segment.bottomRight,
          Segment.bottom,
        ];
        break;
      case 6:
        _activatedSegments = [
          Segment.top,
          Segment.topLeft,
          Segment.middle,
          Segment.bottomLeft,
          Segment.bottomRight,
          Segment.bottom,
        ];
        break;
      case 7:
        _activatedSegments = [
          Segment.top,
          Segment.topRight,
          Segment.bottomRight,
        ];
        break;
      case 8:
        _activatedSegments = [
          Segment.top,
          Segment.topLeft,
          Segment.topRight,
          Segment.middle,
          Segment.bottomLeft,
          Segment.bottomRight,
          Segment.bottom,
        ];
        break;
      case 9:
        _activatedSegments = [
          Segment.top,
          Segment.topLeft,
          Segment.topRight,
          Segment.middle,
          Segment.bottomRight,
          Segment.bottom,
        ];
        break;
      default:
        throw RangeError.range(n, 0, 10);
    }
    // no duplicates
    assert(_activatedSegments.toSet().length == _activatedSegments.length);
  }
}

extension SevenSegmentPanelExt on SevenSegmentPanel {
  bool isActivated(Segment segment) => activatedSegments.contains(segment);
}
