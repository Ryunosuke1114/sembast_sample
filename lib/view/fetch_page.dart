import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_sample/entity/user.dart';
import 'package:sembast_sample/local_db_repository/repository.dart';

class FetchPage extends ConsumerStatefulWidget {
  FetchPage({super.key, required this.db, required this.store});
  Database db;
  StoreRef store;

  @override
  ConsumerState<FetchPage> createState() => _FetchPageState();
}

class _FetchPageState extends ConsumerState<FetchPage> {
  List<dynamic> values = [];
  late Widget child;
  @override
  void initState() {
    super.initState();
    Future(() async {
      values = await ref.watch(dbRepositoryProvider).fetchValue(
            db: widget.db,
            store: widget.store,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: ref
            .watch(dbRepositoryProvider)
            .fetchValue(db: widget.db, store: widget.store),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //TODO Userにsnapshotを流す
            User user = User(
              firstName: snapshot.data![1],
              lastName: snapshot.data![2],
              phoneNumber: snapshot.data![3],
              age: snapshot.data![4],
            );
            print('user🔥: $user');
            // final child = Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [for (final snapshot in snapshot.data!) Text(snapshot)],
            // );
            return child;
          } else if (snapshot.hasError) {
            final error = e.toString();
            Center(
              child: Text(error),
            );
          } else {
            const Center(child: CircularProgressIndicator());
          }
          return Center(child: Text('...'));
        },
      ),
    );
  }
}
