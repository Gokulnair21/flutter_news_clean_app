import 'package:flutter/cupertino.dart';

extension SizedBoxExtra on SizedBox {
  SizedBox verticalGap(double value) {
    return SizedBox(
      height: value,
    );
  }

  SizedBox horizontalGap(double value) {
    return SizedBox(
      width: value,
    );
  }
}
