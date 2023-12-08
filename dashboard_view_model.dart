import 'package:dio/dio.dart';
import 'package:web_test/src/core/models/intraday_data.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';

import '../../../core/services/api/api_repository.dart';

class DashboardViewModel extends BaseViewModel {
  final controls = _Controls();
  List<IntradayScreenerData> intraday_data = [];
  List<IntradayScreenerData> intradayOpenHigh = [];
  bool showTimestampLoader = false;
  bool onClick = false;
  bool onSecondClick = false;
  bool onthirdClick = false;
  bool onfourthClick = false;

  late final FormGroup form;
  String customerId = "";

  DashboardViewModel() {
    getIntradayData();
    getIntradayAPI();
    initSetup();
  }

  void initSetup() async {}

  Future<void> ontabChanged() async {
    // intradayOpenHigh =
    //     intraday_data.where((e) => e.openHighLowSignal == "Open=High").toList();
    // intradayOpenHigh = intraday_data;
    onClick = true;
    onSecondClick = false;
    onthirdClick = false;
    onfourthClick = false;
    getIntradayData();
    // print("changed : ${intraday_data.first.openHighLowSignal}");
    notifyListeners();
  }

  Future<void> ontabSecondtab() async {
    // intradayOpenHigh =
    //     intraday_data.where((e) => e.openHighLowSignal == "Open=High").toList();
    // intradayOpenHigh = intraday_data;
    onSecondClick = true;
    onClick = false;
    onthirdClick = false;
    onfourthClick = false;

    getIntradayData();
    // print("changed : ${intraday_data.first.openHighLowSignal}");
    notifyListeners();
  }

  Future<void> onthirdtab() async {
    // intradayOpenHigh =
    //     intraday_data.where((e) => e.openHighLowSignal == "Open=High").toList();
    // intradayOpenHigh = intraday_data;
    onSecondClick = false;
    onClick = false;
    onthirdClick = true;
    onfourthClick = false;

    getIntradayData();
    // print("changed : ${intraday_data.first.openHighLowSignal}");
    notifyListeners();
  }

  Future<void> onfourthtab() async {
    // intradayOpenHigh =
    //     intraday_data.where((e) => e.openHighLowSignal == "Open=High").toList();
    // intradayOpenHigh = intraday_data;
    onSecondClick = false;
    onClick = false;
    onthirdClick = false;
    onfourthClick = true;
    getIntradayData();
    // print("changed : ${intraday_data.first.openHighLowSignal}");
    notifyListeners();
  }

  Future<void> getIntradayData() async {
    showTimestampLoader = true;
    notifyListeners();
    {
      List<IntradayScreenerData>? response = await getIntradayAPI();
      if (response!.first.symbol != null && response.isNotEmpty) {
        showTimestampLoader = false;
        intraday_data = response.take(6).toList();
        if (onClick == true) {
          // showTimestampLoader = false;

          intraday_data = response
              .where(
                  (e) => e.openHighLowSignal == "Open=High" && e.prb == true).take(6)
              .toList();
          print("changed : ${intraday_data.first.openHighLowSignal}");
        }
        if (onSecondClick == true) {
          // showTimestampLoader = false;

          intraday_data = response
              .where((e) => e.openHighLowSignal == "Open=Low" && e.prb == true).take(6)
              .toList();
          print("changed : ${intraday_data.first.openHighLowSignal}");
        }
        if (onthirdClick == true) {
          // showTimestampLoader = false;

          intraday_data = response
              .where((e) => e.openHighLowSignal == "Open=Low" && e.prb == false).take(6)
              .toList();
          print("changed : ${intraday_data.first.openHighLowSignal}");
        }
        if (onfourthClick == true) {
          // showTimestampLoader = false;

          intraday_data = response
              .where(
                  (e) => e.openHighLowSignal == "Open=high" && e.prb == false).take(6)
              .toList();
          print("changed : ${intraday_data.first.openHighLowSignal}");
        }
        print(intraday_data.first.symbol);
        print(intraday_data.first.ltp);
        print(intraday_data.first.low);
        notifyListeners();
      }
      else {
        showTimestampLoader = false;
        notifyListeners();
      }
    }
  }

  Future<List<IntradayScreenerData>>? getIntradayAPI() async {
    {
      Response response =
          await Dio().get('https://intradayscreener.com/api/openhighlow/cash');
      return List<IntradayScreenerData>.from(
          response.data.map((x) => IntradayScreenerData.fromJson(x)));
    }
  }
}

class _Controls {
  String get loan_type => 'loan_type';
// String get loan_amount => 'loan_amount';
}
