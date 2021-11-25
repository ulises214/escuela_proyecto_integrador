part of './theme.dart';

const kColorDarkPurple = Color(0XFF141029);
const kColorFawn = Color(0XFFE9A469);
const kColorFawnLight = Color(0xFFFBF6F0);
const kColorFulvous = Color(0XFFE48622);
const kColorGhostWhite = Color(0XFFF7F8FD);
const kColorSilverMetalic = Color(0xFFB0AFB4);
const kColorWhite = Color(0XFFFFFFFF);
const kColorXiketic = Color(0XFF070614);
const kTokenMainGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0.1, 0.3, 0.6, 0.95],
  colors: [
    kColorFulvous,
    kColorFawn,
    kColorFulvous,
    kColorFawn,
  ],
);
const kTokenPageGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [kColorFawnLight, kColorFawn],
);
