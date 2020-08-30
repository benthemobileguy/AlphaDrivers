import 'package:alpha_drivers/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class SideListTile extends StatefulWidget {
  final String title;
  final Icon leadingIcon;
  final String tripNumber;
  final String shopperOrders;
  final String totalEarning;
  final String stores;
  final String customers;
  final Function onPressed;
  final Function btnFunction;
  SideListTile({
    this.title,
    this.leadingIcon,
    this.btnFunction,
    this.onPressed,
    this.shopperOrders,
    this.totalEarning,
    this.stores,
    this.customers,
    this.tripNumber});
  @override
  _SideListTileState createState() => _SideListTileState();
}

class _SideListTileState extends State<SideListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          color: Colors.grey.withOpacity(0.5),
          height: 1,
        ),
        ListTile(
          leading: widget.leadingIcon,
          trailing: Icon(Mdi.chevronRight,
            color: HexColor("#817889"),),
          title:Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 16,
              fontFamily: 'Montserrat',
              color: HexColor("#241332"),
            ),
          ),
          onTap: widget.onPressed,
        ),
      ],
    );
  }
}
