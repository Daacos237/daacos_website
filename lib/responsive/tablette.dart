import 'package:daacos_website/database/database.dart';
import 'package:daacos_website/widgets/widget.dart';
import 'package:flutter/material.dart';

class TabletteRender extends StatefulWidget {
  const TabletteRender({super.key});

  @override
  State<TabletteRender> createState() => _TabletteRenderState();
}

class _TabletteRenderState extends State<TabletteRender> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _serviceSectionKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToServiceSection() {
    final context = _serviceSectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Database.secondary,
      builder: (context) => CustomNavBar(
        onServiceTap: _scrollToServiceSection,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Database.secondary,
      appBar: AppBar(
        toolbarHeight: 70,
        flexibleSpace: GlobalAppBar(
          ontap: () {
            _openBottomSheet();
          },
          onServiceTap: _scrollToServiceSection,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                LandingPage(),
                ServiceSection(key: _serviceSectionKey),
                TestimonialSection(),
                Footer(),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ScrollToTopButton(
              scrollController: _scrollController,
            ),
          ),
        ],
      ),
    );
  }
}
