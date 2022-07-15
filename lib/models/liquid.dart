class MixedLiquid {
  String name;
  Liquid liqA;
  Liquid liqB;
  double amount;
  double nicoRaito;
  double? pgRaito;

  MixedLiquid({
    required this.name,
    required this.liqA,
    required this.liqB,
    required this.amount,
    required this.nicoRaito,
    this.pgRaito,
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

getGoastLiq() {
  return Liquid(name: 'goast liq', nicoRatio: 10);
}

getGoastMixedLiq() {
  return MixedLiquid(
      name: 'Goast mixde',
      liqA: getGoastLiq(),
      liqB: getGoastLiq(),
      amount: 200,
      nicoRaito: 15);
}
