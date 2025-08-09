import 'package:flutter/material.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class SearchField extends StatefulWidget {
  final List<String> popularSearches;
  final List<String> recommendedSearches;
  final void Function(String value)? onSelected;

  const SearchField({
    Key? key,
    required this.popularSearches,
    required this.recommendedSearches,
    this.onSelected,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _showSearchSuggestions = false;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _textFieldKey = GlobalKey();

  final List<String> lastSearches = ['Телефон', 'Стол', 'Телевизор', 'Миксер'];

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(() {
      setState(() {
        _showSearchSuggestions = _searchFocusNode.hasFocus;
        if (_showSearchSuggestions) {
          _showOverlay();
        } else {
          _removeOverlay();
        }
      });
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _showOverlay() {
    _removeOverlay();
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

 OverlayEntry _createOverlayEntry() {
  final renderBox = _textFieldKey.currentContext?.findRenderObject() as RenderBox?;
  final size = renderBox?.size ?? Size.zero;
  final offset = renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;

  return OverlayEntry(
    builder: (context) => Positioned(
      left: offset.dx,
      top: offset.dy + size.height,
      width: size.width,
      child: Material(
        elevation: 0,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
        child: _buildSearchSuggestionsContent(),
      ),
    ),
  );
}


  List<String> _getFilteredSearches(List<String> list, String query) {
    if (query.isEmpty) return list;
    return list
        .where((e) => e.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double textFieldWidth = MediaQuery.of(context).size.width * 0.81;
    textFieldWidth = textFieldWidth > 500 ? 500 : textFieldWidth;

    return CompositedTransformTarget(
      link: _layerLink,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                key: _textFieldKey,
                height: screenHeight * 0.05,
                width: textFieldWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: _searchFocusNode.hasFocus
                      ? const BorderRadius.vertical(top: Radius.circular(10))
                      : BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _searchController,
                  focusNode: _searchFocusNode,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Поиск товаров и артикулов',
                    hintStyle: AppStyles.getAppTextStyle(
                      color: Color(0xff7A7B7C),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      context: context,
                      fontFamily: 'nunito',
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.03, right: screenWidth * 0.01),
                      child: SizedBox(
                        height: screenHeight * 0.03,
                        width: screenWidth * 0.07,
                        child: Image.asset('assets/icons/ic_search.png'),
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    suffixIcon: _searchFocusNode.hasFocus
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Image.asset('assets/icons/ic_camera.png', width: 25, height: 25),
                              ),
                              SizedBox(width: 8),
                              InkWell(
                                onTap: () {},
                                child: Image.asset('assets/icons/ic_micro.png', width: 25, height: 25),
                              ),
                              SizedBox(width: 10),
                            ],
                          )
                        : null,
                  ),
                  onChanged: (_) => setState(() {_showOverlay();}),
                ),
              ),
              const SizedBox(width: 6),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Image.asset('assets/icons/ic_filter.png', width: 25, height: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSuggestionsContent() {
    final String query = _searchController.text;
    final filteredPopular = _getFilteredSearches(widget.popularSearches, query);
    final filteredRecommended = widget.recommendedSearches;

    return Container(
      width: MediaQuery.of(context).size.width * 0.81,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (query.isEmpty) ...[
            ...lastSearches.map(
              (e) => _buildSearchItem(e, assetIcon: 'assets/icons/ic_arch.png'),
            ),
          ] else ...[
            if (filteredPopular.isEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Ничего не найдено',
                  style: AppStyles.getAppTextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    context: context,
                    fontFamily: 'nunito',
                  ),
                ),
              )
            else
              ...filteredPopular.map(
                (e) => _buildSearchItem(e, assetIcon: 'assets/icons/ic_search_mini.png'),
              ),
          ],
          if (filteredRecommended.isNotEmpty) ...[
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                'Также ищут:',
                style: AppStyles.getAppTextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  context: context,
                  fontFamily: 'nunito',
                ),
              ),
            ),
            const SizedBox(height: 4),
            ...filteredRecommended.map(
              (e) => _buildSearchItem(e, assetIcon: 'assets/icons/ic_trend.png'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          ],
        ],
      ),
    );
  }

  Widget _buildSearchItem(String text, {required String assetIcon}) {
    return InkWell(
      onTap: () {
        _searchController.text = text;
        _searchFocusNode.unfocus();
        setState(() => _showSearchSuggestions = false);
        widget.onSelected?.call(text);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Image.asset(assetIcon, width: 20, height: 20),
            const SizedBox(width: 14),
            Text(
              text,
              style: AppStyles.getAppTextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                context: context,
                fontFamily: 'nunito',
              ),
            ),
          ],
        ),
      ),
    );
  }
}