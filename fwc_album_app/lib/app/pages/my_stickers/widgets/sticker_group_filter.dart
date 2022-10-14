// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/pages/my_stickers/presenter/my_stickers_presenter.dart';

class StickerGroupFilter extends StatefulWidget {
  final Map<String, String> countries;
  const StickerGroupFilter({
    Key? key,
    required this.countries,
  }) : super(key: key);

  @override
  State<StickerGroupFilter> createState() => _StickerGroupFilterState();
}

class _StickerGroupFilterState extends State<StickerGroupFilter> {
  List<String>? selectedValue = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SmartSelect<String>.multiple(
        tileBuilder: (context, state) {
          return InkWell(
            onTap: state.showModal,
            child: _StickerGroupTile(
              clearCallBack: () {
                setState(() {
                  selectedValue = null;
                  context
                      .get<MyStickersPresenter>()
                      .countryFilter(selectedValue);
                });
              },
              label: state.selected.title?.join(', ') ?? 'Filtro',
            ),
          );
        },
        title: 'Filtro',
        selectedValue: selectedValue ?? [],
        onChange: (selectedValues) {
          setState(() {
            selectedValue = selectedValues.value;
          });
          context.get<MyStickersPresenter>().countryFilter(selectedValue);
        },
        choiceItems: S2Choice.listFrom<String, Map<String, dynamic>>(
            source: widget.countries.entries
                .map((e) => {'value': e.key, 'title': e.value})
                .toList(),
            value: (_, item) => item['value'] ?? '',
            title: (_, item) => item['title'] ?? ''),
        choiceType: S2ChoiceType.switches,
        modalType: S2ModalType.bottomSheet,
        choiceGrouped: true,
        modalFilter: false,
        placeholder: '',
      ),
    );
  }
}

class _StickerGroupTile extends StatelessWidget {
  final VoidCallback clearCallBack;
  final String label;

  const _StickerGroupTile({
    Key? key,
    required this.clearCallBack,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xfff0f0f0),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.filter_list),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  label,
                  style: context.textStyles.textSecondaryFontRegular
                      .copyWith(fontSize: 12),
                ),
              ),
              InkWell(
                onTap: clearCallBack,
                child: const Icon(Icons.clear),
              )
            ],
          ),
        ));
  }
}
