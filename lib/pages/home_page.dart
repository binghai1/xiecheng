import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xiecheng/dao/home_dao.dart';
import 'package:xiecheng/model/common_model.dart';
import 'dart:convert';

import 'package:xiecheng/model/home_model.dart';
import 'package:xiecheng/widget/local_nav.dart';
const APPBAR_SCROLL_OFFSET=100;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() { 
    super.initState();
    _loadDate();
  }
  List _imageUrls = [
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg'
  ];
  List<CommonModel> localNavList;
  double _appBarAlpha=0;
  _onScroll(offset) {
    double alpha=offset/APPBAR_SCROLL_OFFSET;
    if(alpha<0){
      alpha=0;
    }else if(alpha>1){
      alpha=1;
    }
    setState(() {
      _appBarAlpha=alpha;
    });
  }
  _loadDate() async{
      try {
        HomeModel model=await HomeDao.fetch();
        setState(() {
          print(model);
         localNavList=model.localNavList;
        });
      } catch (e) {
         setState(() {
           print(e);
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Color(0xfff2f2f2),
        body: Stack(
        children: <Widget>[
        MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth == 0) {
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 160,
                      child: Swiper(
                        itemCount: _imageUrls.length,
                        pagination: SwiperPagination(),
                        autoplay: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(_imageUrls[index],
                              fit: BoxFit.fill);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                      child: LocalNav(localNavList:localNavList),
                    ),
                    Container(
                      height: 800,
                      child: ListTile(
                        title: Text("resultString"),
                      ),
                    )
                  ],
                )
                )
                ),
                Opacity(
                  opacity: _appBarAlpha,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top:20),
                        child:Text("首页")
                      ),
                      
                    ),
                  ),
                )
      ],
    ));
  }
}
