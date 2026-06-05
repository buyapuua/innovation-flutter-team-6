import 'package:flutter/material.dart';

void main() {
  runApp(const InnovationHelloApp());
}

class InnovationHelloApp extends StatelessWidget {
  const InnovationHelloApp({super.key});

  static const Color residentEvilRed = Color(0xFF8B0000);
  static const Color darkBg = Color(0xFF1A1A1A);
  static const Color surfaceDark = Color(0xFF2D2D2D);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '新人policeman首页',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: darkBg,
        colorScheme: const ColorScheme.dark(
          primary: residentEvilRed,
          secondary: residentEvilRed,
          surface: surfaceDark,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Color(0xFFE0E0E0),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0D0D0D),
          foregroundColor: residentEvilRed,
          elevation: 2,
          shadowColor: residentEvilRed,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: residentEvilRed,
          foregroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const HelloHomePage(),
    );
  }
}

class HelloHomePage extends StatefulWidget {
  const HelloHomePage({super.key});

  @override
  State<HelloHomePage> createState() => _HelloHomePageState();
}

class _HelloHomePageState extends State<HelloHomePage> {
  int workDays = 0;

  void checkIn() {
    setState(() {
      workDays += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '新人policeman首页',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A1A),
              Color(0xFF0D0D0D),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Resident Evil style divider
                Container(
                  width: 120,
                  height: 2,
                  color: const Color(0xFF8B0000),
                  margin: const EdgeInsets.only(bottom: 24),
                ),
                const Icon(
                  Icons.warning_amber_rounded,
                  size: 72,
                  color: Color(0xFF8B0000),
                ),
                const SizedBox(height: 24),
                const Text(
                  '浣熊市新人policeman上班打卡',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFCC0000),
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 24),
                // Bottom divider
                Container(
                  width: 120,
                  height: 2,
                  color: const Color(0xFF8B0000),
                  margin: const EdgeInsets.only(bottom: 16),
                ),
                const Text(
                  '姓名：jinjinjin ｜ 学号：****0195 ｜ 小组：第 6 组',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF666666),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF8B0000).withAlpha(100),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        '上岗时长',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF666666),
                          letterSpacing: 4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$workDays',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFCC0000),
                          letterSpacing: 8,
                        ),
                      ),
                      const Text(
                        '天',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF888888),
                          letterSpacing: 4,
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: checkIn,
        icon: const Icon(Icons.shield),
        label: const Text('上班打卡'),
      ),
    );
  }
}
