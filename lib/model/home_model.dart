// config | Object	| NonNull
// bannerList | Array	|	NonNull
// localNavList | Array	|	NonNull
// gridNav | Object	|	NonNull
// subNavList | Array	|	NonNull
// salesBox | Object	|	NonNull
import 'package:xiecheng/model/common_model.dart';
import 'package:xiecheng/model/config_model.dart';
import 'package:xiecheng/model/grid_nav_model.dart';
import 'package:xiecheng/model/sales_box_model.dart';

class HomeModel{
  final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final GridNavModel gridNav;
  final List<CommonModel> subNavList;
  final SalesBoxModel salesBox;
  HomeModel({this.config, this.bannerList, this.localNavList, this.gridNav, this.subNavList, this.salesBox});
  factory HomeModel.fromJson(Map<String,dynamic> json){
        var localNavListJson=json['localNavList'] as List;
        List<CommonModel> localNavList=localNavListJson.map((i)=>CommonModel.fromJson(i)).toList();
        var bannerListJson=json['localNavList'] as List;
        List<CommonModel> bannerList=bannerListJson.map((i)=>CommonModel.fromJson(i)).toList();
        var subNavListJson=json['localNavList'] as List;
        List<CommonModel> subNavList=subNavListJson.map((i)=>CommonModel.fromJson(i)).toList();
        return HomeModel(
          config:ConfigModel.fromJson(json['config']),
          localNavList:localNavList,
          bannerList:bannerList,
          subNavList:subNavList,
          gridNav:GridNavModel.fromJson(json['gridNav']),
          salesBox:SalesBoxModel.fromJson(json['salesBox'])
        );
    }

   
}