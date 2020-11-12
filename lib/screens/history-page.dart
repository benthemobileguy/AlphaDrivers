import 'package:alpha_drivers/bloc/default.dart';
import 'package:alpha_drivers/screens/components/brand-divider.dart';
import 'package:alpha_drivers/theme/brand_colors.dart';
import 'package:cabdriver/brand_colors.dart';
import 'package:cabdriver/dataprovider.dart';
import 'package:cabdriver/widgets/BrandDivier.dart';
import 'package:cabdriver/widgets/HistoryTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trip History',
          style: TextStyle(
          fontSize: 15,
          fontFamily: 'CircularStd',
        ),),
        backgroundColor: BrandColors.colorPrimary,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(0),
        itemBuilder: (context, index) {
          return HistoryTile(
            history: Provider.of<MainBloc>(context).tripHistory[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            BrandDivider(),
        itemCount: Provider.of<MainBloc>(context).tripHistory.length,
        physics: ClampingScrollPhysics(),
        shrinkWrap:  true,
      ),
    );
  }
}