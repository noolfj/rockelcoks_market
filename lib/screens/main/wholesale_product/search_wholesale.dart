import 'package:flutter/material.dart';
import 'package:rockelcoks_market/utils/app_styles.dart';

class SearchBarWithFilters extends StatefulWidget {
  final List<String> popularSearches;
  final List<String> recommendedSearches;
  final void Function(String value)? onSelected;

  const SearchBarWithFilters({
    Key? key,
    required this.popularSearches,
    required this.recommendedSearches,
    this.onSelected,
  }) : super(key: key);

  @override
  State<SearchBarWithFilters> createState() => _SearchBarWithFiltersState();
}

class _SearchBarWithFiltersState extends State<SearchBarWithFilters> {
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
    builder: (context) => GestureDetector(
      onTap: () {
      },
      child: Stack(
        children: [
          Positioned(
            left: offset.dx,
            top: offset.dy + size.height,
            width: size.width,
            child: Material(
              elevation: 0,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
              clipBehavior: Clip.hardEdge,
              child: _containerBoxResultSearch(),
            ),
          ),
        ],
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
  double textFieldWidth = MediaQuery.of(context).size.width * 0.72;
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
              height: 48,
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
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.03,
                      right: screenWidth * 0.01,
                    ),
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
                ),
                onChanged: (_) => setState(() {
                  _showOverlay();
                }),
              ),
            ),
            const SizedBox(width: 6),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: Image.asset('assets/icons/ic_filter.png', width: 25, height: 25),
            ),
             const SizedBox(width: 6),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: Image.asset('assets/icons/ic_basket.png', width: 35, height: 35),
            ),
          ],
        ),

        const SizedBox(height: 12),

        
        Padding(
          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
          child: Wrap(
            spacing: 20,        
            runSpacing: 4,     
            alignment: WrapAlignment.start, 
            children: [
              FilterChip(
                backgroundColor: Colors.white,
                side: BorderSide.none,
                label: Text('+Одежда', 
                style: AppStyles.getAppTextStyle(
                    color: Color(0xff424242),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    context: context,
                    fontFamily: 'nunito',
                  ),
                ),
                selected: false,
                onSelected: (_) {},
              ),
              FilterChip(
                backgroundColor: Colors.white,
                side: BorderSide.none,
                label: Text('+Техника', 
                style: AppStyles.getAppTextStyle(
                    color: Color(0xff424242),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    context: context,
                    fontFamily: 'nunito',
                  ),
                ),
                selected: false,
                onSelected: (_) {},
              ),
              FilterChip(
                backgroundColor: Colors.white,
                side: BorderSide.none,
                label: Text('+Кроссовки', 
                style: AppStyles.getAppTextStyle(
                    color: Color(0xff424242),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    context: context,
                    fontFamily: 'nunito',
                  ),
                ),
                selected: false,
                onSelected: (_) {},
              ),
              FilterChip(
                backgroundColor: Colors.white,
                side: BorderSide.none,
                label:  Text('+Наушники', 
                style: AppStyles.getAppTextStyle(
                    color: Color(0xff424242),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    context: context,
                    fontFamily: 'nunito',
                  ),
                ),
                selected: false,
                onSelected: (_) {},
              ),
              FilterChip(
                backgroundColor: Colors.white,
                side: BorderSide.none,
                label:  Text('+Мебель', 
                style: AppStyles.getAppTextStyle(
                    color: Color(0xff424242),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    context: context,
                    fontFamily: 'nunito',
                  ),
                ),
                selected: false,
                onSelected: (_) {},
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

  Widget _containerBoxResultSearch() {
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