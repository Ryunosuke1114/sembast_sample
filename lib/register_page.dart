
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_sample/local_db_repository/repository.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ref.watch(dbRepositoryProvider).dbInit();
      });
      return null;
    });

    TextEditingController? firsttNamecontroller;
    TextEditingController? lastNamecontroller;
    TextEditingController? phoneNumberController;
    TextEditingController? ageController;

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
              ElevatedButton(
                onPressed: () async {},
                child: const Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
