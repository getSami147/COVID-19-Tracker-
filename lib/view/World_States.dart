import 'package:covid19/Colors.dart';
import 'package:covid19/Models/WolrdStatesModel.dart';
import 'package:covid19/Services/States_Services.dart';
import 'package:covid19/view/CountriesList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStats extends StatefulWidget {
  const WorldStats({Key? key}) : super(key: key);

  @override
  State<WorldStats> createState() => _WorldStatsState();
}

class _WorldStatsState extends State<WorldStats> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  FutureBuilder(
                    future: statesServices.FitchWorldStatesRecord(),
                    builder:
                        (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                            child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 350.h),
                          child: const CircularProgressIndicator.adaptive(),
                        ));
                      } else {
                        return Column(
                          children: [
                            SizedBox(
                              height: 250.h,
                              width: double.infinity,
                              child: PieChart(
                                chartLegendSpacing: 80.w,
                                chartValuesOptions: const ChartValuesOptions(
                                    showChartValuesInPercentage: true),
                                chartType: ChartType.ring,
                                colorList: colorsList,
                                legendOptions: const LegendOptions(
                                    legendPosition: LegendPosition.left),
                                dataMap: {
                                  'Total': double.parse(
                                      snapshot.data!.cases.toString()),
                                  'Recoverd': double.parse(
                                      snapshot.data!.recovered.toString()),
                                  'Deths': double.parse(
                                      snapshot.data!.deaths.toString()),
                                },
                                animationDuration: const Duration(seconds: 1),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 20),
                                child: Column(
                                  children: [
                                    buildRow(
                                      text: 'Total Cases:',
                                      value: snapshot.data!.cases.toString(),
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    buildRow(
                                      text: 'Recoverd:',
                                      value:
                                          snapshot.data!.recovered.toString(),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    buildRow(
                                      text: 'Deaths:',
                                      value: snapshot.data!.deaths.toString(),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    buildRow(
                                      text: 'Active:',
                                      value: snapshot.data!.active.toString(),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    buildRow(
                                      text: 'Critical:',
                                      value: snapshot.data!.critical.toString(),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    buildRow(
                                      text: 'Today Deaths:',
                                      value:
                                          snapshot.data!.todayDeaths.toString(),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    buildRow(
                                      text: 'Today Recovered:',
                                      value: snapshot.data!.todayRecovered
                                          .toString(),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            SizedBox(
                              height: 50.h,
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      backgroundColor: const Color(0xff1aa260)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CountriesList(),
                                        ));
                                  },
                                  child: const Text('Track Countries')),
                            )
                          ],
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class buildRow extends StatelessWidget {
  String? text;
  String? value;
  buildRow({Key? key, this.text, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text.toString(),
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
          ),
          Text(
            value.toString(),
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
