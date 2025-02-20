import 'package:daacos_website/database/database.dart';
import 'package:daacos_website/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileRender extends StatefulWidget {
  const MobileRender({super.key});

  @override
  State<MobileRender> createState() => _MobileRenderState();
}

class _MobileRenderState extends State<MobileRender> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _landingPageKey = GlobalKey();
  final GlobalKey _serviceSectionKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToLandingPage() {
    final context = _landingPageKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
    }
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
        // onHomeTap: _scrollToLandingPage,
        onServiceTap: _scrollToServiceSection,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Database.secondary,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Database.primary,
        toolbarHeight: 70,
        flexibleSpace: GlobalAppBar(
          ontap: () {
            _openBottomSheet();
          },
          // onHomeTap: _scrollToLandingPage,
          onServiceTap: _scrollToServiceSection,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                LandingPage(key: _landingPageKey),
                ServiceSection(key: _serviceSectionKey),
                TestimonialSection(),
                Footer()
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
