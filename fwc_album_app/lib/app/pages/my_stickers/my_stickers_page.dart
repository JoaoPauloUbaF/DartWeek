import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class MyStickersPage extends StatelessWidget {
  const MyStickersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Minhas figurinhas',
          style: context.textStyles.titleBlack,
        ),
      ),
      body: Container(),
    );
  }
}
