// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fwc_album_app/app/database/stickers/stickers_repository.dart';
import 'package:fwc_album_app/app/models/register_sticker_model.dart';
import 'package:fwc_album_app/app/models/sticker_model.dart';
import 'package:fwc_album_app/app/services/sticker/find_sitcker_service.dart';

class FindStickerServiceImpl extends FindStickerService {
  final StickersRepository stickersRepository;

  FindStickerServiceImpl({
    required this.stickersRepository,
  });

  @override
  Future<StickerModel> execute(String countryCode, String stickerNumber) async {
    var sticker =
        await stickersRepository.findStickerByCode(countryCode, stickerNumber);
    if (sticker == null) {
      final registerSticker = RegisterStickerModel(
          name: '', stickerCode: countryCode, stickerNumber: stickerNumber);
      sticker = await stickersRepository.createSticker(registerSticker);
    }
    return sticker;
  }
}
