import 'package:flutter/material.dart';

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
                  Icon(Icons.local_drink),
                  Icon(Icons.opacity),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.local_drink),
                  Icon(Icons.colorize),
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
    return ListView(children: [
      const ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        title: Text('作成したいリキッドの容量とニコチン濃度が決まっている場合に使用し、それぞれのリキッドの必要な量を計算します。'),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            dense: true,
            contentPadding: const EdgeInsets.all(12),
            title: Row(
              children: [
                const Icon(
                  Icons.local_drink,
                  color: Colors.deepPurple,
                ),
                const Text('作成したいリキッド'),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text('保存'),
                ),
              ],
            ),
            subtitle: const AmoutAndNicoFields(),
          ),
        ),
      ),
      const LiquidCard(
        cardTitle: 'First Liquid',
        flavorHint: 'ex) peach flavor',
        nicotineHint: '0',
        pgHint: '70',
        vgHint: '30',
        iconColor: Colors.red,
      ),
      const LiquidCard(
        cardTitle: 'Second Liquid',
        flavorHint: 'ex) nicotin liquid',
        nicotineHint: '10',
        pgHint: '50',
        vgHint: '50',
        iconColor: Colors.blue,
      ),
    ]);
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
              labelText: '容量/ml',
              hintText: '200',
            ),
          ),
        ),
        SizedBox(width: 8),
        Flexible(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nicotine/%',
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
    return ListView(children: const [
      ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        title: Text(
            '作成したい容量は決まっておらずニコチン濃度のみ決まっている際に使用し、中身の入っている片方のボトルにもう一方のリキッドを注入する際の注入リキッド量を計算します。'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.all(12),
            title: LiquidCardTitle(
              cardTitle: '作成したいリキッド',
              iconColor: Colors.purple,
            ),
            subtitle: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nicotine/%',
                hintText: '15',
              ),
            ),
          ),
        ),
      ),
      LiquidCard(
        cardTitle: '注入するリキッド',
        flavorHint: 'nicotin liquid',
        nicotineHint: '10',
        pgHint: '70',
        vgHint: '30',
        iconColor: Colors.red,
      ),
      LiquidCard(
        cardTitle: 'ボトルに入っているリキッド',
        flavorHint: 'peach liquid',
        nicotineHint: '0',
        pgHint: '50',
        vgHint: '50',
        iconColor: Colors.blue,
        amountHint: 200,
      ),
    ]);
  }
}

class LiquidCard extends StatelessWidget {
  final String cardTitle;
  final String flavorHint;
  final String nicotineHint;
  final String pgHint;
  final String vgHint;
  final Color? iconColor;
  final double? amountHint;

  const LiquidCard({
    Key? key,
    required this.cardTitle,
    required this.flavorHint,
    required this.nicotineHint,
    required this.pgHint,
    required this.vgHint,
    this.iconColor,
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
          title: LiquidCardTitle(iconColor: iconColor, cardTitle: cardTitle),
          subtitle: LiquidCardContents(
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

class LiquidCardContents extends StatelessWidget {
  const LiquidCardContents({
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
                    labelText: 'Nicotine/%',
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

class LiquidCardTitle extends StatelessWidget {
  const LiquidCardTitle({
    Key? key,
    required this.iconColor,
    required this.cardTitle,
  }) : super(key: key);

  final Color? iconColor;
  final String cardTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.water_drop, color: iconColor),
        Text(cardTitle),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text('保存'),
        ),
      ],
    );
  }
}
