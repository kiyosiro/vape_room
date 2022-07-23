class Liquid {
  String? flavor;
  Liquid? liqA;
  Liquid? liqB;
  num amount;
  num nicoRaito;
  num? pgRaito;

  Liquid({
    this.flavor,
    this.liqA,
    this.liqB,
    required this.amount,
    required this.nicoRaito,
    this.pgRaito,
  });
}

calcAmountFromRaitoAndAmount({
  required num aRaito,
  required num bRaito,
  required num mixedAmount,
  required num mixedRaito,
}) {
  // (aRaito * aAmount) + (bRaito * ( mixedAmount - aAmount)) = mixedRaito * mixedAmount;
  //  (aRaito * aAmount) + bRaito * miedAmount - bRaito * aAmount = mixedRaito * mixedAmount;
  // (aRaito * aAmount) - (bRaito * aAmount) = (mixedRaito * mixedAmount) - (bRaito * miedAmount);
  // aAmount(aRaito - bRaito) = (mixedRaito * mixedAmount) - (bRaito * miedAmount);
  // aAmount = ((mixedRaito * mixedAmount) - (bRaito * miedAmount))/(aRaito - bRaito);

  return ((mixedRaito * mixedAmount) - (bRaito * mixedAmount)) /
      (aRaito - bRaito);
}

calcPouringAmountfromRaito({
  required num mixedRaito,
  required num pouringRaito,
  required num originAmount,
  required num originRaito,
}) {
  // (pouringRaito * pouringAmount) + (originRaito * originAmount) = mixedRaito * (pouringAmount + originAmount)
  // (pouringRaito * pouringAmount) = mixedRaito * (pouringAmount + originAmount) - (originRaito * originAmount)
  // (pouringRaito * pouringAmount) = (mixedRaito * pouringAmount) + (mixedRaito * originAmount) - (originRaito * originAmount)
  // (pouringRaito * pouringAmount) - (mixedRaito * pouringAmount) = (mixedRaito * originAmount) - (originRaito * originAmount)
  // pouringAmount * (PouringRaito - mixedRaito) = (mixedRaito * originAmount) - (originRaito * originAmount)
  // pouringAmount * (PouringRaito - mixedRaito) = originAmount(mixedRaito - originRaito)
  // pouringAmount = originAmount(mixedRaito - originRaito) /(PouringRaito - mixedRaito)

  return (originAmount * (mixedRaito - originRaito)) /
      (pouringRaito - mixedRaito);
}

calcMixedPgRaito({
  required num aPgRaito,
  required num bPgRaito,
  required num aAmount,
  required num bAmount,
}) {
  // (aAmount + bAmount) * mixedRaito = (aAmount * aPgRaito) + (bAmount * bPgRaito)
  // mixedRaito = ((aAmount * aPgRaito) + (bAmount * bPgRaito) )/(aAmount + bAmount)
  return ((aAmount * aPgRaito) + (bAmount * bPgRaito)) / (aAmount + bAmount);
}

mixAndGetLiqFromRaitoAndAmount(
  num aRaito,
  num bRaito,
  num mixedAmount,
  num mixedRaito,
  String aFlavor,
  String bFlavor,
  num aPgRaito,
  num bPgRaito,
) {
  final aAmount = calcAmountFromRaitoAndAmount(
    aRaito: aRaito,
    bRaito: bRaito,
    mixedAmount: mixedAmount,
    mixedRaito: mixedRaito,
  );
  final mixedPgRaito = calcMixedPgRaito(
    aPgRaito: aPgRaito,
    bPgRaito: bPgRaito,
    aAmount: aAmount,
    bAmount: (mixedAmount - aAmount),
  );

  return Liquid(
    amount: mixedAmount,
    nicoRaito: mixedRaito,
    flavor: '$aFlavor & $bFlavor',
    pgRaito: mixedPgRaito,
    liqA: Liquid(
      amount: aAmount,
      nicoRaito: aRaito,
      flavor: aFlavor,
      pgRaito: aPgRaito,
    ),
    liqB: Liquid(
      amount: (mixedAmount - aAmount),
      nicoRaito: bRaito,
      flavor: bFlavor,
      pgRaito: bPgRaito,
    ),
  );
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
