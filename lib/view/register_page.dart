import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_sample/local_db_repository/repository.dart';
import 'package:sembast_sample/view/fetch_page.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late Database db;
    late StoreRef store;
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        db = await ref.watch(dbRepositoryProvider).dbInit();
        store = StoreRef.main();
      });
      return null;
    });

    TextEditingController firsttNamecontroller = TextEditingController();
    TextEditingController lastNamecontroller = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sembast Sample'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: firsttNamecontroller,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.blue[500],
                  ),
                  floatingLabelStyle: const TextStyle(fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.blue[100]!,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: lastNamecontroller,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    labelStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.blue[500],
                    ),
                    floatingLabelStyle: const TextStyle(fontSize: 12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.blue[100]!,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    labelStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.blue[500],
                    ),
                    floatingLabelStyle: const TextStyle(fontSize: 12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.blue[100]!,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.blue[500],
                  ),
                  floatingLabelStyle: const TextStyle(fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.blue[100]!,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final int intPhNum =
                          int.parse(phoneNumberController.text);
                      final int intAge = int.parse(ageController.text);
                      ref.watch(dbRepositoryProvider).setValue(
                            db: db,
                            store: store,
                            fnValue: firsttNamecontroller.text,
                            lnValue: lastNamecontroller.text,
                            pnValue: intPhNum,
                            ageValue: intAge,
                          );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => FetchPage(
                                db: db,
                                store: store,
                              )),
                        ),
                      );
                    },
                    child: const Text('Save'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FetchPage(
                              db: db,
                              store: store,
                            ),
                          ),
                        );
                      },
                      child: Text("→"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
