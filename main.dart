import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    DeveloperProfileScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: const Color(0xff1f238d),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}



class DeveloperProfileScreen extends StatelessWidget {
  const DeveloperProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeef2ff),
      appBar: AppBar(
        title: const Text(
          "Developer Profile",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff1f238d),
      ),
      body: Center(
        child: Card(
          elevation: 8,
          shadowColor: Colors.black45,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: 330,
            decoration: BoxDecoration(
              color: const Color(0xfffff8ff),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 38,
                      backgroundColor: Color(0xff24249b),
                      child: Text(
                        "AD",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Arnob Das",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "CSE · 63rd Batch",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: Color(0xff24249b),
                            ),
                            Text(
                              "Sylhet, Bangladesh",
                              style: TextStyle(
                                color: Color(0xff24249b),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 25),
                const Divider(),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      ProfileStat(
                        number: "12",
                        title: "Posts",
                        color: Colors.deepOrange,
                      ),
                      ProfileStat(
                        number: "340",
                        title: "Followers",
                        color: Colors.green,
                      ),
                      ProfileStat(
                        number: "98",
                        title: "Following",
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),

                const Divider(),

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: const [
                      SkillChip(text: "Flutter", color: Colors.deepOrange),
                      SkillChip(text: "Dart", color: Colors.indigo),
                      SkillChip(text: "UI/UX", color: Colors.green),
                      SkillChip(text: "Git", color: Colors.purple),
                      SkillChip(text: "Firebase", color: Colors.orange),
                    ],
                  ),
                ),

                const Divider(),

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff24249b),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.person_add,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Follow",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.message,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Message",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileStat extends StatelessWidget {
  final String number;
  final String title;
  final Color color;

  const ProfileStat({
    super.key,
    required this.number,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            color: color,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class SkillChip extends StatelessWidget {
  final String text;
  final Color color;

  const SkillChip({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: color,
      label: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}



class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeef3f5),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 45, bottom: 20),
            color: const Color(0xff6f8c99),
            child: Column(
              children: [
                const Text(
                  "⚙ Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child: const Text(
                        "👨‍💻",
                        style: TextStyle(fontSize: 28),
                      ),
                    ),

                    const SizedBox(width: 15),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Your Name",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const Text(
                          "CSE · 53rd Batch",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),

                        const SizedBox(height: 8),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.25),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(95, 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Edit Profile →",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle(title: "ACCOUNT"),

                    SettingsCard(
                      children: const [
                        SettingsItem(
                          icon: Icons.person_outline,
                          iconColor: Colors.blue,
                          iconBg: Color(0xffe1ecff),
                          title: "My Profile",
                          subtitle: "View & edit your info",
                        ),
                        SettingsItem(
                          icon: Icons.remove_red_eye_outlined,
                          iconColor: Colors.red,
                          iconBg: Color(0xffffe5ec),
                          title: "Privacy",
                          subtitle: "Manage permissions",
                        ),
                        SettingsItem(
                          icon: Icons.security,
                          iconColor: Colors.green,
                          iconBg: Color(0xffe0f5e9),
                          title: "Security",
                          subtitle: "Password & 2FA",
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    const SectionTitle(title: "PREFERENCES"),

                    SettingsCard(
                      children: const [
                        SettingsItem(
                          icon: Icons.dark_mode_outlined,
                          iconColor: Colors.deepPurple,
                          iconBg: Color(0xffeee6ff),
                          title: "Dark Mode",
                          subtitle: "",
                        ),
                        SettingsItem(
                          icon: Icons.notifications_none,
                          iconColor: Colors.orange,
                          iconBg: Color(0xfffff1d6),
                          title: "Notifications",
                          subtitle: "",
                        ),
                        SettingsItem(
                          icon: Icons.language,
                          iconColor: Colors.teal,
                          iconBg: Color(0xffddf5f1),
                          title: "Language",
                          subtitle: "Bangla",
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.logout),
                        label: const Text(
                          "Log Out",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final List<Widget> children;

  const SettingsCard({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: const Color(0xfffff7ff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final String subtitle;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: iconBg,
            child: Icon(
              icon,
              color: iconColor,
              size: 22,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          subtitle: subtitle.isEmpty
              ? null
              : Text(
            subtitle,
            style: const TextStyle(fontSize: 12),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
        ),
        Divider(
          height: 1,
          color: Colors.grey.shade300,
        ),
      ],
    );
  }
}