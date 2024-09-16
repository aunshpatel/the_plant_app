import 'package:flutter/material.dart';

const kTextTitleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold
);

const kGoldTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: Color(0XFFFFD700),
);

const kHeaderStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const kSelectedPlantSizeText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const kUnselectedPlantSizeText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Color(0XFF919191),
);

var kUnselectedPlantSizeButton = BoxDecoration(
  border: Border.all(width: 2.0, color: Color(0XFFF4F4F4)),
  borderRadius: BorderRadius.circular(16),
  color: const Color(0XFFF4F4F4),
);

var kSelectedPlantSizeButton = BoxDecoration(
  border: Border.all(width: 2.0, color: Color(0XFFA58787)),
  borderRadius: BorderRadius.circular(16),
  color: const Color(0XFFA58787),
);