import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sembast_sample/entity/user.dart';
import 'package:sembast_sample/local_db_repository/repository.dart';

class FetchPage extends ConsumerStatefulWidget {
  const FetchPage({super.key});

  @override
  ConsumerState<FetchPage> createState() => _FetchPageState();
}

class _FetchPageState extends ConsumerState<FetchPage> {
  late Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: ref.watch(dbRepositoryProvider).fetchValue(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data as List<Object?>;
            final user = User(
              firstName: data[0] as String,
              lastName: data[1] as String,
              phoneNumber: data[2] as String,
              age: data[3] as int,
            );
            return child = Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("First Name is ${user.firstName}"),
                  Text("Last Name is ${user.lastName}"),
                  Text("Phone Number is ${user.phoneNumber}"),
                  Text("Age is ${user.age.toString()}"),
                ],
              ),
            );
          } else {
            child = const Center(
              child: Text("データがありません"),
            );
          }
          return child;
        },
      ),
    );
  }
}
