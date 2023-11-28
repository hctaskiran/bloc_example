class PersonResponse {
  List<Person> people;

  PersonResponse({
    required this.people,
  });

  Map<String, dynamic> toJson() {
    return {
      'filmler': people,
    };
  }

  factory PersonResponse.fromJson(Map<String, dynamic> json) {
    return PersonResponse(
      people: (json['kisiler'] as List<dynamic>).map((e) => Person.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

class Person {
  int person_id;
  String person_name;
  String person_phone;

  Person({
    required this.person_id,
    required this.person_name,
    required this.person_phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': person_id,
      'kisi_ad': person_name,
      'kisi_tel': person_phone,
    };
  }

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      person_id: json['id'] as int,
      person_name: json['kisi_ad'] as String,
      person_phone: json['kisi_tel'] as String,
    );
  }
}
