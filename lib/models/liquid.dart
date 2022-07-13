import 'package:flutter/material.dart';

class MixedLiquid {
  String name;
  Liquid liqA;
  Liquid liqB;
  double amount;
  double nicoRaito;

  MixedLiquid({
    required this.name,
    required this.liqA,
    required this.liqB,
    required this.amount,
    required this.nicoRaito,
  });

  getLiqAAmount() {
    //必須
    return 10;
  }
}

class Liquid {
  String name;
  double nicoRatio;
  double? pgRatio;
  double? vgRatio;

  Liquid({
    required this.name,
    required this.nicoRatio,
    this.pgRatio,
    this.vgRatio,
  });

  getLiquid() {
    return {
      'name': name,
      'nicoRatio': nicoRatio,
      'pgRatio': pgRatio,
      'vgRatio': vgRatio,
    };
  }
}
