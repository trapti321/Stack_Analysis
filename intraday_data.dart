class IntradayScreenerData {
  String? symbol;
  double? ltp;
  double? open;
  double? high;
  double? low;
  double? close;
  double? change;
  double? pctChange;
  String? openHighLowSignal;
  AllScans? allScans;
  double? volumePctChange;
  double? oiPctChange;
  double? stockOutperformanceRank;
  double? stockMomentumRank;
  bool? negativeSectorMomentumFlag;
  double? sectorMomentumRank;
  double? sectorTodayRank;
  bool? negativeMomentumFlag;
  double? positiveFnoMomentumRank;
  double? negativeFnoMomentumRank;
  double? negativeMomentumRank;
  double? positiveMomentumRank;
  bool? prb;
  bool? fno;
  bool? nifty;
  bool? nifty500;
  bool? banknifty;

  IntradayScreenerData(
      {this.symbol,
        this.ltp,
        this.open,
        this.high,
        this.low,
        this.close,
        this.change,
        this.pctChange,
        this.openHighLowSignal,
        this.allScans,
        this.volumePctChange,
        this.oiPctChange,
        this.stockOutperformanceRank,
        this.stockMomentumRank,
        this.negativeSectorMomentumFlag,
        this.sectorMomentumRank,
        this.sectorTodayRank,
        this.negativeMomentumFlag,
        this.positiveFnoMomentumRank,
        this.negativeFnoMomentumRank,
        this.negativeMomentumRank,
        this.positiveMomentumRank,
        this.prb,
        this.fno,
        this.nifty,
        this.nifty500,
        this.banknifty});

  IntradayScreenerData.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    ltp = json['ltp'];
    open = json['open'];
    high = json['high'];
    low = json['low'];
    close = json['close'];
    change = json['change'];
    pctChange = json['pctChange'];
    openHighLowSignal = json['openHighLowSignal'];
    allScans = json['allScans'] != null
        ? new AllScans.fromJson(json['allScans'])
        : null;
    volumePctChange = json['volumePctChange'];
    oiPctChange = json['oiPctChange'];
    stockOutperformanceRank = json['stockOutperformanceRank'];
    stockMomentumRank = json['stockMomentumRank'];
    negativeSectorMomentumFlag = json['negativeSectorMomentumFlag'];
    sectorMomentumRank = json['sectorMomentumRank'];
    sectorTodayRank = json['sectorTodayRank'];
    negativeMomentumFlag = json['negativeMomentumFlag'];
    positiveFnoMomentumRank = json['positiveFnoMomentumRank'];
    negativeFnoMomentumRank = json['negativeFnoMomentumRank'];
    negativeMomentumRank = json['negativeMomentumRank'];
    positiveMomentumRank = json['positiveMomentumRank'];
    prb = json['prb'];
    fno = json['fno'];
    nifty = json['nifty'];
    nifty500 = json['nifty500'];
    banknifty = json['banknifty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['ltp'] = this.ltp;
    data['open'] = this.open;
    data['high'] = this.high;
    data['low'] = this.low;
    data['close'] = this.close;
    data['change'] = this.change;
    data['pctChange'] = this.pctChange;
    data['openHighLowSignal'] = this.openHighLowSignal;
    if (this.allScans != null) {
      data['allScans'] = this.allScans!.toJson();
    }
    data['volumePctChange'] = this.volumePctChange;
    data['oiPctChange'] = this.oiPctChange;
    data['stockOutperformanceRank'] = this.stockOutperformanceRank;
    data['stockMomentumRank'] = this.stockMomentumRank;
    data['negativeSectorMomentumFlag'] = this.negativeSectorMomentumFlag;
    data['sectorMomentumRank'] = this.sectorMomentumRank;
    data['sectorTodayRank'] = this.sectorTodayRank;
    data['negativeMomentumFlag'] = this.negativeMomentumFlag;
    data['positiveFnoMomentumRank'] = this.positiveFnoMomentumRank;
    data['negativeFnoMomentumRank'] = this.negativeFnoMomentumRank;
    data['negativeMomentumRank'] = this.negativeMomentumRank;
    data['positiveMomentumRank'] = this.positiveMomentumRank;
    data['prb'] = this.prb;
    data['fno'] = this.fno;
    data['nifty'] = this.nifty;
    data['nifty500'] = this.nifty500;
    data['banknifty'] = this.banknifty;
    return data;
  }
}

class AllScans {
  String? symbol;
  List<IntradayScans>? intradayScans;
  String? eodScans;

  AllScans({this.symbol, this.intradayScans, this.eodScans});

  AllScans.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    if (json['intradayScans'] != null) {
      intradayScans = <IntradayScans>[];
      json['intradayScans'].forEach((v) {
        intradayScans!.add(new IntradayScans.fromJson(v));
      });
    }
    eodScans = json['eodScans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    if (this.intradayScans != null) {
      data['intradayScans'] =
          this.intradayScans!.map((v) => v.toJson()).toList();
    }
    data['eodScans'] = this.eodScans;
    return data;
  }
}

class IntradayScans {
  String? symbol;
  String? timeframe;
  String? scanName;
  String? scanFullName;
  String? scanShortcode;
  String? isBoBd;
  double? level;
  String? time;

  IntradayScans(
      {this.symbol,
        this.timeframe,
        this.scanName,
        this.scanFullName,
        this.scanShortcode,
        this.isBoBd,
        this.level,
        this.time});

  IntradayScans.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    timeframe = json['timeframe'];
    scanName = json['scanName'];
    scanFullName = json['scanFullName'];
    scanShortcode = json['scanShortcode'];
    isBoBd = json['isBoBd'];
    level = json['level'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['timeframe'] = this.timeframe;
    data['scanName'] = this.scanName;
    data['scanFullName'] = this.scanFullName;
    data['scanShortcode'] = this.scanShortcode;
    data['isBoBd'] = this.isBoBd;
    data['level'] = this.level;
    data['time'] = this.time;
    return data;
  }
}
