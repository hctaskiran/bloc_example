// ignore_for_file: camel_case_types, avoid_print, non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:bloc_pattern_flutter_ornek/entity/person.dart';
import 'package:bloc_pattern_flutter_ornek/repository/persons_dao_repository.dart';

class HomePageCubit extends Cubit<List<Person>> {
  HomePageCubit() : super(<Person>[]);
  var personDao = PeopleDaoRepo();
  Future<void> fetchPeople() async {
    var list = await personDao.fetchAllPersons();
    // print(list);
    emit(list);
  }

  Future<void> addPerson(String person_name, String person_phone) async {
    var response = await personDao.addPerson(person_name, person_phone);
    print(response);
    fetchPeople();
  }
}

class MyAppStates {
  bool isError = false;
}
