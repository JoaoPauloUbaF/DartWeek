import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class ButtonStyles {
  static ButtonStyles? _instance;
  // Avoid self isntance
  ButtonStyles._();
  static ButtonStyles get i {
    _instance ??= ButtonStyles._();
    return _instance!;
  }

  ButtonStyle get yellowButton => ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.i.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle:
            TextStyles.i.textSecondaryFontExtraBold.copyWith(fontSize: 14),
      );

  ButtonStyle get yellowOutlineButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle:
            TextStyles.i.textSecondaryFontExtraBold.copyWith(fontSize: 14),
        side: BorderSide(color: ColorsApp.i.yellow),
      );

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.i.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle:
            TextStyles.i.textSecondaryFontExtraBold.copyWith(fontSize: 14),
      );

  ButtonStyle get primaryOutlineButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle:
            TextStyles.i.textSecondaryFontExtraBold.copyWith(fontSize: 14),
        side: BorderSide(color: ColorsApp.i.primary),
      );
}

extension ButtonStylesExtensions on BuildContext {
  ButtonStyles get buttonStyles => ButtonStyles.i;
}
