import 'dart:async';

import 'package:daacos_website/database/database.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GlobalAppBar extends StatefulWidget {
  final Function? ontap;
  final Function? onServiceTap;
  const GlobalAppBar({super.key, this.ontap, this.onServiceTap});

  @override
  State<GlobalAppBar> createState() => _GlobalAppBarState();
}

class _GlobalAppBarState extends State<GlobalAppBar> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDesktop = width > 1100;
    bool isTablette = width > 600;
    return Container(
      height: 70,
      padding: EdgeInsets.only(
        left: isDesktop
            ? width / 6.3
            : isTablette
                ? 30
                : 20,
        right: isDesktop
            ? width / 6.3
            : isTablette
                ? 30
                : 20,
      ),
      color: Database.secondary,
      child: isDesktop
          ? desktop(width)
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 130,
                ),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      widget.ontap!();
                    },
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Database.primary.withOpacity(0.2),
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        "assets/images/menu.png",
                        width: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class CustomNavBar extends StatefulWidget {
  final Function? onServiceTap;
  const CustomNavBar({super.key, this.onServiceTap});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  List state = [true, false, false, false];

  void selected(int n) {
    for (var i = 0; i < 4; i++) {
      if (n == i) {
        setState(() {
          state[i] = true;
        });
      } else {
        setState(() {
          state[i] = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDestop = width > 1100;
    bool isTablette = width > 600;
    return (isDestop == true || isTablette == true)
        ? Row(
            children: [
              NavBarItem(
                text: "Accueil",
                active: state[0],
                touched: () {
                  setState(() {
                    selected(0);
                  });
                },
              ),
              NavBarItem(
                text: "Services",
                active: state[1],
                touched: () {
                  setState(() {
                    selected(1);
                  });
                  widget.onServiceTap!();
                },
              ),
              NavBarItem(
                text: "Contact",
                active: state[2],
                touched: () {
                  setState(() {
                    selected(2);
                  });
                },
              ),
              NavBarItem(
                text: "A propos",
                active: state[3],
                touched: () {
                  setState(() {
                    selected(3);
                  });
                },
              ),
            ],
          )
        : Container(
            padding: EdgeInsets.all(
              20,
            ),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                NavBarItem(
                  text: "Accueil",
                  active: state[0],
                  touched: () {
                    setState(() {
                      selected(0);
                    });
                  },
                ),
                NavBarItem(
                  text: "Services",
                  active: state[1],
                  touched: () {
                    setState(() {
                      selected(1);
                    });
                    widget.onServiceTap!();
                  },
                ),
                NavBarItem(
                  text: "Contact",
                  active: state[2],
                  touched: () {
                    setState(() {
                      selected(2);
                    });
                  },
                ),
                NavBarItem(
                  text: "A propos",
                  active: state[3],
                  touched: () {
                    setState(() {
                      selected(3);
                    });
                  },
                ),
              ],
            ),
          );
  }
}

class NavBarItem extends StatefulWidget {
  final Function touched;
  final bool active;
  final String text;
  const NavBarItem({
    super.key,
    required this.touched,
    required this.active,
    required this.text,
  });

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDestop = width > 1100;
    bool isTablette = width > 600;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          widget.touched();
        },
        hoverColor: Database.primary.withOpacity(0.1),
        splashColor: Colors.blueAccent.withOpacity(0.3),
        child: Container(
          margin: EdgeInsets.all(10),
          height: (isDestop == true || isTablette == true) ? 30 : 45,
          width:
              (isDestop == true || isTablette == true) ? 70 : double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: (isDestop == true || isTablette == true) ? 15 : 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 4,
                width: widget.active ? 50 : 0,
                decoration: BoxDecoration(
                  color: Database.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

desktop(double width) {
  return Expanded(
    child: SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/logo.png",
            width: 130,
          ),
          Container(
            margin: EdgeInsets.only(top: 7, bottom: 7),
            height: double.infinity,
            constraints: BoxConstraints(
              minWidth: width / 2.7,
              maxWidth: double.infinity,
            ),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomNavBar(),
                  SizedBox(
                    width: 20,
                  ),
                  CustomBut(
                    width: 180,
                    text: "Démarrer un projet",
                    ontap: () {},
                    height: 45,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

class CustomBut extends StatefulWidget {
  final double width;
  final String text;
  final Function ontap;
  final double height;
  const CustomBut({
    super.key,
    required this.width,
    required this.text,
    required this.ontap,
    required this.height,
  });

  @override
  State<CustomBut> createState() => _CustomButState();
}

class _CustomButState extends State<CustomBut> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        hover = true;
      }),
      onExit: (event) => setState(() {
        hover = false;
      }),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          boxShadow: hover
              ? [
                  BoxShadow(
                    color: Database.primary.withOpacity(0.6),
                    spreadRadius: 2,
                    blurRadius: 10,
                  )
                ]
              : [],
          borderRadius: BorderRadius.circular(5),
        ),
        transform:
            hover ? Matrix4.translationValues(0, -5, 0) : Matrix4.identity(),
        width: widget.width,
        height: widget.height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 2.3,
            padding: EdgeInsets.symmetric(horizontal: 20),
            backgroundColor: Database.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {
            widget.ontap;
          },
          child: Text(
            widget.text,
            style: TextStyle(
              color: Database.secondary,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomOutBut extends StatefulWidget {
  final double width;
  final String text;
  final Function ontap;
  final double height;
  const CustomOutBut(
      {super.key,
      required this.width,
      required this.text,
      required this.ontap,
      required this.height});

  @override
  State<CustomOutBut> createState() => _CustomOutButState();
}

class _CustomOutButState extends State<CustomOutBut> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        hover = true;
      }),
      onExit: (event) => setState(() {
        hover = false;
      }),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        transform:
            hover ? Matrix4.translationValues(0, -5, 0) : Matrix4.identity(),
        width: widget.width,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding:
                EdgeInsets.symmetric(vertical: widget.height, horizontal: 20),
            side: BorderSide(
              color: Database.primary,
              width: 2.3,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {
            widget.ontap;
          },
          child: Text(
            widget.text,
            style: TextStyle(
              color: Database.textColor,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool desktop = width > 1100;
    bool istablette = width > 500;
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              desktop
                  ? 'assets/images/background.png'
                  : istablette
                      ? 'assets/images/background.png'
                      : 'assets/images/mobile.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Database.secondary.withOpacity(0.5),
            height: height,
            width: width,
          ),
          Container(
            padding: EdgeInsets.only(
              left: desktop
                  ? width / 6.3
                  : istablette
                      ? 30
                      : 20,
              right: desktop
                  ? width / 6.3
                  : istablette
                      ? 30
                      : 20,
            ),
            height: height,
            width: width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeTransition(
                        opacity: _animation,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Transformez votre\nprésence digitale avec \n",
                                style: desktop
                                    ? Database.titleStyle
                                    : istablette
                                        ? Database.titleStyle
                                        : TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                          ),
                              ),
                              TextSpan(
                                text: "Daacos Digicom \nAgency",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Database.primary,
                                  fontSize: desktop
                                      ? 56
                                      : istablette
                                          ? 45
                                          : 32,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Agence digitale spécialisée en développement web,\n marketing digital et solutions numériques innovantes",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: desktop
                              ? 20
                              : istablette
                                  ? 20
                                  : 14,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 37),
                        width: desktop
                            ? 430
                            : istablette
                                ? 430
                                : width,
                        height: desktop ? 70 : 150,
                        child: desktop
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomBut(
                                    width: 220,
                                    text: "Commencer un projet",
                                    ontap: () {},
                                    height: 55,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomOutBut(
                                    height: 24.5,
                                    text: "Nos Services",
                                    ontap: () {},
                                    width: 200,
                                  ),
                                ],
                              )
                            : istablette
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomBut(
                                        width: 220,
                                        text: "Commencer un projet",
                                        ontap: () {},
                                        height: 62,
                                      ),
                                      CustomOutBut(
                                        text: "Nos Services",
                                        ontap: () {},
                                        width: 200,
                                        height: 25,
                                      ),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomBut(
                                        width: width,
                                        text: "Commencer un projet",
                                        ontap: () {},
                                        height: 62,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CustomOutBut(
                                        text: "Nos Services",
                                        ontap: () {},
                                        width: width,
                                        height: 22,
                                      ),
                                    ],
                                  ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageCard extends StatefulWidget {
  final String asset;

  const ImageCard({super.key, required this.asset});

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        hover = true;
      }),
      onExit: (event) => setState(() {
        hover = false;
      }),
      child: Container(
        height: 300,
        width: 400,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: hover ? 2.3 : 0,
            color: hover ? Database.primary : Database.secondary,
          ),
          image: DecorationImage(
            image: AssetImage(widget.asset),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
//carte pour les images

//section service

class ServiceSection extends StatefulWidget {
  const ServiceSection({super.key});

  @override
  State<ServiceSection> createState() => _ServiceSectionState();
}

class _ServiceSectionState extends State<ServiceSection> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    bool isDesktop = width > 1100;
    bool isTablette = width > 600;

    return Container(
      width: width,
      height: isDesktop
          ? 1050
          : isTablette
              ? 1310
              : 2100,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop
            ? width / 6.3
            : isTablette
                ? 30
                : 20,
        vertical: 35,
      ),
      child: Column(
        children: [
          Text(
            "Nos Services",
            style: TextStyle(
              color: Colors.white,
              fontSize: isDesktop ? 42 : 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: isTablette
                ? 50
                : isTablette
                    ? 40
                    : 30,
          ),
          isDesktop
              ? Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            children: [
                              ServiceCard(
                                service: Database.services[0],
                                description: Database.descriptions[0],
                                icon: Database.icondata[0],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ServiceCard(
                                service: Database.services[2],
                                description: Database.descriptions[2],
                                icon: Database.icondata[2],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 5,
                            right: 5,
                          ),
                          child: Column(
                            children: [
                              ServiceCard(
                                service: Database.services[3],
                                description: Database.descriptions[3],
                                icon: Database.icondata[3],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ServiceCard(
                                service: Database.services[4],
                                description: Database.descriptions[4],
                                icon: Database.icondata[4],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 10,
                            right: 5,
                          ),
                          child: Column(
                            children: [
                              ServiceCard(
                                service: Database.services[5],
                                description: Database.services[5],
                                icon: Database.icondata[5],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ServiceCard(
                                service: Database.services[1],
                                description: Database.services[1],
                                icon: Database.icondata[1],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : isTablette
                  ? Expanded(
                      child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ServiceCard(
                                service: Database.services[1],
                                description: Database.descriptions[1],
                                icon: Database.icondata[1],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ServiceCard(
                                service: Database.services[0],
                                description: Database.descriptions[0],
                                icon: Database.icondata[0],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ServiceCard(
                                service: Database.services[2],
                                description: Database.descriptions[2],
                                icon: Database.icondata[2],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ServiceCard(
                                service: Database.services[3],
                                description: Database.descriptions[3],
                                icon: Database.icondata[3],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ServiceCard(
                                service: Database.services[4],
                                description: Database.descriptions[4],
                                icon: Database.icondata[4],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ServiceCard(
                                service: Database.services[5],
                                description: Database.descriptions[5],
                                icon: Database.icondata[5],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
                  : Expanded(
                      child: GridView.builder(
                        itemCount: 6,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 5 / 4,
                          crossAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) {
                          return ServiceCard(
                            service: Database.services[index],
                            description: Database.descriptions[index],
                            icon: Database.icondata[index],
                          );
                        },
                      ),
                    ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatefulWidget {
  final String service;
  final IconData icon;
  final String description;
  const ServiceCard(
      {super.key,
      required this.service,
      required this.description,
      required this.icon});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDesktop = width > 1100;
    bool istablette = width > 600;
    return MouseRegion(
      onEnter: (event) => setState(() {
        hover = true;
      }),
      onExit: (event) => setState(
        () {
          hover = false;
        },
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        height: hover ? 360 : 340,
        width: hover ? 410 : 400,
        padding: EdgeInsets.all(
          isDesktop
              ? 20
              : istablette
                  ? 20
                  : 15,
        ),
        margin: EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.2,
            color: Database.primary,
          ),
          color: hover ? Database.primary : Color.fromRGBO(255, 255, 255, 0.02),
          boxShadow: hover
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: isDesktop
                  ? 65
                  : istablette
                      ? 55
                      : 40,
              width: isDesktop
                  ? 65
                  : istablette
                      ? 55
                      : 40,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: hover ? Colors.white : Database.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                widget.icon,
                color: hover ? Color(0xffF9AE06) : Colors.white,
                size: 30,
              ),
            ),
            Text(
              widget.service,
              style: TextStyle(
                color: Colors.white,
                fontSize: isDesktop
                    ? 25
                    : istablette
                        ? width * 0.025
                        : 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 15),
            Text(
              widget.description,
              style: TextStyle(
                color: Colors.white70,
                fontSize: isDesktop ? width * 0.01 : 14,
                height: 1.5,
              ),
            ),
            Spacer(),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: istablette ? 20 : 15,
                  horizontal: 25,
                ),
                side: BorderSide(
                  color: hover ? Colors.white70 : Database.primary,
                  width: 0.2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "En savoir plus",
                    style: TextStyle(
                      color: hover ? Colors.white : Database.primary,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    color: hover ? Colors.white : Database.primary,
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDesktop = width > 1100;
    bool istablette = width > 600;
    return Container(
      height: isDesktop
          ? 470
          : istablette
              ? 620
              : 1318,
      constraints: BoxConstraints(maxHeight: double.infinity),
      padding: EdgeInsets.only(
        left: isDesktop
            ? width / 6.3
            : istablette
                ? 30
                : 20,
        right: isDesktop
            ? width / 6.3
            : istablette
                ? 30
                : 20,
        top: 0,
        bottom: 50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              height: isDesktop
                  ? 310
                  : istablette
                      ? 1300
                      : 1160,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isDesktop
                      ? 4
                      : istablette
                          ? 2
                          : 1,
                  childAspectRatio: isDesktop
                      ? 5 / 4
                      : istablette
                          ? 4 / 3
                          : 5 / 3.5,
                ),
                physics: NeverScrollableScrollPhysics(),
                children: [
                  FirstFooter(),
                  LienRapide(),
                  NosServices(),
                  ContactFooter(
                    width: isDesktop ? width : 300,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 50),
              Divider(color: Colors.white24),
              const SizedBox(height: 20),
              Text(
                "© ${DateTime.now().year} Daacos Digicom Agency, Tous droits réservés. By Anox Design",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: isDesktop
                      ? 14
                      : istablette
                          ? 10
                          : 10.5,
                ),
                softWrap: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactFooter extends StatelessWidget {
  const ContactFooter({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDesktop = width > 1100;
    bool istablette = width > 600;
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(10),
        height: width / 8,
        constraints: BoxConstraints(minWidth: 400, maxHeight: double.infinity),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contact",
              style: TextStyle(
                color: Colors.white,
                fontSize: isDesktop
                    ? width * 0.01
                    : istablette
                        ? 20
                        : 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: width * 0.015),
            FooterContactItem(
              icon: Icons.email_outlined,
              text: "contact@daacos.com",
            ),
            const SizedBox(height: 10),
            FooterContactItem(
              icon: Icons.phone_outlined,
              text: "+237 6 98 86 58 25",
            ),
            const SizedBox(height: 10),
            FooterContactItem(
              icon: Icons.location_on_outlined,
              text: "Douala, Cameroun",
            ),
          ],
        ),
      ),
    );
  }
}

class NosServices extends StatelessWidget {
  const NosServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDesktop = width > 1100;
    bool istablette = width > 600;
    return Expanded(
      flex: 1,
      child: Container(
        height: width / 8,
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Nos Services",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isDesktop
                        ? width * 0.01
                        : istablette
                            ? 20
                            : 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: width * 0.0088,
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AnimatedLink(text: "Communication Digitale"),
                    AnimatedLink(text: "Solutions Web"),
                    AnimatedLink(text: "Applications Mobile"),
                    AnimatedLink(text: "Marketing Digital"),
                    AnimatedLink(text: "Gestion de projets")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LienRapide extends StatefulWidget {
  const LienRapide({
    super.key,
  });

  @override
  State<LienRapide> createState() => _LienRapideState();
}

class _LienRapideState extends State<LienRapide> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDesktop = width > 1100;
    bool istablette = width > 600;

    return Expanded(
      child: Container(
        height: width / 8,
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Liens Rapides",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isDesktop
                        ? width * 0.01
                        : istablette
                            ? 20
                            : 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: width * 0.0088,
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AnimatedLink(text: "Accueil"),
                    AnimatedLink(text: "Services"),
                    AnimatedLink(text: "À propos"),
                    AnimatedLink(text: "Contact"),
                    AnimatedLink(text: "Contact"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedLink extends StatefulWidget {
  const AnimatedLink({super.key, required this.text});
  final String text;

  @override
  State<AnimatedLink> createState() => _AnimatedLinkState();
}

class _AnimatedLinkState extends State<AnimatedLink> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDesktop = width > 1100;
    bool istablette = width > 600;
    return MouseRegion(
      onEnter: (event) => setState(() {
        isHover = true;
      }),
      onExit: (event) => setState(() {
        isHover = false;
      }),
      child: AnimatedContainer(
        height: 30,
        duration: Duration(milliseconds: 150),
        transform:
            isHover ? Matrix4.translationValues(15, 0, 0) : Matrix4.identity(),
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white70,
            fontSize: isDesktop
                ? width * 0.0078
                : istablette
                    ? 15
                    : 14,
          ),
        ),
      ),
    );
  }
}

class FirstFooter extends StatelessWidget {
  const FirstFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDesktop = width > 1100;
    bool isTablette = width > 500;
    return Expanded(
      flex: 1,
      child: Container(
        constraints: BoxConstraints(minWidth: 400, maxHeight: double.infinity),
        margin: EdgeInsets.all(10),
        height: width / 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: isDesktop
                  ? width * 0.07
                  : isTablette
                      ? 130
                      : 130,
            ),
            SizedBox(height: width * 0.01),
            Text(
              "Transformez votre présence digitale avec des solutions innovantes et personnalisées.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: isDesktop
                    ? width * 0.008
                    : isTablette
                        ? 16
                        : 16,
              ),
            ),
            SizedBox(
              height: isDesktop
                  ? width * 0.01
                  : isTablette
                      ? width * 0.01
                      : 15,
            ),
            // Ajout des icônes sociales
            Expanded(
              child: Row(
                children: [
                  AnimatedSocialIcon(
                    icon: Icons.facebook,
                    url: Uri.parse('https://facebook.com/'),
                    color: Database.primary,
                  ),
                  SizedBox(
                    width: isDesktop
                        ? width * 0.01
                        : isTablette
                            ? width * 0.01
                            : 15,
                  ),
                  AnimatedSocialIcon(
                    icon: Icons.tiktok,
                    url: Uri.parse('https://tiktok.com'),
                    color: Database.primary,
                  ),
                  SizedBox(
                    width: isDesktop
                        ? width * 0.01
                        : isTablette
                            ? width * 0.01
                            : 15,
                  ),
                  AnimatedSocialIcon(
                    icon: Icons.icecream_outlined,
                    url: Uri.parse('https://linkedin.com/'),
                    color: Database.primary,
                  ),
                  SizedBox(
                    width: isDesktop
                        ? width * 0.01
                        : isTablette
                            ? width * 0.01
                            : 15,
                  ),
                  AnimatedSocialIcon(
                    icon: Icons.inbox,
                    url: Uri.parse('https://instagram.com/'),
                    color: Database.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  final String title;
  final List<String> items;

  const FooterSection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.blue,
      height: width / 8,
      constraints: BoxConstraints(minWidth: 400, maxHeight: double.infinity),
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.01,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: width * 0.008),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                item,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: width * 0.0075,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FooterContactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const FooterContactItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDesktop = width > 1100;
    bool istablette = width > 600;
    return Row(
      children: [
        Icon(icon, color: Database.primary, size: 20),
        SizedBox(width: width * 0.006),
        Text(
          text,
          style: TextStyle(
            color: Colors.white70,
            fontSize: isDesktop
                ? width * 0.0078
                : istablette
                    ? 15
                    : 14,
          ),
        ),
      ],
    );
  }
}

class AnimatedSocialIcon extends StatefulWidget {
  final IconData icon;
  final Uri url;
  final Color color;

  const AnimatedSocialIcon({
    super.key,
    required this.icon,
    required this.url,
    required this.color,
  });

  @override
  State<AnimatedSocialIcon> createState() => _AnimatedSocialIconState();
}

class _AnimatedSocialIconState extends State<AnimatedSocialIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDesktop = width > 1100;
    bool isTablette = width > 500;
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        height: isDesktop
            ? width * 0.025
            : isTablette
                ? 40
                : 50,
        width: isDesktop
            ? width * 0.025
            : isTablette
                ? 40
                : 50,
        constraints: BoxConstraints(
          maxWidth: isDesktop
              ? width * 0.025
              : isTablette
                  ? 40
                  : 50,
          minHeight: isDesktop
              ? width * 0.025
              : isTablette
                  ? 40
                  : 50,
        ),
        duration: const Duration(milliseconds: 200),
        transform: isHovered
            ? Matrix4.translationValues(0, -7, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: isHovered ? Database.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: widget.color,
            width: 2,
          ),
        ),
        child: Center(
          child: IconButton(
            icon: Icon(
              widget.icon,
              size: isDesktop
                  ? width * 0.01
                  : isTablette
                      ? 22
                      : 20,
            ),
            onPressed: () async {
              if (await canLaunchUrl(widget.url)) {
                await launchUrl(widget.url);
              } else {
                throw "Impossible d'ouvrir l'addresse";
              }
            },
            color: isHovered ? Colors.white : widget.color,
          ),
        ),
      ),
    );
  }
}

class ScrollToTopButton extends StatefulWidget {
  final ScrollController scrollController;

  const ScrollToTopButton({
    super.key,
    required this.scrollController,
  });

  @override
  State<ScrollToTopButton> createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<ScrollToTopButton> {
  bool isVisible = false;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() {
      setState(() {
        isVisible = widget.scrollController.offset >= 300;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.bounceInOut,
          decoration: BoxDecoration(
            color: isHovered ? Database.primary : Database.secondary,
            borderRadius: BorderRadius.circular(isHovered ? 50 : 5),
            border: Border.all(
              color: Database.primary,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_upward,
              color: isHovered ? Colors.white : Database.primary,
            ),
            onPressed: () {
              widget.scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ),
    );
  }
}

class TestimonialSection extends StatefulWidget {
  const TestimonialSection({super.key});

  @override
  State<TestimonialSection> createState() => _TestimonialSectionState();
}

class _TestimonialSectionState extends State<TestimonialSection> {
  final PageController _pageController = PageController();
  Timer? _timer;
  final List<Map<String, String>> testimonials = [
    {
      "name": "Jean Dupont",
      "role": "CEO, TechCorp",
      "testimonial":
          "Une équipe exceptionnelle qui a su transformer notre vision en réalité.",
    },
    {
      "name": "Marie Martin",
      "role": "Directrice Marketing, InnovCo",
      "testimonial":
          "Excellent travail! L'équipe a dépassé toutes nos attentes.",
    },
    {
      "name": "Paul Lambert",
      "role": "Fondateur, StartupXYZ",
      "testimonial":
          "Un partenaire digital fiable et créatif. Je recommande vivement!",
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        if (_pageController.page == testimonials.length - 1) {
          _pageController.animateToPage(
            0,
            duration: Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
        } else {
          _pageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDesktop = width > 1100;
    bool isTablette = width > 500;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop
            ? width / 6.3
            : isTablette
                ? 150
                : 20,
        vertical: 60,
      ),
      color: Color(0xff0A1128),
      child: Column(
        children: [
          Text(
            "Ce que disent nos clients",
            style: TextStyle(
              color: Colors.white,
              fontSize: isDesktop ? 42 : 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50),
          SizedBox(
            height: 300,
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: testimonials.length,
                    itemBuilder: (context, index) {
                      return TestimonialCard(
                        name: testimonials[index]["name"]!,
                        role: testimonials[index]["role"]!,
                        testimonial: testimonials[index]["testimonial"]!,
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    testimonials.length,
                    (index) => GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: StreamBuilder<double>(
                        stream: _pageController.positions.isNotEmpty
                            ? Stream.periodic(
                                Duration(milliseconds: 100),
                                (_) => _pageController.page ?? 0,
                              )
                            : Stream.value(0),
                        builder: (context, snapshot) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (snapshot.data ?? 0).round() == index
                                  ? Database.primary
                                  : Colors.white24,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TestimonialCard extends StatefulWidget {
  final String name;
  final String role;
  final String testimonial;

  const TestimonialCard({
    super.key,
    required this.name,
    required this.role,
    required this.testimonial,
  });

  @override
  State<TestimonialCard> createState() => _TestimonialCardState();
}

class _TestimonialCardState extends State<TestimonialCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDesktop = width > 1100;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: isDesktop
            ? 400
            : width > 500
                ? width * 0.4
                : width * 0.8,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: isHovered
              ? Database.primary.withOpacity(0.1)
              : Colors.transparent,
          border: Border.all(color: Database.primary.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.format_quote, color: Database.primary, size: 40),
            SizedBox(height: 20),
            Text(
              widget.testimonial,
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              widget.name,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.role,
              style: TextStyle(color: Database.primary),
            ),
          ],
        ),
      ),
    );
  }
}

// // class ContactSection extends StatelessWidget {
// //   const ContactSection({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     var width = MediaQuery.of(context).size.width;
// //     bool isDesktop = width > 1100;
// //     bool isTablette = width > 500;

// //     return Container(
// //       padding: EdgeInsets.symmetric(
// //         horizontal: isDesktop
// //             ? width / 6.3
// //             : isTablette
// //                 ? 100
// //                 : 20,
// //         vertical: 60,
// //       ),
// //       color: Color(0xff122150),
// //       child: Column(
// //         children: [
// //           Text(
// //             "Contactez-nous",
// //             style: TextStyle(
// //               color: Colors.white,
// //               fontSize: isDesktop ? 42 : 32,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           SizedBox(height: 50),
// //           Flex(
// //             direction: isDesktop ? Axis.horizontal : Axis.vertical,
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               SizedBox(
// //                 width: isDesktop ? width * 0.3 : width * 0.8,
// //                 child: ContactForm(),
// //               ),
// //               SizedBox(width: isDesktop ? 50 : 0, height: isDesktop ? 0 : 50),
// //               SizedBox(
// //                 width: isDesktop ? width * 0.3 : width * 0.8,
// //                 child: ContactInfo(),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class ContactForm extends StatelessWidget {
// //   const ContactForm({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Material(
// //       color: Colors.transparent,
// //       borderRadius: BorderRadius.circular(20),
// //       elevation: 3,
// //       child: AnimatedContainer(
// //         padding: EdgeInsets.symmetric(
// //           vertical: 60,
// //           horizontal: 30,
// //         ),
// //         duration: Duration(milliseconds: 150),
// //         decoration: BoxDecoration(
// //           color: Database.secondary.withOpacity(0.3),
// //           borderRadius: BorderRadius.circular(20),
// //         ),
// //         child: Column(
// //           children: [
// //             CustomTextField(hint: "Nom complet"),
// //             SizedBox(height: 20),
// //             CustomTextField(hint: "Email"),
// //             SizedBox(height: 20),
// //             CustomTextField(hint: "Sujet"),
// //             SizedBox(height: 20),
// //             CustomTextField(hint: "Message", maxLines: 5),
// //             SizedBox(height: 30),
// //             CustomBut(
// //               width: double.infinity,
// //               text: "Envoyer",
// //               ontap: () {},
// //               height: 50,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// class CustomTextField extends StatelessWidget {
//   final String hint;
//   final int maxLines;

//   const CustomTextField({
//     super.key,
//     required this.hint,
//     this.maxLines = 1,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       maxLines: maxLines,
//       style: TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: TextStyle(color: Colors.white54),
//         filled: true,
//         fillColor: Colors.white.withOpacity(0.1),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     );
//   }
// }

// class ContactInfo extends StatelessWidget {
//   const ContactInfo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Informations de contact",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 30),
//         ContactInfoItem(
//           icon: Icons.location_on_outlined,
//           title: "Notre adresse",
//           content: "3559 Douala Bonanjo, Cameroun",
//         ),
//         SizedBox(height: 20),
//         ContactInfoItem(
//           icon: Icons.email_outlined,
//           title: "Email",
//           content: "contact@daacosdigicomagency.com",
//         ),
//         SizedBox(height: 20),
//         ContactInfoItem(
//           icon: Icons.phone_outlined,
//           title: "Téléphone",
//           content: "+237 456 789",
//         ),
//       ],
//     );
//   }
// }

// // class ContactInfoItem extends StatelessWidget {
// //   final IconData icon;
// //   final String title;
// //   final String content;

// //   const ContactInfoItem({
// //     super.key,
// //     required this.icon,
// //     required this.title,
// //     required this.content,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       children: [
// //         Container(
// //           padding: EdgeInsets.all(12),
// //           decoration: BoxDecoration(
// //             color: Database.primary.withOpacity(0.1),
// //             borderRadius: BorderRadius.circular(10),
// //           ),
// //           child: Icon(icon, color: Database.primary),
// //         ),
// //         SizedBox(width: 20),
// //         Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               title,
// //               style: TextStyle(
// //                 color: Colors.white,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             Text(
// //               content,
// //               style: TextStyle(color: Colors.white70, fontSize: 13),
// //             ),
// //           ],
// //         ),
// //       ],
// //     );
// //   }
// // }
