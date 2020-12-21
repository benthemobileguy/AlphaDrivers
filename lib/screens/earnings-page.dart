import 'package:alpha_drivers/theme/style.dart';
import 'package:alpha_drivers/utils/color.dart';
import 'package:flutter/material.dart';
class EarningsPage extends StatefulWidget {
  @override
  _EarningsPageState createState() => _EarningsPageState();
}

class _EarningsPageState extends State<EarningsPage> with TickerProviderStateMixin,
    AutomaticKeepAliveClientMixin{
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 22,
            ),
            color: HexColor("#CFD1D3"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text('Make Payment',
              style: TextStyle(
                color: HexColor("#282F39"),
                fontWeight: FontWeight.w700,
                fontFamily: 'CircularStd',)),
        ),
        body:  TabBar(
          controller: _tabController,
          indicatorWeight: 4,
          indicatorPadding: EdgeInsets.only(bottom: -10),
          indicatorColor: tabIndicatorColor,
          tabs: <Widget>[
            Text(
              "Materials",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'CircularStd',
                color: customGreenText,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Workers",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'CircularStd',
                color: customGreenText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
    );
  }

  void _handleTabSelection() {

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
