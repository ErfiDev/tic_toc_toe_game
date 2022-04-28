import 'package:tic_toc_toe/classes/infoType.dart';

bool boardChecker(List<InfoType> b, int index) {
  bool s = false;

  for (var i in b) {
    if (i.index == index) {
      s = true;
      break;
    } else {
      s = false;
    }
  }

  return s;
}
