import 'package:flutter/material.dart';
import 'package:vape_room/models/liquid.dart';
import 'package:vape_room/widgets/help_button.dart';

class MixPage extends StatefulWidget {
  const MixPage({Key? key}) : super(key: key);

  @override
  State<MixPage> createState() => _MixPageState();
}

class _MixPageState extends State<MixPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black87,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const Text('Mix'),
          bottom: TabBar(
            labelColor: Theme.of(context).colorScheme.primary,
            tabs: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.science_outlined),
                  Icon(Icons.local_drink),
                  Icon(Icons.local_drink),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.local_drink),
                  Icon(Icons.local_drink),
                ],
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TabBarViewA(),
            TabBarViewB(),
          ],
        ),
      ),
    );
  }
}

class TabBarViewA extends StatelessWidget {
  const TabBarViewA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Liquid resultLiq = goastLiqMixed;

    return ListView(
      children: [
        const ListTile(
          dense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          title: Text(
              '空の詰め替えボトルに２つのリキッドを混ぜ合わせて入れる場合のそれぞれのリキッドの必要な量を計算します。作成したい容量とニコチン濃度が決まっている必要があります。'),
          subtitle: Text('* 必須項目'),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.all(12),
              title: LiqCardTitle(
                cardTitle: '作成したいリキッド',
                icon: Icon(
                  Icons.science,
                  color: Colors.purple,
                ),
              ),
              subtitle: AmoutAndNicoFields(),
            ),
          ),
        ),
        const LiqCard(
          cardTitle: 'First Liquid',
          flavorHint: 'ex) peach flavor',
          nicotineHint: '0',
          pgHint: '70',
          vgHint: '30',
          icon: Icon(
            Icons.water_drop,
            color: Colors.red,
          ),
        ),
        const LiqCard(
          cardTitle: 'Second Liquid',
          flavorHint: 'ex) nicotin liquid',
          nicotineHint: '10',
          pgHint: '50',
          vgHint: '50',
          icon: Icon(
            Icons.water_drop,
            color: Colors.blue,
          ),
        ),
        ResultCard(resultLiq: resultLiq)
      ],
    );
  }
}

class ResultCard extends StatelessWidget {
  const ResultCard({
    Key? key,
    required this.resultLiq,
  }) : super(key: key);

  final Liquid resultLiq;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      child: Card(
        elevation: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Result',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            resultLiq.liqA != null
                ? LiqInfo(
                    liq: resultLiq.liqA!,
                    title: '注入するリキッド',
                    icon: const Icon(
                      Icons.colorize,
                      color: Colors.red,
                    ),
                  )
                : const Text('必須項目が入力されていません'),
            Center(
                child: Text(
              '+',
              style: TextStyle(color: Theme.of(context).disabledColor),
            )),
            resultLiq.liqB != null
                ? LiqInfo(
                    liq: resultLiq.liqB!,
                    title: 'ボトルに入っているリキッド',
                    icon: const Icon(
                      Icons.local_drink,
                      color: Colors.blue,
                    ),
                  )
                : const Text('必須項目が入力されていません'),
            Center(
                child: Text(
              '||',
              style: TextStyle(color: Theme.of(context).disabledColor),
            )),
            LiqInfo(
              liq: resultLiq,
              title: '作成されるリキッド',
              icon: const Icon(
                Icons.science,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AmoutAndNicoFields extends StatelessWidget {
  const AmoutAndNicoFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Flexible(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '* 容量/ml',
              hintText: '200',
            ),
          ),
        ),
        SizedBox(width: 8),
        Flexible(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '* Nicotine/%',
              hintText: '15',
            ),
          ),
        ),
      ],
    );
  }
}

class TabBarViewB extends StatelessWidget {
  const TabBarViewB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Liquid resultLiq = goastLiqMixed;
    return ListView(children: [
      const ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        title: Text(
            '中身の入っている片方のボトルにもう一方のリキッドを注入する場合の注入リキッド量を計算します。作成したいニコチン濃度が決まっている必要があります。'),
        subtitle: Text('* 必須項目'),
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.all(12),
            title: LiqCardTitle(
              cardTitle: '作成したいリキッド',
              icon: Icon(
                Icons.science,
                color: Colors.purple,
              ),
            ),
            subtitle: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '* Nicotine/%',
                hintText: '15',
              ),
            ),
          ),
        ),
      ),
      const LiqCard(
        cardTitle: '注入するリキッド',
        flavorHint: 'nicotin liquid',
        nicotineHint: '10',
        pgHint: '70',
        vgHint: '30',
        icon: Icon(
          Icons.colorize,
          color: Colors.red,
        ),
      ),
      const LiqCard(
        cardTitle: 'ボトルに入っているリキッド',
        flavorHint: 'peach liquid',
        nicotineHint: '0',
        pgHint: '50',
        vgHint: '50',
        amountHint: 200,
        icon: Icon(
          Icons.local_drink,
          color: Colors.blue,
        ),
      ),
      const Divider(),
      ResultCard(resultLiq: resultLiq)
    ]);
  }
}

class LiqInfo extends StatelessWidget {
  const LiqInfo({
    Key? key,
    required this.liq,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final Liquid liq;
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(12),
          title: LiqCardTitle(cardTitle: title, icon: icon),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Flavor : ${liq.flavor ?? 'No name Flavor'}'),
                Text(
                    'Origin Liquids : ${liq.liqA?.flavor ?? '-'} + ${liq.liqB?.flavor ?? '-'}'),
                Text('Amount : ${liq.amount} ml'),
                Text('Nico Raito : ${liq.nicoRaito} %'),
                Text('PG : ${liq.pgRaito == null ? '-' : liq.pgRaito!} %'),
                Text(
                    'VG : ${liq.pgRaito == null ? '-' : 100 - liq.pgRaito!} %'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LiqCard extends StatelessWidget {
  final String cardTitle;
  final String flavorHint;
  final String nicotineHint;
  final String pgHint;
  final String vgHint;
  final Icon icon;
  final double? amountHint;

  const LiqCard({
    Key? key,
    required this.cardTitle,
    required this.flavorHint,
    required this.nicotineHint,
    required this.pgHint,
    required this.vgHint,
    required this.icon,
    this.amountHint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        child: ListTile(
          dense: true,
          contentPadding: const EdgeInsets.all(12),
          isThreeLine: true,
          title: LiqCardTitle(icon: icon, cardTitle: cardTitle),
          subtitle: LiqCardContents(
            flavorHint: flavorHint,
            nicotineHint: nicotineHint,
            pgHint: pgHint,
            vgHint: vgHint,
            amountHint: amountHint,
          ),
        ),
      ),
    );
  }
}

class LiqCardContents extends StatelessWidget {
  const LiqCardContents({
    Key? key,
    required this.flavorHint,
    required this.nicotineHint,
    required this.pgHint,
    required this.vgHint,
    this.amountHint,
  }) : super(key: key);

  final String flavorHint;
  final String nicotineHint;
  final String pgHint;
  final String vgHint;
  final double? amountHint;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Flavor',
              hintText: flavorHint,
            ),
          ),
        ),
        if (amountHint != null) const AmoutAndNicoFields(),
        if (amountHint != null) const SizedBox(height: 8),
        Row(
          children: [
            if (amountHint == null)
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: '* Nicotine/%',
                    hintText: nicotineHint,
                  ),
                ),
              ),
            if (amountHint == null) const SizedBox(width: 8),
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'PG/%',
                  hintText: pgHint,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'VG/%',
                  hintText: vgHint,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LiqCardTitle extends StatelessWidget {
  const LiqCardTitle({
    Key? key,
    required this.cardTitle,
    required this.icon,
    this.titleStyle,
    this.showSaveButton,
  }) : super(key: key);

  final String cardTitle;
  final Icon icon;
  final TextStyle? titleStyle;
  final bool? showSaveButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Text(
          cardTitle,
          style: titleStyle,
        ),
        const Spacer(),
        if (showSaveButton == null || showSaveButton == true)
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
              minimumSize: MaterialStateProperty.all(Size.zero),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text('保存'),
          ),
        if (showSaveButton == null || showSaveButton == true)
          HelpButton(onPressed: () {}),
      ],
    );
  }
}
