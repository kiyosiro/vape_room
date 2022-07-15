class Liquid {
  String? flavor;
  Liquid? liqA;
  Liquid? liqB;
  double amount;
  double nicoRaito;
  double? pgRaito;

  Liquid({
    this.flavor,
    this.liqA,
    this.liqB,
    required this.amount,
    required this.nicoRaito,
    this.pgRaito,
  });

  getLiqAAmount() {
    //必須
    return 10;
  }
}

final Liquid goastLiqMixed = Liquid(
  amount: 200,
  nicoRaito: 15,
  flavor: 'Goast Mixed',
  liqA: goastLiqOrigin,
  liqB: goastLiqOrigin,
  pgRaito: 70,
);

final Liquid goastLiqOrigin = Liquid(
  amount: 200,
  nicoRaito: 15,
  flavor: 'Goast Origin',
  pgRaito: 70,
);
