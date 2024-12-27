import 'package:covid19/Services/States_Services.dart';
import 'package:covid19/view/Contries_Detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController SearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // object
    final statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: SearchController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r)),
                  hintText: 'Search with country Name'),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: FutureBuilder(
                future: StatesServices().countriesListAPi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      //physics: const NeverScrollableScrollPhysics(),
                      itemCount: 12,
                      scrollDirection: Axis.vertical,
                      //shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Container(
                                    color: Colors.white,
                                    height: 10.h,
                                    width: 90.w,
                                  ),
                                  subtitle: Container(
                                    color: Colors.white,
                                    height: 10.h,
                                    width: 90.w,
                                  ),
                                  leading: Container(
                                    color: Colors.white,
                                    height: 50.h,
                                    width: 50.w,
                                  ),
                                ),
                              ],
                            ));
                      },
                    );
                  } else {
                    return ListView.builder(
                      // shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      scrollDirection: Axis.vertical,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index]['country'];
                        final data = snapshot.data![index];
                        if (SearchController.text.isEmpty) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CountriesDetails(
                                            active: data['active'],
                                            critical: data['critical'],
                                            deaths: data['deaths'],
                                            image: data['countryInfo']['flag'],
                                            name: data['country'],
                                            recovered: data['recovered'],
                                            tests: data['tests'],
                                            todayCases: data['todayCases'],
                                            todayRecovered: snapshot
                                                .data![index]['todayRecovered'],
                                            cases: data['cases']),
                                      ));
                                },
                                child: ListTile(
                                  leading: Image.network(
                                    data['countryInfo']['flag'],
                                    height: 40.h,
                                    width: 40.w,
                                  ),
                                  title: Text(data['country']),
                                  subtitle: Text(data['cases'].toString()),
                                ),
                              )
                            ],
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(SearchController.text.toLowerCase())) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CountriesDetails(
                                            active: data['active'],
                                            critical: data['critical'],
                                            deaths: data['deaths'],
                                            image: data['countryInfo']['flag'],
                                            name: data['country'],
                                            recovered: data['recovered'],
                                            tests: data['tests'],
                                            todayCases: data['todayCases'],
                                            todayRecovered:
                                                data['todayRecovered'],
                                            cases: data['cases']),
                                      ));
                                },
                                child: ListTile(
                                  leading: Image.network(
                                    data['countryInfo']['flag'],
                                    height: 40.h,
                                    width: 40.w,
                                  ),
                                  title: Text(data['country']),
                                  subtitle: Text(data['cases'].toString()),
                                ),
                              )
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
