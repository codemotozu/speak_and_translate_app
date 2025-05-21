
import 'package:flutter/material.dart';
import 'package:github_pages_speak_and_translate/video_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
//test
void main() {
  runApp(const SpeakTranslateAIApp());
}

class SpeakTranslateAIApp extends StatelessWidget {
  const SpeakTranslateAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpeakAndTranslateAI',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Create a ScrollController
  final ScrollController _scrollController = ScrollController();

  // Create GlobalKeys for the sections
  final GlobalKey featuresKey = GlobalKey();
  final GlobalKey techStackKey = GlobalKey();
  final GlobalKey architectureKey = GlobalKey();
  final GlobalKey demoKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Method to handle scrolling to features section
  void _scrollToFeatures() {
    _scrollToSection(featuresKey);
  }

  // Method to handle scrolling to tech stack section
  void _scrollToTechStack() {
    _scrollToSection(techStackKey);
  }

  // Method to handle scrolling to architecture section
  void _scrollToArchitecture() {
    _scrollToSection(architectureKey);
  }

  // Method to handle scrolling to demo section
  void _scrollToDemo() {
    _scrollToSection(demoKey);
  }

  // Generic scroll method
  void _scrollToSection(GlobalKey key) {
    final RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    final double dy = box.localToGlobal(Offset.zero).dy;

    _scrollController.animateTo(
      dy,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(
              onFeaturesPressed: _scrollToFeatures,
              onTechStackPressed: _scrollToTechStack,
              onArchitecturePressed: _scrollToArchitecture,
              onDemoPressed: _scrollToDemo,
            ),
            FeaturesSection(key: featuresKey),
            TechStackSection(key: techStackKey),
            ArchitectureSection(key: architectureKey),
            VideoShowcaseSection(key: demoKey),
            CodeShowcaseSection(),
            ApiExamplesSection(),
            GitHubSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  final VoidCallback onFeaturesPressed;
  final VoidCallback onTechStackPressed;
  final VoidCallback onArchitecturePressed;
  final VoidCallback onDemoPressed;

  const HeroSection({
    super.key,
    required this.onFeaturesPressed,
    required this.onTechStackPressed,
    required this.onArchitecturePressed,
    required this.onDemoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage('assets/images/speak_and_translate_banner.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.7),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SpeakAndTranslateAI',
              style: GoogleFonts.inter(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Breaking language barriers with AI-powered voice translation',
              style: GoogleFonts.inter(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onFeaturesPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Features'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: onTechStackPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Tech Stack'),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: onArchitecturePressed,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Architecture'),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: onDemoPressed,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Video Demo'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: Column(
        children: [
          Text(
            'Key Features',
            style: GoogleFonts.inter(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    FeatureCard(
                      icon: FontAwesomeIcons.microphone,
                      title: 'Voice Commands',
                      description:
                          'Activate microphone with "Jarvis" and stop recording with "Alexa" for hands-free operation',
                    ),
                    FeatureCard(
                      icon: FontAwesomeIcons.language,
                      title: 'Real-time Translation',
                      description:
                          'Translate between multiple languages with AI-powered accuracy and natural speech',
                    ),
                    FeatureCard(
                      icon: FontAwesomeIcons.bookOpen,
                      title: 'Educational Features',
                      description:
                          'Word-by-word translations with accurate pronunciation in multiple languages like Spanish, German, and English',
                    ),
                  ],
                );
              } else {
                return Column(
                  children: const [
                    FeatureCard(
                      icon: FontAwesomeIcons.microphone,
                      title: 'Voice Commands',
                      description:
                          'Activate microphone with "Jarvis" and stop recording with "Alexa" for hands-free operation',
                    ),
                    SizedBox(height: 40),
                    FeatureCard(
                      icon: FontAwesomeIcons.language,
                      title: 'Real-time Translation',
                      description:
                          'Translate between multiple languages with AI-powered accuracy and natural speech',
                    ),
                    SizedBox(height: 40),
                    FeatureCard(
                      icon: FontAwesomeIcons.bookOpen,
                      title: 'Educational Features',
                      description:
                          'Word-by-word translations with accurate pronunciation in multiple languages like Spanish, German, and English',
                    ),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 60),
          Text(
            'Language Features',
            style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    FeatureCard(
                      icon: FontAwesomeIcons.solidUser,
                      title: 'Multiple Translation Styles',
                      description:
                          'Native, colloquial, informal, and formal translations to match any context',
                    ),
                    FeatureCard(
                      icon: FontAwesomeIcons.headphones,
                      title: 'Hands-Free Mode',
                      description:
                          'Automatically play translations for continuous conversation without touching the device',
                    ),
                    FeatureCard(
                      icon: FontAwesomeIcons.volumeHigh,
                      title: 'Bilingual Audio',
                      description:
                          'Hear source and translated words sequentially for effective language learning',
                    ),
                  ],
                );
              } else {
                return Column(
                  children: const [
                    FeatureCard(
                      icon: FontAwesomeIcons.solidUser,
                      title: 'Multiple Translation Styles',
                      description:
                          'Native, colloquial, informal, and formal translations to match any context',
                    ),
                    SizedBox(height: 40),
                    FeatureCard(
                      icon: FontAwesomeIcons.headphones,
                      title: 'Hands-Free Mode',
                      description:
                          'Automatically play translations for continuous conversation without touching the device',
                    ),
                    SizedBox(height: 40),
                    FeatureCard(
                      icon: FontAwesomeIcons.volumeHigh,
                      title: 'Bilingual Audio',
                      description:
                          'Hear source and translated words sequentially for effective language learning',
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          FaIcon(icon, size: 48, color: Colors.blue),
          const SizedBox(height: 24),
          Text(
            title,
            style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.inter(fontSize: 16, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100),
      color: Colors.black,
      child: Column(
        children: [
          Text(
            'Technology Stack',
            style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Powered by industry-leading technologies and frameworks',
            style: GoogleFonts.inter(fontSize: 20, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 1000) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TechStackColumn(
                      title: "Frontend",
                      items: [
                        TechItem(
                          icon: FontAwesomeIcons.mobile,
                          name: "Flutter/Dart",
                          description: "Cross-platform UI framework",
                        ),
                        TechItem(
                          icon: FontAwesomeIcons.diagramProject,
                          name: "Riverpod",
                          description: "State management solution",
                        ),
                        TechItem(
                          icon: FontAwesomeIcons.headset,
                          name: "Flutter Sound",
                          description: "Audio recording and playback",
                        ),
                      ],
                    ),
                    const SizedBox(width: 40),
                    TechStackColumn(
                      title: "Backend",
                      items: [
                        TechItem(
                          icon: FontAwesomeIcons.python,
                          name: "Python 3.9",
                          description: "Programming language",
                        ),
                        TechItem(
                          icon: FontAwesomeIcons.server,
                          name: "FastAPI",
                          description: "Web framework for APIs",
                        ),
                        TechItem(
                          icon: FontAwesomeIcons.docker,
                          name: "Docker",
                          description: "Containerization platform",
                        ),
                      ],
                    ),
                    const SizedBox(width: 40),
                    TechStackColumn(
                      title: "AI Services",
                      items: [
                        TechItem(
                          icon: FontAwesomeIcons.microsoft,
                          name: "Azure Speech",
                          description: "Speech recognition & synthesis",
                        ),
                        TechItem(
                          icon: FontAwesomeIcons.google,
                          name: "Gemini 2.0",
                          description: "AI translation & understanding",
                        ),
                        TechItem(
                          icon: FontAwesomeIcons.earListen,
                          name: "Picovoice",
                          description: "Wake word detection",
                        ),
                      ],
                    ),
                  ],
                );
              } else if (constraints.maxWidth > 600) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TechStackColumn(
                          title: "Frontend",
                          items: [
                            TechItem(
                              icon: FontAwesomeIcons.mobile,
                              name: "Flutter/Dart",
                              description: "Cross-platform UI framework",
                            ),
                            TechItem(
                              icon: FontAwesomeIcons.diagramProject,
                              name: "Riverpod",
                              description: "State management solution",
                            ),
                            TechItem(
                              icon: FontAwesomeIcons.headset,
                              name: "Flutter Sound",
                              description: "Audio recording and playback",
                            ),
                          ],
                        ),
                        const SizedBox(width: 40),
                        TechStackColumn(
                          title: "Backend",
                          items: [
                            TechItem(
                              icon: FontAwesomeIcons.python,
                              name: "Python 3.9",
                              description: "Programming language",
                            ),
                            TechItem(
                              icon: FontAwesomeIcons.server,
                              name: "FastAPI",
                              description: "Web framework for APIs",
                            ),
                            TechItem(
                              icon: FontAwesomeIcons.docker,
                              name: "Docker",
                              description: "Containerization platform",
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    TechStackColumn(
                      title: "AI Services",
                      items: [
                        TechItem(
                          icon: FontAwesomeIcons.microsoft,
                          name: "Azure Speech",
                          description: "Speech recognition & synthesis",
                        ),
                        TechItem(
                          icon: FontAwesomeIcons.google,
                          name: "Gemini 2.0",
                          description: "AI translation & understanding",
                        ),
                        TechItem(
                          icon: FontAwesomeIcons.earListen,
                          name: "Picovoice",
                          description: "Wake word detection",
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    TechStackColumn(
                      title: "Frontend",
                      items: [
                        TechItem(
                          icon: FontAwesomeIcons.mobile,
                          name: "Flutter/Dart",
                          description: "Cross-platform UI framework",
                        ),
                        TechItem(
                          icon: FontAwesomeIcons.diagramProject,
                          name: "Riverpod",
                          description: "State management solution",
                        ),
                        TechItem(
                          icon: FontAwesomeIcons.headset,
                          name: "Flutter Sound",
                          description: "Audio recording and playback",
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    TechStackColumn(
                      title: "Backend",
                      items: [
                        TechItem(
                          icon: FontAwesomeIcons.python,
                          name: "Python 3.9",
                          description: "Programming language",
                        ),
                        TechItem(
                          icon: FontAwesomeIcons.server,
                          name: "FastAPI",
                          description: "Web framework for APIs",
                        ),
                        TechItem(
                          icon: FontAwesomeIcons.docker,
                          name: "Docker",
                          description: "Containerization platform",
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    TechStackColumn(
                      title: "AI Services",
                      items: [
                        TechItem(
                          icon: FontAwesomeIcons.microsoft,
                          name: "Azure Speech",
                          description: "Speech recognition & synthesis",
                        ),
                        TechItem(
                          icon: FontAwesomeIcons.google,
                          name: "Gemini 2.0",
                          description: "AI translation & understanding",
                        ),
                        TechItem(
                          icon: FontAwesomeIcons.earListen,
                          name: "Picovoice",
                          description: "Wake word detection",
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class TechStackColumn extends StatelessWidget {
  final String title;
  final List<TechItem> items;

  const TechStackColumn({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: item,
          ),
        ),
      ],
    );
  }
}

class TechItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final String description;

  const TechItem({
    super.key,
    required this.icon,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: FaIcon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  description,
                  style: GoogleFonts.inter(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ArchitectureSection extends StatelessWidget {
  const ArchitectureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: Column(
        children: [
          Text(
            'System Architecture',
            style: GoogleFonts.inter(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Text(
            'How SpeakAndTranslateAI components work together',
            style: GoogleFonts.inter(fontSize: 20, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              double imageWidth =
                  constraints.maxWidth > 1000
                      ? 800
                      : constraints.maxWidth * 0.9;
              return Column(
                children: [
                  Container(
                    width: imageWidth,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/system_architecture.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: imageWidth,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'System Workflow',
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        WorkflowStep(
                          number: "1",
                          title: "Voice Input",
                          description:
                              "User speaks or activates the app with wake words \"Jarvis\" (start) or \"Alexa\" (stop) or you can simply tap the mic icon if you dont want to use the command voice",
                        ),
                        WorkflowStep(
                          number: "2",
                          title: "Speech Recognition",
                          description:
                              "Audio is captured and sent to Azure Speech Services for speech-to-text conversion",
                        ),
                        WorkflowStep(
                          number: "3",
                          title: "Translation Processing",
                          description:
                              "Text is analyzed and translated by Google's Gemini AI with multiple formality levels",
                        ),
                        WorkflowStep(
                          number: "4",
                          title: "Educational Enhancement",
                          description:
                              "Word-by-word translations and pronunciation guides are generated",
                        ),
                        WorkflowStep(
                          number: "5",
                          title: "Speech Synthesis",
                          description:
                              "The translation is converted back to speech using Azure's multilingual voices",
                        ),
                        WorkflowStep(
                          number: "6",
                          title: "User Presentation",
                          description:
                              "Results are displayed in the UI (User interface)",
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class WorkflowStep extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const WorkflowStep({
    super.key,
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.grey[600],
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

class VideoShowcaseSection extends StatelessWidget {
  const VideoShowcaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100),
      color: Colors.grey[100],
      child: Column(
        children: [
          Text(
            'See It In Action',
            style: GoogleFonts.inter(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Text(
            'Watch how SpeakAndTranslateAI translates languages in real-time',
            style: GoogleFonts.inter(fontSize: 20, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              double videoWidth =
                  constraints.maxWidth > 1200
                      ? 1024
                      : constraints.maxWidth > 800
                      ? constraints.maxWidth * 0.8
                      : constraints.maxWidth * 0.9;

              return Container(
                width: videoWidth,
                height: videoWidth * 9 / 16, // 16:9 aspect ratio
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Center(
                  child: const CustomVideoPlayer(
                    videoUrl: 'assets/images/speakandtranslatemp4format.mp4',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CodeShowcaseSection extends StatelessWidget {
  const CodeShowcaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1A1A1A), Colors.black],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: Column(
        children: [
          Text(
            'Core Technology',
            style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            'Python FastAPI Backend with Azure and Gemini AI',
            style: GoogleFonts.inter(fontSize: 20, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              double codeWidth =
                  constraints.maxWidth > 1200
                      ? 1024
                      : constraints.maxWidth > 800
                      ? constraints.maxWidth * 0.8
                      : constraints.maxWidth * 0.9;

              return Container(
                width: codeWidth,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: 
           Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Color(0xFF2D2D2D),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              16.0), // ?Adjust the radius as needed
                          child: Image.asset(
                            'assets/images/carbon.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              
              );
            },
          ),
          const SizedBox(height: 80),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CodeFeatureCard(
                      icon: FontAwesomeIcons.bolt,
                      title: "FastAPI Framework",
                      description:
                          "High-performance Python web framework optimized for API development with automatic OpenAPI docs generation",
                    ),
                    CodeFeatureCard(
                      icon: FontAwesomeIcons.microchip,
                      title: "AI Integration",
                      description:
                          "Seamless integration with Google's Gemini API for advanced natural language processing and translation",
                    ),
                    CodeFeatureCard(
                      icon: FontAwesomeIcons.brain,
                      title: "Azure Cognitive Services",
                      description:
                          "Cloud-based AI services for text-to-speech and speech-to-text with multilingual support",
                    ),
                  ],
                );
              } else {
                return Column(
                  children: const [
                    CodeFeatureCard(
                      icon: FontAwesomeIcons.bolt,
                      title: "FastAPI Framework",
                      description:
                          "High-performance Python web framework optimized for API development with automatic OpenAPI docs generation",
                    ),
                    SizedBox(height: 40),
                    CodeFeatureCard(
                      icon: FontAwesomeIcons.microchip,
                      title: "AI Integration",
                      description:
                          "Seamless integration with Google's Gemini API for advanced natural language processing and translation",
                    ),
                    SizedBox(height: 40),
                    CodeFeatureCard(
                      icon: FontAwesomeIcons.brain,
                      title: "Azure Cognitive Services",
                      description:
                          "Cloud-based AI services for text-to-speech and speech-to-text with multilingual support",
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class CodeFeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const CodeFeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          FaIcon(icon, size: 48, color: Colors.blue[400]),
          const SizedBox(height: 24),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.inter(fontSize: 16, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ApiExamplesSection extends StatelessWidget {
  const ApiExamplesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: Column(
        children: [
          Text(
            'API Endpoints',
            style: GoogleFonts.inter(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Text(
            'Key endpoints powering the translation functionality',
            style: GoogleFonts.inter(fontSize: 20, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              double cardWidth =
                  constraints.maxWidth > 1000
                      ? 900
                      : constraints.maxWidth * 0.9;
              if (constraints.maxWidth > 800) {
                return Column(
                  children: [
                    ApiEndpointCard(
                      width: cardWidth,
                      endpoint: "/api/conversation",
                      method: "POST",
                      description:
                          "Translates text with multilingual support and returns rich metadata including word-by-word translations",
                      requestSample: '''{
  "text": "Hello, how are you?",
  "source_lang": "en",
  "target_lang": "de"
}''',
                      responseSample: '''{
  "original_text": "Hello, how are you?",
  "translated_text": "Hallo, wie geht es dir?",
  "source_language": "en",
  "target_language": "de",
  "audio_path": "speech_20230615_123045.mp3",
  "translations": {
    "main": "Hallo, wie geht es dir?",
    "formal": "Hallo, wie geht es Ihnen?",
    "informal": "Hi, wie gehts?",
    "colloquial": "Moin, wie läufts?"
  },
  "word_by_word": {
    "Hello": {
      "translation": "Hallo",
      "pos": "interjection"
    },
    "how": {
      "translation": "wie",
      "pos": "adverb"
    },
    "are": {
      "translation": "geht",
      "pos": "verb"
    },
    "you": {
      "translation": "dir",
      "pos": "pronoun"
    }
  }
}''',
                    ),
                    const SizedBox(height: 40),
                    ApiEndpointCard(
                      width: cardWidth,
                      endpoint: "/api/speech-to-text",
                      method: "POST",
                      description:
                          "Converts uploaded audio files to text using Azure Speech Services with multi-language support",
                      requestSample: "Multipart form data with audio file",
                      responseSample: '''{
  "text": "Hello, my name is John and I would like to learn German."
}''',
                    ),
                    const SizedBox(height: 40),
                    ApiEndpointCard(
                      width: cardWidth,
                      endpoint: "/api/audio/{filename}",
                      method: "GET",
                      description:
                          "Retrieves generated audio files for playback of translations",
                      requestSample:
                          "GET /api/audio/speech_20230615_123045.mp3",
                      responseSample: "Audio file (MP3)",
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    ApiEndpointCard(
                      width: cardWidth,
                      endpoint: "/api/conversation",
                      method: "POST",
                      description:
                          "Translates text with multilingual support and returns rich metadata including word-by-word translations",
                      requestSample: '''{
  "text": "Hello, how are you?",
  "source_lang": "en",
  "target_lang": "de"
}''',
                      responseSample: '''{
  "original_text": "Hello, how are you?",
  "translated_text": "Hallo, wie geht es dir?",
  "source_language": "en",
  "target_language": "de",
  "audio_path": "speech_20230615_123045.mp3",
  "translations": {
    "main": "Hallo, wie geht es dir?",
    "formal": "Hallo, wie geht es Ihnen?",
    "informal": "Hi, wie gehts?",
    "colloquial": "Moin, wie läufts?"
  },
  "word_by_word": {
    "Hello": {
      "translation": "Hallo",
      "pos": "interjection"
    },
    "how": {
      "translation": "wie",
      "pos": "adverb"
    },
    "are": {
      "translation": "geht",
      "pos": "verb"
    },
    "you": {
      "translation": "dir",
      "pos": "pronoun"
    }
  }
}''',
                    ),
                    const SizedBox(height: 40),
                    ApiEndpointCard(
                      width: cardWidth,
                      endpoint: "/api/speech-to-text",
                      method: "POST",
                      description:
                          "Converts uploaded audio files to text using Azure Speech Services with multi-language support",
                      requestSample: "Multipart form data with audio file",
                      responseSample: '''{
  "text": "Hello, my name is John and I would like to learn German."
}''',
                    ),
                    const SizedBox(height: 40),
                    ApiEndpointCard(
                      width: cardWidth,
                      endpoint: "/api/audio/{filename}",
                      method: "GET",
                      description:
                          "Retrieves generated audio files for playback of translations",
                      requestSample:
                          "GET /api/audio/speech_20230615_123045.mp3",
                      responseSample: "Audio file (MP3)",
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class ApiEndpointCard extends StatelessWidget {
  final double width;
  final String endpoint;
  final String method;
  final String description;
  final String requestSample;
  final String responseSample;

  const ApiEndpointCard({
    super.key,
    required this.width,
    required this.endpoint,
    required this.method,
    required this.description,
    required this.requestSample,
    required this.responseSample,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(//
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    method,
                    style: GoogleFonts.jetBrainsMono(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  endpoint,
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Request:",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              requestSample,
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 14,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Response:",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              responseSample,
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 14,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GitHubSection extends StatelessWidget {
  const GitHubSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: Column(
        children: [
          const FaIcon(FontAwesomeIcons.github, size: 64),
          const SizedBox(height: 32),
          Text(
            'Open Source Project',
            style: GoogleFonts.inter(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Text(
            'Join us in breaking language barriers with AI-powered translation.',
            style: GoogleFonts.inter(fontSize: 20, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  final url = Uri.parse(
                    //
                    'https://github.com/codemotozu/Documented_Speak_and_Translate_App/tree/main/lib',
                  );
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                icon: const FaIcon(FontAwesomeIcons.github),
                label: const Text('Frontend Repository'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: () async {
                  final url = Uri.parse(
                    'https://github.com/codemotozu/Documented_Speak_and_Translate_App/tree/main/server',
                  );
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                icon: const FaIcon(FontAwesomeIcons.server),
                label: const Text('Backend Repository'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),


     const SizedBox(width: 16),
                 ElevatedButton.icon(
            onPressed: () async {
              final url = Uri.parse(
                'https://github.com/codemotozu/Documented_Speak_and_Translate_App/tree/main',
              );
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            icon: const FaIcon(FontAwesomeIcons.github),
            label: const Text('View Repository'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
            ],
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      color: Colors.black,
      child: Center(
        child: Text(
          '© 2025 SpeakAndTranslateAI. All rights reserved.',
          style: GoogleFonts.inter(color: Colors.white70),
        ),
      ),
    );
  }
}
