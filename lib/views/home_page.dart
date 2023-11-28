// ignore_for_file: avoid_print
import 'package:bloc_pattern_flutter_ornek/cubit/home_page_cubit.dart';
import 'package:bloc_pattern_flutter_ornek/entity/person.dart';
import 'package:bloc_pattern_flutter_ornek/views/person_detail.dart';
import 'package:bloc_pattern_flutter_ornek/views/person_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().fetchPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Contacts App",
        style: TextStyle(color: Colors.white),
      )),
      body: BlocBuilder<HomePageCubit, List<Person>>(
        builder: (context, personList) {
          if (personList.isNotEmpty) {
            return ListView.builder(
              itemCount: personList.length,
              itemBuilder: (context, index) {
                var person = personList[index];
                return ListTile(
                    title: Text(person.person_name),
                    subtitle: Text(person.person_phone),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      //Navigation to DetailPage
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailPage(),
                            settings: RouteSettings(arguments: person),
                          ));
                    });
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
          },
          child: const Icon(Icons.add)),
    );
  }
}
