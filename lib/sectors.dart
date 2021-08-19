import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Sectors extends StatefulWidget {
  @override
  _SectorsState createState() => _SectorsState();
}

class _SectorsState extends State<Sectors> {
  var sectors = [
    ['Energy', Icons.eco, 20],
    ['Basic', Icons.radio_button_checked, -20],
    ['Industry', Icons.science, 20],
    ['Consumer Non-Cyclicals', Icons.shopping_cart, -20],
    ['Consumer Cyclicals', Icons.store, 20],
    ['Healthcare', Icons.business, -20],
    ['Financial', Icons.emoji_transportation, 20],
    ['Properties & Real Estate', Icons.account_balance_wallet, -20],
    ['Technology', Icons.sync, 20],
    ['Infrastructure', Icons.emoji_transportation, 20],
    ['Listed Investment Products', Icons.account_balance_wallet, -20],
    ['Transportation & Logistics', Icons.sync, 20],
  ];

  Widget sectorCard({String sector, IconData icon, int change, int price}) {
    return NeumorphicButton(
      onPressed: () {
        print(sectors[0][0]);
      },
      style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Neumorphic(
              padding: EdgeInsets.all(10),
              style: NeumorphicStyle(
                  depth: -10, boxShape: NeumorphicBoxShape.circle()),
              child: Icon(
                icon,
                color: Colors.indigo,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              sector == null ? 'Sector' : sector,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
            ),
          ),
          Expanded(
              flex: 2,
              child: Text(
                price.toString(),
                style: TextStyle(
                    color: price < 0 ? Colors.red : Colors.green,
                    fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: NeumorphicAppBar(
              title: NeumorphicText(
                'Sectors',
                style: NeumorphicStyle(
                  depth: 5,
                  color: Colors.indigo,
                ),
                textStyle: NeumorphicTextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              buttonStyle: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 5,
                  color: Colors.grey[350]),
              iconTheme: IconThemeData(
                color: Colors.black45,
                size: 18,
              ),
              buttonPadding: EdgeInsets.all(0),
              actions: [],
            ),
            preferredSize: Size.fromHeight(80.0)),
        body: Container(
          padding: EdgeInsets.all(15),
          height: MediaQuery.maybeOf(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        flex: 8,
                        child: sectorCard(
                            sector: sectors[0][0],
                            icon: sectors[0][1],
                            price: sectors[0][2])),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                        flex: 8,
                        child: sectorCard(
                            sector: sectors[1][0],
                            icon: sectors[1][1],
                            price: sectors[1][2])),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                        flex: 8,
                        child: sectorCard(
                            sector: sectors[2][0],
                            icon: sectors[2][1],
                            price: sectors[2][2])),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        flex: 8,
                        child: sectorCard(
                            sector: sectors[3][0],
                            icon: sectors[3][1],
                            price: sectors[3][2])),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                        flex: 8,
                        child: sectorCard(
                            sector: sectors[4][0],
                            icon: sectors[4][1],
                            price: sectors[4][2])),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                        flex: 8,
                        child: sectorCard(
                            sector: sectors[5][0],
                            icon: sectors[5][1],
                            price: sectors[5][2])),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        flex: 8,
                        child: sectorCard(
                            sector: sectors[6][0],
                            icon: sectors[6][1],
                            price: sectors[6][2])),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                        flex: 8,
                        child: sectorCard(
                            sector: sectors[7][0],
                            icon: sectors[7][1],
                            price: sectors[7][2])),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                        flex: 8,
                        child: sectorCard(
                            sector: sectors[8][0],
                            icon: sectors[8][1],
                            price: sectors[8][2])),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        flex: 8,
                        child: sectorCard(
                            sector: sectors[9][0],
                            icon: sectors[9][1],
                            price: sectors[9][2])),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                        flex: 8,
                        child: sectorCard(
                            sector: sectors[10][0],
                            icon: sectors[10][1],
                            price: sectors[10][2])),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                        flex: 8,
                        child: sectorCard(
                            sector: sectors[11][0],
                            icon: sectors[11][1],
                            price: sectors[11][2])),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
