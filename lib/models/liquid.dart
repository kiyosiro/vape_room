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
}

calcAmountFromRaitoAndAmount(
  num aRaito,
  num bRaito,
  num mixedAmount,
  num mixedRaito,
) {
  // (aRaito * aAmount) + (bRaito * ( mixedAmount - aAmount)) = mixedRaito * mixedAmount;
  //  (aRaito * aAmount) + bRaito * miedAmount - bRaito * aAmount = mixedRaito * mixedAmount;
  // (aRaito * aAmount) - (bRaito * aAmount) = (mixedRaito * mixedAmount) - (bRaito * miedAmount);
  // aAmount(aRaito - bRaito) = (mixedRaito * mixedAmount) - (bRaito * miedAmount);
  // aAmount = ((mixedRaito * mixedAmount) - (bRaito * miedAmount))/(aRaito - bRaito);

  return ((mixedRaito * mixedAmount) - (bRaito * mixedAmount)) /
      (aRaito - bRaito);
}

calcPouringAmountfromRaito(
  num mixedRaito,
  num pouringRaito,
  num originAmount,
  num originRaito,
) {
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
