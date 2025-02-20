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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Database.secondary,
      appBar: AppBar(
        toolbarHeight: 70,
        flexibleSpace: GlobalAppBar(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                LandingPage(),
                TestimonialSection(),
                ServiceSection(),
                // ContactSection(),
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
