import 'package:daacos_website/database/database.dart';
import 'package:daacos_website/widgets/widget.dart';
import 'package:flutter/material.dart';

class DesktopRender extends StatefulWidget {
  const DesktopRender({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DesktopRenderState createState() => _DesktopRenderState();
}

class _DesktopRenderState extends State<DesktopRender>
    with SingleTickerProviderStateMixin {
  _DesktopRenderState();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  late ScrollController _scrollController;
  final GlobalKey _landingPageKey = GlobalKey();
  final GlobalKey _serviceSectionKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();
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

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Database.secondary,
      appBar: AppBar(
        flexibleSpace: GlobalAppBar(
          //onHomeTap: _scrollToLandingPage,
          onServiceTap: _scrollToServiceSection,
        ),
        toolbarHeight: 70,
        backgroundColor: Database.secondary,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: LandingPage(key: _landingPageKey),
                  ),
                ),
                ServiceSection(key: _serviceSectionKey),
                TestimonialSection(),
                Footer()
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: ScrollToTopButton(
              scrollController: _scrollController,
            ),
          ),
        ],
      ),
    );
  }
}
