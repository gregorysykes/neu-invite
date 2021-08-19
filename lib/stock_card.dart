import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'stock_page.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class StockCard extends StatefulWidget {
  String stock_code;
  int stock_price;
  String stock_name;
  int change;

  StockCard({this.stock_code, this.stock_name, this.stock_price, this.change});
  @override
  _StockCardState createState() => _StockCardState();
}

class _StockCardState extends State<StockCard> {
  IconData icon;
  var color;
  var change;
  var change_value;
  var percentage = NumberFormat.decimalPercentPattern(decimalDigits: 2);
  var money = NumberFormat('#,##0', 'en_US');
  var normal = TextStyle(fontSize: 13);

  @override
  Widget build(BuildContext context) {
    change = widget.change / (widget.stock_price + widget.change);

    if (widget.change < 0) {
      change_value = widget.change * -1;
      icon = Icons.arrow_downward;
      color = Colors.red;
      change *= -1;
    } else if (widget.change == 0) {
      change_value = widget.change;
      icon = Icons.cloud_circle;
      color = Colors.grey;
    } else {
      change_value = widget.change;
      icon = Icons.arrow_upward;
      color = Colors.green;
    }

    return Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: NeumorphicButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          StockPage(code: widget.stock_code)));
            },
            style: NeumorphicStyle(
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          widget.stock_code,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      NeumorphicIcon(
                        Icons.report_outlined,
                        style: NeumorphicStyle(color: Colors.orangeAccent),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            money.format(widget.stock_price),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          alignment: Alignment.centerRight,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.maybeOf(context).size.width * 0.5,
                        child: Text(widget.stock_name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500)),
                        alignment: Alignment.centerLeft,
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Icon(
                                icon,
                                color: color,
                                size: 13,
                              ),
                              Text(
                                money.format(change_value) +
                                    ' (' +
                                    percentage.format(change) +
                                    ')',
                                style: TextStyle(color: color),
                              ),
                            ],
                          ),
                          alignment: Alignment.centerRight,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        width: MediaQuery.maybeOf(context).size.width * 0.5,
                        child: Text('23.12B @ 29,000',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),
                        alignment: Alignment.centerLeft,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            '23.12B @ 29,000',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                          alignment: Alignment.centerRight,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      // Expanded(child:
                      Container(
                        width: MediaQuery.maybeOf(context).size.width * 0.5,
                        child: Text('Bid',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style:
                                TextStyle(color: Colors.black45, fontSize: 13)),
                        alignment: Alignment.centerLeft,
                      ),
                      // ),
                      Expanded(
                        child: Container(
                          child: Text('Offer',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 13)),
                          alignment: Alignment.centerRight,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
