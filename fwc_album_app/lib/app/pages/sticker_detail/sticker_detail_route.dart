import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/database/stickers/stickers_repository_impl.dart';
import 'package:fwc_album_app/app/pages/sticker_detail/presenter/sticker_detail_presenter_impl.dart';
import 'package:fwc_album_app/app/pages/sticker_detail/sticker_detail_page.dart';
import 'package:fwc_album_app/app/services/sticker/find_sitcker_service.dart';
import 'package:fwc_album_app/app/services/sticker/find_sticker_service_impl.dart';

import '../../database/stickers/stickers_repository.dart';
import 'presenter/sticker_detail_presenter.dart';

class StickerDetailRoute extends FlutterGetItPageRoute {
  const StickerDetailRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<StickersRepository>(
            (i) => StickersRepositoryImpl(dio: i())),
        Bind.lazySingleton<StickerDetailPresenter>((i) =>
            StickerDetailPresenterImpl(
                findStickerService: i(), stickersRepository: i())),
        Bind.lazySingleton<FindStickerService>(
          (i) => FindStickerServiceImpl(stickersRepository: i()),
        ),
      ];

  @override
  WidgetBuilder get page => (context) => StickerDetailPage(
        presenter: context.get(),
      );
}
