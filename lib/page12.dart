import 'package:flutter/material.dart';
import 'package:flutter_package_hotel/movie_list_wrapper.dart';
import 'package:flutter_package_network/remote_service.dart';

import 'package:flutter_package_network/network.dart';
import 'dart:convert';
import 'package:flutter_plugin_battery_status/flutter_plugin_battery_status.dart';
import 'dart:async';

class Page12 extends StatefulWidget {
  @override
  _Page12State createState() => _Page12State();
}

class _Page12State extends State<Page12> {
  FlutterPluginBatteryStatus batteryStatus = FlutterPluginBatteryStatus();

  StreamSubscription<String> _batteryStateSubscription;

  String _chargingStatus = 'Battery status: unknown.';

  @override
  void initState() {
    super.initState();

    Future<String> _loadAAsset() async {
      return await DefaultAssetBundle.of(context).loadString(
          'packages/flutter_package_hotel/assets/network_hotel.json');
    }

    Future getData() async {
      String jsonString = await _loadAAsset();
      final jsonResponse = json.decode(jsonString);
      Network network = new Network.fromJson(jsonResponse);

      if (RemoteService.urlDataList == null)
        RemoteService.urlDataList = new List<dynamic>();

      RemoteService.urlDataList.addAll(network.urlData);
    }

    getData();


    _batteryStateSubscription =
        batteryStatus.onBatteryStateChanged.listen((String state) {
          setState(() {
            _chargingStatus = state;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('酒店'),
      ),
      body: new ListView(
          children: <Widget>[
            Container(
                width: 160.0,
                height: 20.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'page12_1');
                  },
                  child: Text('酒店页面1'),
                )
            ),
            Container(
                width: 160.0,
                height: 20.0,
                child: RaisedButton(
                  onPressed: () {
                    getMovieList();
                  },
                  child: Text('发起网络请求'),
                )
            ),
            Container(
                width: 160.0,
                height: 20.0,
                child: Text('电池状态: $_chargingStatus'),
            )
          ]
      ),
    );
  }

  Future getMovieList() async {
    await RemoteService.instance.invoke('getMovieList',
        onSuccess: onGetMovieListSuccess,
        onFail: onNetworkFail);
  }

  void onGetMovieListSuccess(dynamic decodeBody) {
    MovieListWrapper wrapper = MovieListWrapper.fromJson(decodeBody);

    String message = wrapper.result.movieList[0].movieName;
    print(message);
  }

  void onNetworkFail(String errorMessage) {

  }
}