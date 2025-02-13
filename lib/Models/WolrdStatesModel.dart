class WorldStatesModel {
  int? updated,
      cases,
      todayCases,
      deaths,
      todayDeaths,
      recovered,
      todayRecovered,
      active,
      critical,
      casesPerOneMillion,
      tests,
      population,
      oneCasePerPeople,
      oneDeathPerPeople,
      oneTestPerPeople,
      affectedCountries;

  double? deathsPerOneMillion,
      testsPerOneMillion,
      activePerOneMillion,
      recoveredPerOneMillion,
      criticalPerOneMillion;

  WorldStatesModel(
      {required this.active,
      required this.activePerOneMillion,
      required this.affectedCountries,
      required this.cases,
      required this.casesPerOneMillion,
      required this.critical,
      required this.criticalPerOneMillion,
      required this.deaths,
      required this.deathsPerOneMillion,
      required this.oneCasePerPeople,
      required this.oneDeathPerPeople,
      required this.oneTestPerPeople,
      required this.tests,
      required this.population,
      required this.recovered,
      required this.recoveredPerOneMillion,
      required this.testsPerOneMillion,
      required this.todayCases,
      required this.todayDeaths,
      required this.todayRecovered,
      required this.updated});

  factory WorldStatesModel.fromJson(Map json) => WorldStatesModel(
      active: json["active"],
      activePerOneMillion: json["activePerOneMillion"],
      affectedCountries: json["affectedCountries"],
      cases: json['cases'],
      casesPerOneMillion: json["casesPerOneMillion"],
      critical: json['critical'],
      criticalPerOneMillion: json["criticalPerOneMillion"],
      deaths: json['deaths'],
      deathsPerOneMillion: json["deathsPerOneMillion"],
      oneCasePerPeople: json["oneCasePerPeople"],
      oneDeathPerPeople: json["oneDeathPerPeople"],
      oneTestPerPeople: json["oneTestPerPeople"],
      tests: json["tests"],
      population: json["population"],
      recovered: json["recovered"],
      recoveredPerOneMillion: json["recoveredPerOneMillion"],
      testsPerOneMillion: json["testsPerOneMillion"],
      todayCases: json["todayCases"],
      todayDeaths: json["todayDeaths"],
      todayRecovered: json["todayRecovered"],
      updated: json["updated"]);
}
