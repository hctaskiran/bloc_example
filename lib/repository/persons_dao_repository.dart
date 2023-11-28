// ignore_for_file: avoid_print

import 'package:bloc_pattern_flutter_ornek/cubit/home_page_cubit.dart';
import 'package:bloc_pattern_flutter_ornek/entity/person.dart';
import 'package:dio/dio.dart';

class PeopleDaoRepo {
  List<Person> parseKisiCevap(dynamic data) {
    return PersonResponse.fromJson(data).people;
  }

  Future<List<Person>> fetchAllPersons() async {
    try {
      var url = "http://85.159.71.66:8080/api/persons";
      var response = await Dio().get(url);
      print(response.data.toString());
      return parseKisiCevap(response.data);
    } catch (error) {
      print("Error fetching persons: $error");
      throw Exception("Failed to fetch persons");
    }
  }

  Future<Response> addPerson(String kisiAd, String kisiTel) async {
    try {
      var url = "http://85.159.71.66:8080/api/persons";
      var data = {"kisi_ad": kisiAd, "kisi_tel": kisiTel};
      var response = await Dio().post(url, data: FormData.fromMap(data));
      print(response.toString());
      MyAppStates().isError = false;
      return response;
    } catch (error) {
      print("Error adding person: $error");
      MyAppStates().isError = true;
      throw Exception("Failed to add person");
    }
  }
}
