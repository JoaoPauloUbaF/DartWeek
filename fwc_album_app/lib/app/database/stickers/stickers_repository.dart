import 'package:fwc_album_app/app/models/groups_stickers.dart';
import 'package:fwc_album_app/app/models/sticker_model.dart';

import '../../models/register_sticker_model.dart';

abstract class StickersRepository {
  Future<List<GroupsStickers>> getMyAlbum();
  Future<StickerModel?> findStickerByCode(
      String stickerCode, String stickerNumber);
  Future<StickerModel> createSticker(RegisterStickerModel registerStickerModel);
  Future<void> registerUserSticker(int stickerId, int amount);
  Future<void> updateUserSticker(int stickerId, int amount);
}
