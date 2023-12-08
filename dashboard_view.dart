import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_test/src/ui/theme/color.dart';
import 'package:web_test/src/ui/theme/styles.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_container.dart';
import 'dashboard_view_model.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({
    super.key,
  });

  @override
  Widget builder(
      BuildContext context, DashboardViewModel viewModel, Widget? child) {

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title:
            Text('Open High Low Scanner', style: AppStyle.of(context).wlabel14),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.question_mark,
              color: Colors.blue,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.grid_view,
              color: Colors.blue,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light, //// Wid
      ),
      body: Stack(children: [
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 22,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: (viewModel.onClick == true)
                                        ? Colors.blue[500]
                                        : Colors.white70,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: const Center(
                                      child: Text(
                                    'Open High + PRB',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  )),
                                ),
                              ),
                              onTap: () {
                                viewModel.ontabChanged();
                              }),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: (viewModel.onSecondClick == true)
                                        ? Colors.blue[500]
                                        : Colors.white70,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: const Center(
                                      child: Text(
                                    'Open Low + PRB',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  )),
                                ),
                              ),
                              onTap: () {
                                viewModel.ontabSecondtab();
                              }),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: (viewModel.onthirdClick == true)
                                        ? Colors.blue[500]
                                        : Colors.white70,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: const Center(
                                      child: Text(
                                    'Open Low',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  )),
                                ),
                              ),
                              onTap: () {
                                viewModel.onthirdtab();
                              }),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: (viewModel.onfourthClick == true)
                                        ? Colors.blue[500]
                                        : Colors.white70,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: const Center(
                                      child: Text(
                                    'Open High',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  )),
                                ),
                              ),
                              onTap: () {
                                viewModel.onfourthtab();
                              }),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                ]),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 1,
                  child: RefreshIndicator(
                    backgroundColor: AppColors.white,
                    color: AppColors.primary,
                    onRefresh: () => viewModel.getIntradayData(),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: viewModel.intraday_data.length,
                        itemBuilder: (BuildContext context, int index) {
                          // List<IntradayScans>? scans = viewModel.intraday_data
                          //     .elementAt(index)
                          //     .allScans!
                          //     .intradayScans;
                          return Column(children: [
                            const SizedBox(
                              height: 15,
                            ),
                            // if(viewModel.applications.length != null)
                            CustomContainer(
                              width: MediaQuery.of(context).size.width * 0.9,
                              // height: MediaQuery.of(context).size.height * 0.23,
                              widget: Padding(
                                padding: const EdgeInsets.all(9),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // if (viewModel.intraday_data.isNotEmpty &&)
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.compare_outlined,
                                              color: Colors.red,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                              "${viewModel.intraday_data.elementAt(index).symbol}",
                                              style: AppStyle.of(context)
                                                  .slabelWt),
                                          const Spacer(),
                                          viewModel.intraday_data.isNotEmpty &&
                                                  viewModel.intraday_data
                                                          .elementAt(index)
                                                          .oiPctChange! <=
                                                      0.0
                                              ? Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text("OI Ch. %",
                                                        style:
                                                            AppStyle.of(context)
                                                                .slabelG),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.arrow_drop_down,
                                                          color:
                                                              Colors.redAccent,
                                                          size: 20,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5),
                                                          child: Text(
                                                              "${viewModel.intraday_data.elementAt(index).oiPctChange}%",
                                                              style: AppStyle.of(
                                                                      context)
                                                                  .wlabel13),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              : Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("OI Ch. %",
                                                        style:
                                                            AppStyle.of(context)
                                                                .slabelG),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .arrow_drop_up_sharp,
                                                          color: Colors
                                                              .greenAccent,
                                                          size: 20,
                                                        ),
                                                        Text(
                                                            "${viewModel.intraday_data.elementAt(index).oiPctChange}%",
                                                            style: AppStyle.of(
                                                                    context)
                                                                .wlabel13),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                          const Spacer(),
                                          viewModel.intraday_data
                                                      .elementAt(index)
                                                      .change! <=
                                                  0.0
                                              ? Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text("Change %",
                                                        style:
                                                            AppStyle.of(context)
                                                                .slabelG),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.arrow_drop_down,
                                                          color:
                                                              Colors.redAccent,
                                                          size: 20,
                                                        ),
                                                        Text(
                                                            "${viewModel.intraday_data.elementAt(index).change} (${viewModel.intraday_data.elementAt(index).change})%",
                                                            style: AppStyle.of(
                                                                    context)
                                                                .wlabelR),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              : Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text("Change %",
                                                        style:
                                                            AppStyle.of(context)
                                                                .slabelG),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .arrow_drop_up_sharp,
                                                          color: Colors
                                                              .greenAccent,
                                                          size: 20,
                                                        ),
                                                        Text(
                                                            "${viewModel.intraday_data.elementAt(index).change} (${viewModel.intraday_data.elementAt(index).change})%",
                                                            style: AppStyle.of(
                                                                    context)
                                                                .wlabelGr),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                        ],
                                      ),

                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text("Today's Range",
                                                  style: AppStyle.of(context)
                                                      .slabelG),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                      "${viewModel.intraday_data.elementAt(index).open} -- ${viewModel.intraday_data.elementAt(index).low}",
                                                      style:
                                                          AppStyle.of(context)
                                                              .wlabel13),
                                                ],
                                              )
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text("MOMENTUM",
                                                  style: AppStyle.of(context)
                                                      .slabelG),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  "${viewModel.intraday_data.elementAt(index).sectorMomentumRank}",
                                                  style: AppStyle.of(context)
                                                      .wlabel13),
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text("LTP",
                                                  style: AppStyle.of(context)
                                                      .slabelG),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                      "${viewModel.intraday_data.elementAt(index).ltp}",
                                                      style:
                                                          AppStyle.of(context)
                                                              .wlabel13),
                                                  viewModel.intraday_data
                                                              .elementAt(index)
                                                              .volumePctChange! <=
                                                          0.0
                                                      ? Text(
                                                          "(${viewModel.intraday_data.elementAt(index).volumePctChange}%)",
                                                          style: AppStyle.of(
                                                                  context)
                                                              .wlabelR)
                                                      : Text(
                                                          "(${viewModel.intraday_data.elementAt(index).volumePctChange}%)",
                                                          style: AppStyle.of(
                                                                  context)
                                                              .wlabelGr),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          const Spacer(),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.green[800],
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5)),
                                            ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12,
                                                          right: 12,
                                                          top: 5,
                                                          bottom: 5),
                                                  child: Text(
                                                      "${viewModel.intraday_data.elementAt(index).openHighLowSignal}",
                                                      style:
                                                          AppStyle.of(context)
                                                              .wlabel13),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // const Spacer(),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.green[800],
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5)),
                                            ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12,
                                                          right: 12,
                                                          top: 5,
                                                          bottom: 5),
                                                  child: Text(
                                                      "${viewModel.intraday_data.elementAt(index).prb}",
                                                      style:
                                                          AppStyle.of(context)
                                                              .wlabel13),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                              ),
                            ),
                          ]);
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (viewModel.showTimestampLoader)
          Container(
            color: AppColors.loaderBgColor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppColors.secondary),
                strokeWidth: 5,
              ),
            ),
          ),
      ]),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) =>
      DashboardViewModel();
}
