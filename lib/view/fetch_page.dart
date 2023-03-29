import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FetchPage extends ConsumerStatefulWidget {
  const FetchPage({super.key});

  @override
  ConsumerState<FetchPage> createState() => _FetchPageState();
}

class _FetchPageState extends ConsumerState<FetchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text('データ取得ページ'),
        ),
      ),
    );
  }
}
