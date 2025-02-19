import 'package:daacos_website/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:daacos_website/database/database.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Title(
      title: PageTitles.about,
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Database.secondary,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: GlobalAppBar(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/recrutement.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                width: double.infinity,
                height: 350,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Database.secondary.withOpacity(0.7),
                    ),
                    Center(
                      child: SizedBox(
                        height: 200,
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "About us\n",
                                  style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "Découvrez notre équipe et nos valeurs",
                                  style: TextStyle(
                                    color: Colors.white38,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ValuesSection(),
              TeamSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class ValuesSection extends StatelessWidget {
  final List<Map<String, dynamic>> values = const [
    {
      'title': 'Innovation',
      'description':
          'Nous repoussons constamment les limites du possible pour créer des solutions numériques innovantes.',
      'icon': Icons.lightbulb_outline,
    },
    {
      'title': 'Excellence',
      'description':
          'Nous nous engageons à délivrer un travail de la plus haute qualité dans chaque projet.',
      'icon': Icons.star_outline,
    },
    {
      'title': 'Intégrité',
      'description':
          'Nous agissons avec honnêteté et transparence dans toutes nos interactions.',
      'icon': Icons.verified_user_outlined,
    },
  ];

  const ValuesSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDesktop = width > 1100;
    bool isTablet = width > 500;

    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop
            ? width / 6.3
            : isTablet
                ? 150
                : 20,
        vertical: 40,
      ),
      color: Database.secondary,
      child: Column(
        children: [
          Text(
            "Nos Valeurs",
            style: TextStyle(
              color: Colors.white,
              fontSize: isDesktop ? 42 : 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 25),
          GridView.builder(
            shrinkWrap: true,
            itemCount: values.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isDesktop
                  ? 3
                  : isTablet
                      ? 2
                      : 1,
              childAspectRatio: isDesktop
                  ? 1.2
                  : isTablet
                      ? 1.1
                      : 1.3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return ValueCard(
                title: values[index]["title"],
                description: values[index]["description"],
                icon: values[index]['icon'],
                width: isDesktop
                    ? width * 0.25
                    : isTablet
                        ? width * 0.4
                        : width * 0.8,
              );
            },
          )
        ],
      ),
    );
  }
}

class ValueCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final double width;

  const ValueCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.width,
  });

  @override
  State<ValueCard> createState() => _ValueCardState();
}

class _ValueCardState extends State<ValueCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDesktop = width > 1100;
    bool isTablet = width > 500;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(20),
        transform: isHovered
            ? Matrix4.translationValues(0, -7, 0)
            : Matrix4.identity(),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isHovered
              ? Database.primary.withOpacity(0.1)
              : Colors.transparent,
          border: Border.all(color: Database.primary.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: Database.primary,
              size: isDesktop ? 50 : 40,
            ),
            SizedBox(height: 20),
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: isDesktop ? 24 : 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: isDesktop ? 16 : 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamSection extends StatelessWidget {
  final List<Map<String, String>> team = const [
    {
      'name': 'John Doe',
      'role': 'PDG & Fondateur',
      'image': 'assets/images/team/member1.jpg',
    },
    {
      'name': 'Jane Smith',
      'role': 'Directrice Marketing',
      'image': 'assets/images/team/member2.jpg',
    },
    {
      'name': 'Mike Johnson',
      'role': 'Lead Developer',
      'image': 'assets/images/team/member3.jpg',
    },
  ];

  const TeamSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isDesktop = width > 1100;
    bool isTablet = width > 500;

    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop
            ? width / 6.3
            : isTablet
                ? 50
                : 20,
        vertical: 60,
      ),
      color: Color(0xff122150),
      child: Column(
        children: [
          Text(
            "Notre Équipe",
            style: TextStyle(
              color: Colors.white,
              fontSize: isDesktop ? 42 : 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: team.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isDesktop
                  ? 3
                  : isTablet
                      ? 2
                      : 1,
              childAspectRatio: 0.8,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            itemBuilder: (context, index) {
              return TeamMemberCard(
                name: team[index]['name']!,
                role: team[index]['role']!,
                image: team[index]['image']!,
                width: isDesktop
                    ? width * 0.25
                    : isTablet
                        ? width * 0.4
                        : width * 0.8,
              );
            },
          ),
        ],
      ),
    );
  }
}

class TeamMemberCard extends StatefulWidget {
  final String name;
  final String role;
  final String image;
  final double width;

  const TeamMemberCard({
    super.key,
    required this.name,
    required this.role,
    required this.image,
    required this.width,
  });

  @override
  State<TeamMemberCard> createState() => _TeamMemberCardState();
}

class _TeamMemberCardState extends State<TeamMemberCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: widget.width,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isHovered
              ? Database.primary.withOpacity(0.1)
              : Colors.transparent,
          border: Border.all(color: Database.primary.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(widget.image),
            ),
            SizedBox(height: 20),
            Text(
              widget.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              widget.role,
              style: TextStyle(
                color: Database.primary,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIconButton(icon: Icons.facebook, onPressed: () {}),
                SocialIconButton(icon: Icons.tiktok, onPressed: () {}),
                SocialIconButton(icon: Icons.link, onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SocialIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: IconButton(
        icon: Icon(
          widget.icon,
          color: isHovered ? Database.primary : Colors.white,
        ),
        onPressed: widget.onPressed,
      ),
    );
  }
}
