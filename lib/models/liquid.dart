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

  getLiqAAmount(
    num aRaito,
    num bRaito,
    num mixedAmount,
    num mixedRaito,
  ) {
    //食塩濃度10％の食塩水Aと食塩濃度20％の食塩水Bを混ぜ合わせて
    //食塩濃度15％の食塩水Cを200ml作る時のAの必要な容量を教えて。途中計算式も。

    //0.1x+0.2(200－x)=0.15・200

    // (aRaito * aAmount) + (bRaito * ( mixedAmount - aAmount)) = mixedRaito * mixedAmount;
    //  (aRaito * aAmount) + bRaito * miedAmount - bRaito * aAmount = mixedRaito * mixedAmount;
    // (aRaito * aAmount) - (bRaito * aAmount) = (mixedRaito * mixedAmount) - (bRaito * miedAmount);
    // aAmount(aRaito - bRaito) = (mixedRaito * mixedAmount) - (bRaito * miedAmount);
    // aAmount = ((mixedRaito * mixedAmount) - (bRaito * miedAmount))/(aRaito - bRaito);

    return ((mixedRaito * mixedAmount) - (bRaito * mixedAmount)) /
        (aRaito - bRaito);
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
