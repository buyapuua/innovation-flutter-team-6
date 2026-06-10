import 'package:flutter/material.dart';

void main() {
  runApp(const InnovationHelloApp());
}

class InnovationHelloApp extends StatelessWidget {
  const InnovationHelloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '创新实验 Flutter 入门',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
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
  int _completedTasks = 0;
  int _currentIndex = 0;

  void _finishOneTask() {
    setState(() {
      _completedTasks += 1;
    });
  }

  void _resetTasks() {
    setState(() {
      _completedTasks = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          '7even5ive的创新实验flutter首页',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          _buildTechBackground(),
          IndexedStack(
            index: _currentIndex,
            children: [
              _buildHomePage(colorScheme),
              _buildAboutPage(colorScheme),
              _buildRecordPage(colorScheme),
            ],
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color(0xFF0F172A).withOpacity(0.8),
        indicatorColor: const Color(0xFF6366F1),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: '首页',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: '关于',
          ),
          NavigationDestination(
            icon: Icon(Icons.data_exploration),
            label: '记录',
          ),
        ],
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton.extended(
              onPressed: _finishOneTask,
              icon: const Icon(Icons.rocket_launch),
              label: const Text('开始任务'),
              backgroundColor: const Color(0xFF6366F1),
              foregroundColor: Colors.white,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            )
          : null,
    );
  }

  Widget _buildTechBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F172A),
            Color(0xFF1E1B4B),
            Color(0xFF0F172A),
          ],
        ),
      ),
      child: Stack(
        children: [
          _buildGridPattern(),
          _buildGlowEffects(),
        ],
      ),
    );
  }

  Widget _buildGridPattern() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.network(
            'https://picsum.photos/100/100?grayscale&blur=2',
          ).image,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            const Color(0xFF6366F1).withOpacity(0.1),
            BlendMode.overlay,
          ),
        ),
      ),
      child: CustomPaint(
        painter: GridPainter(),
      ),
    );
  }

  Widget _buildGlowEffects() {
    return Positioned(
      top: 100,
      right: 50,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              const Color(0xFF6366F1).withOpacity(0.3),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomePage(ColorScheme colorScheme) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            _buildRobotAvatar(colorScheme),
            const SizedBox(height: 24),
            _buildMainTitle(colorScheme),
            const SizedBox(height: 32),
            _buildInfoCard(colorScheme),
            const SizedBox(height: 24),
            _buildStatsCard(colorScheme),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildRobotAvatar(ColorScheme colorScheme) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                const Color(0xFF6366F1),
                const Color(0xFF8B5CF6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6366F1).withOpacity(0.5),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
              BoxShadow(
                color: const Color(0xFF8B5CF6).withOpacity(0.3),
                blurRadius: 40,
                offset: const Offset(-10, 0),
              ),
            ],
          ),
        ),
        Container(
          width: 120,
          height: 120,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF1E1B4B),
          ),
          child: const Icon(
            Icons.android,
            size: 60,
            color: Colors.white,
          ),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
              boxShadow: [
                BoxShadow(
                  color: Colors.green,
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Icon(Icons.check, size: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildMainTitle(ColorScheme colorScheme) {
    return Column(
      children: [
        Text(
          'Hello, Tech Explorer!',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          '第14周 Flutter 创新实验',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: const Color(0xFFA5B4FC),
              ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(ColorScheme colorScheme) {
    return Card(
      elevation: 8,
      color: const Color(0xFF1E1B4B).withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: const Color(0xFF6366F1).withOpacity(0.3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _techInfoRow(Icons.person, '姓名', '文祺武'),
            const Divider(height: 24, color: Colors.white12),
            _techInfoRow(Icons.numbers, '学号', '20231060116'),
            const Divider(height: 24, color: Colors.white12),
            _techInfoRow(Icons.group, '小组', '第6组'),
            const Divider(height: 24, color: Colors.white12),
            _techInfoRow(Icons.school, '专业', '智能科学与技术'),
            const Divider(height: 24, color: Colors.white12),
            _techInfoRow(Icons.code, '课程', '创新实验'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard(ColorScheme colorScheme) {
    return Card(
      elevation: 8,
      color: const Color(0xFF6366F1).withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: const Color(0xFF6366F1).withOpacity(0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF6366F1),
                  ),
                  child: const Icon(
                    Icons.circle,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '任务完成次数',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFFA5B4FC),
                          ),
                    ),
                    Text(
                      '$_completedTasks',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_completedTasks > 0)
              Text(
                _completedTasks >= 5
                    ? '🚀 超级模式已激活！'
                    : _completedTasks >= 3
                        ? '⚡ 效率提升中！'
                        : '✨ 良好的开始！',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: const Color(0xFF8B5CF6),
                    ),
              ),
            if (_completedTasks > 0)
              const SizedBox(height: 12),
            if (_completedTasks > 0)
              TextButton.icon(
                onPressed: _resetTasks,
                icon: const Icon(Icons.refresh),
                label: const Text('重置'),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFFA5B4FC),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutPage(ColorScheme colorScheme) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Text(
              '技术档案',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 20),
            _buildSkillSection(colorScheme),
            const SizedBox(height: 24),
            _buildProjectSection(colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillSection(ColorScheme colorScheme) {
    return Card(
      elevation: 4,
      color: const Color(0xFF1E1B4B).withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.computer, color: Color(0xFF6366F1)),
                const SizedBox(width: 12),
                Text(
                  '技能矩阵',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _skillBar('Flutter', 85, const Color(0xFF6366F1)),
            const SizedBox(height: 12),
            _skillBar('Python', 90, const Color(0xFF34D399)),
            const SizedBox(height: 12),
            _skillBar('Java', 75, const Color(0xFFFBBF24)),
            const SizedBox(height: 12),
            _skillBar('Machine Learning', 80, const Color(0xFFF472B6)),
            const SizedBox(height: 12),
            _skillBar('Data Science', 70, const Color(0xFF06B6D4)),
          ],
        ),
      ),
    );
  }

  Widget _skillBar(String name, int percentage, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '$percentage%',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white10,
          ),
          child: FractionallySizedBox(
            widthFactor: percentage / 100,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: LinearGradient(
                  colors: [color, color.withOpacity(0.5)],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProjectSection(ColorScheme colorScheme) {
    return Card(
      elevation: 4,
      color: const Color(0xFF1E1B4B).withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.folder_open, color: Color(0xFF8B5CF6)),
                const SizedBox(width: 12),
                Text(
                  '项目仓库',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _projectCard('AI Assistant', '智能助手应用开发', 'NLP + Flutter'),
            const SizedBox(height: 12),
            _projectCard('Data Viz', '数据可视化平台', 'D3.js + Python'),
            const SizedBox(height: 12),
            _projectCard('IoT Hub', '物联网控制中心', 'MQTT + Firebase'),
          ],
        ),
      ),
    );
  }

  Widget _projectCard(String name, String desc, String tags) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF0F172A),
        border: Border.all(
          color: const Color(0xFF6366F1).withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFFA5B4FC),
                ),
          ),
          const SizedBox(height: 8),
          Text(
            tags,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF6366F1),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecordPage(ColorScheme colorScheme) {
    final List<Map<String, dynamic>> tasks = List.generate(
      _completedTasks.clamp(0, 10),
      (i) => {'id': i + 1, 'time': DateTime.now().add(Duration(hours: -i))},
    );

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          Text(
            '任务日志',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 20),
          if (tasks.isEmpty)
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    const Icon(
                      Icons.inbox_outlined,
                      size: 80,
                      color: Color(0xFF6366F1),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '暂无任务记录',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '去首页完成你的第一个任务吧！',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFFA5B4FC),
                          ),
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return _taskItem(task['id'] as int, task['time'] as DateTime);
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _taskItem(int id, DateTime time) {
    return Card(
      elevation: 2,
      color: const Color(0xFF1E1B4B).withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
            ),
          ),
          child: Center(
            child: Text(
              '$id',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        title: const Text(
          'Flutter 学习打卡',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          '完成于 ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
          style: const TextStyle(color: Color(0xFFA5B4FC)),
        ),
        trailing: const Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _techInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF6366F1).withOpacity(0.2),
          ),
          child: Icon(icon, color: const Color(0xFF6366F1), size: 20),
        ),
        const SizedBox(width: 16),
        Text(
          '$label：',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFFA5B4FC),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF6366F1).withOpacity(0.1)
      ..strokeWidth = 1;

    const gridSize = 40.0;

    for (double x = 0; x <= size.width; x += gridSize) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    for (double y = 0; y <= size.height; y += gridSize) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
