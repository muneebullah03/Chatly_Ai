import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController promptController = TextEditingController();

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050816),
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),

                    const SizedBox(height: 30),

                    _buildGreeting(),

                    const SizedBox(height: 24),

                    _buildPromptBox(),

                    const SizedBox(height: 32),

                    _buildSectionTitle(
                      title: 'Explore AI',
                      subtitle: 'Powerful tools at your fingertips',
                    ),

                    const SizedBox(height: 16),

                    _buildToolsGrid(),

                    const SizedBox(height: 32),

                    _buildSectionTitle(
                      title: 'Recent conversations',
                      subtitle: 'Continue where you left off',
                    ),

                    const SizedBox(height: 16),

                    _buildRecentChats(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  // ─────────────────────────────────────────────
  // HEADER
  // ─────────────────────────────────────────────

  Widget _buildHeader() {
    return Row(
      children: [
        // LOGO
        Container(
          width: 46,
          height: 46,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF6C63FF), Color(0xFF00D9FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6C63FF).withOpacity(0.25),
                blurRadius: 20,
              ),
            ],
          ),
          child: const Icon(
            Icons.auto_awesome_rounded,
            color: Colors.white,
            size: 24,
          ),
        ),

        const SizedBox(width: 12),

        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chatly AI',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Your AI companion',
              style: TextStyle(color: Colors.white38, fontSize: 11),
            ),
          ],
        ),

        const Spacer(),

        _buildHeaderButton(
          icon: Icons.notifications_none_rounded,
          onTap: () {},
        ),

        const SizedBox(width: 8),

        _buildHeaderButton(icon: Icons.settings_outlined, onTap: () {}),
      ],
    );
  }

  Widget _buildHeaderButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.07)),
        ),
        child: Icon(icon, color: Colors.white70, size: 20),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // GREETING
  // ─────────────────────────────────────────────

  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Good evening 👋',
          style: TextStyle(
            color: Colors.white60,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),

        const SizedBox(height: 8),

        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [Colors.white, Color(0xFFB7B1FF), Color(0xFF70E7FF)],
            ).createShader(bounds);
          },
          child: const Text(
            'What can I help you\nwith today?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 31,
              height: 1.15,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // AI PROMPT
  // ─────────────────────────────────────────────

  Widget _buildPromptBox() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [const Color(0xFF15152D), const Color(0xFF0D1224)],
        ),
        border: Border.all(color: const Color(0xFF6C63FF).withOpacity(0.25)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withOpacity(0.08),
            blurRadius: 30,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          TextField(
            controller: promptController,
            maxLines: 3,
            minLines: 1,
            style: const TextStyle(color: Colors.white, fontSize: 15),
            decoration: InputDecoration(
              hintText: 'Ask anything, create an image...',
              hintStyle: const TextStyle(color: Colors.white30, fontSize: 14),
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(bottom: 28, right: 10),
                child: Icon(
                  Icons.auto_awesome_rounded,
                  color: const Color(0xFF8B83FF),
                  size: 21,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              _buildPromptAction(
                icon: Icons.image_outlined,
                label: 'Image',
                onTap: () {
                  Get.toNamed('/image-generator');
                },
              ),

              const SizedBox(width: 8),

              _buildPromptAction(
                icon: Icons.translate_rounded,
                label: 'Translate',
                onTap: () {
                  Get.toNamed('/translate');
                },
              ),

              const Spacer(),

              // SEND
              GestureDetector(
                onTap: () {
                  if (promptController.text.trim().isEmpty) {
                    return;
                  }

                  Get.toNamed('/chat', arguments: promptController.text.trim());

                  promptController.clear();
                },
                child: Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6C63FF), Color(0xFF00D9FF)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6C63FF).withOpacity(0.35),
                        blurRadius: 18,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_upward_rounded,
                    color: Colors.white,
                    size: 23,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPromptAction({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: Colors.white60),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // SECTION TITLE
  // ─────────────────────────────────────────────

  Widget _buildSectionTitle({required String title, required String subtitle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white30, fontSize: 11),
            ),
          ],
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // AI TOOLS
  // ─────────────────────────────────────────────

  Widget _buildToolsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.35,
      children: [
        _buildToolCard(
          icon: Icons.chat_bubble_outline_rounded,
          title: 'AI Chat',
          subtitle: 'Ask anything',
          gradient: const [Color(0xFF6C63FF), Color(0xFF453D9B)],
          onTap: () {
            Get.toNamed('/chat');
          },
        ),

        _buildToolCard(
          icon: Icons.image_outlined,
          title: 'AI Image',
          subtitle: 'Create anything',
          gradient: const [Color(0xFF00D9FF), Color(0xFF087D99)],
          onTap: () {
            Get.toNamed('/image-generator');
          },
        ),

        _buildToolCard(
          icon: Icons.translate_rounded,
          title: 'Translator',
          subtitle: 'Translate text',
          gradient: const [Color(0xFF9B5CFF), Color(0xFF5B319B)],
          onTap: () {
            Get.toNamed('/translate');
          },
        ),

        _buildToolCard(
          icon: Icons.auto_awesome_rounded,
          title: 'AI Tools',
          subtitle: 'Explore more',
          gradient: const [Color(0xFFFF6BCB), Color(0xFF8B3E91)],
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildToolCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required List<Color> gradient,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white.withOpacity(0.045),
          border: Border.all(color: Colors.white.withOpacity(0.07)),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      gradient.first.withOpacity(0.20),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 43,
                  height: 43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: LinearGradient(colors: gradient),
                    boxShadow: [
                      BoxShadow(
                        color: gradient.first.withOpacity(0.25),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Icon(icon, color: Colors.white, size: 21),
                ),

                const Spacer(),

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white38, fontSize: 11),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // RECENT CHATS
  // ─────────────────────────────────────────────

  Widget _buildRecentChats() {
    return Column(
      children: [
        _buildRecentChat(
          icon: Icons.code_rounded,
          title: 'Explain Flutter BLoC',
          time: 'Today, 4:32 PM',
        ),

        const SizedBox(height: 10),

        _buildRecentChat(
          icon: Icons.auto_awesome_rounded,
          title: 'Create a futuristic city',
          time: 'Yesterday',
        ),

        const SizedBox(height: 10),

        _buildRecentChat(
          icon: Icons.translate_rounded,
          title: 'Translate English to Urdu',
          time: 'Aug 18',
        ),
      ],
    );
  }

  Widget _buildRecentChat({
    required IconData icon,
    required String title,
    required String time,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.035),
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: const Color(0xFF6C63FF).withOpacity(0.10),
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Icon(
                Icons.chat_bubble_outline_rounded,
                color: Color(0xFF9B95FF),
                size: 19,
              ),
            ),

            const SizedBox(width: 13),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    time,
                    style: const TextStyle(color: Colors.white30, fontSize: 10),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.chevron_right_rounded,
              color: Colors.white24,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // BOTTOM NAVIGATION
  // ─────────────────────────────────────────────

  Widget _buildBottomNavigation() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 18),
      height: 68,
      decoration: BoxDecoration(
        color: const Color(0xFF101326).withOpacity(0.96),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.chat_bubble_rounded,
            label: 'Chat',
            index: 0,
          ),

          _buildNavItem(
            icon: Icons.auto_awesome_rounded,
            label: 'Create',
            index: 1,
          ),

          _buildNavItem(
            icon: Icons.translate_rounded,
            label: 'Translate',
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });

        if (index == 0) {
          Get.toNamed('/chat');
        } else if (index == 1) {
          Get.toNamed('/image-generator');
        } else if (index == 2) {
          Get.toNamed('/translate');
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected
              ? const Color(0xFF6C63FF).withOpacity(0.12)
              : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 21,
              color: isSelected ? const Color(0xFF8B83FF) : Colors.white38,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white38,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
