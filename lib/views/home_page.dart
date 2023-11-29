// ignore_for_file: avoid_print
import 'package:bloc_pattern_flutter_ornek/constants.dart';
import 'package:bloc_pattern_flutter_ornek/cubit/home_page_cubit.dart';
import 'package:bloc_pattern_flutter_ornek/entity/person.dart';
import 'package:bloc_pattern_flutter_ornek/init/lang/language_manager.dart';
import 'package:bloc_pattern_flutter_ornek/views/person_add.dart';
import 'package:bloc_pattern_flutter_ornek/views/person_detail.dart';
import 'package:easy_localization/easy_localization.dart';
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
        title: Text(Translations().contacts),
        actions: <Widget>[
          Padding(
              padding: PaddingConst().right10,
              child: DropdownButton(
                  padding: PaddingConst().all5,
                  isDense: true,
                  hint: appBarIcons[0],
                  underline: const SizedBox(),
                  items: AppLanguages.Languages.asMap()
                      .map((index, value) => MapEntry(
                          index,
                          DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          )))
                      .values
                      .toList(),
                  onChanged: (newValue) {
                    int selectedIndex = AppLanguages.Languages.indexOf(newValue as String);
                    context.locale = AppLanguages.supportedLanguages[selectedIndex];
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                  }))
        ],
      ),
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
                    trailing: contactIcons[2],
                    onTap: () {
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
          child: contactIcons[3]),
    );
  }
}
