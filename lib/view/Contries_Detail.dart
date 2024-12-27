import 'package:covid19/view/World_States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountriesDetails extends StatelessWidget {
  String? image;
  String? name;
  int? todayCases,
      deaths,
      recovered,
      todayRecovered,
      active,
      critical,
      cases,
      tests;
  CountriesDetails(
      {Key? key,
      required this.active,
      required this.critical,
      required this.deaths,
      required this.image,
      required this.name,
      required this.recovered,
      required this.tests,
      required this.todayCases,
      required this.todayRecovered,
      required this.cases})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(name.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150.h,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            buildRow(
                                text: 'Total Cases:', value: cases.toString()),
                            SizedBox(
                              height: 20.h,
                            ),
                            buildRow(
                                text: 'Recovered:',
                                value: recovered.toString()),
                            SizedBox(
                              height: 20.h,
                            ),
                            buildRow(text: 'Deaths:', value: deaths.toString()),
                            SizedBox(
                              height: 20.h,
                            ),
                            buildRow(
                                text: 'Critical:', value: critical.toString()),
                            SizedBox(
                              height: 20.h,
                            ),
                            buildRow(
                                text: 'TodayCases:',
                                value: todayCases.toString()),
                            SizedBox(
                              height: 20.h,
                            ),
                            buildRow(text: 'Active:', value: active.toString()),
                            SizedBox(
                              height: 20.h,
                            ),
                            buildRow(text: 'Tests:', value: tests.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 40.r,
                    backgroundImage: NetworkImage(
                      image.toString(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
