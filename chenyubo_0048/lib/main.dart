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
          seedColor: Colors.teal,
          brightness: Brightness.light,
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
      appBar: AppBar(
        title: const Text(
          '陈宇博的创新实验 Flutter 首页',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: colorScheme.inversePrimary,
        centerTitle: true,
        elevation: 2,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // 第一页：首页
          _buildHomePage(colorScheme),
          // 第二页：关于我
          _buildAboutPage(colorScheme),
          // 第三页：学习记录
          _buildRecordPage(colorScheme),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
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
            icon: Icon(Icons.history),
            label: '记录',
          ),
        ],
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton.extended(
              onPressed: _finishOneTask,
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('完成一次打卡'),
              backgroundColor: colorScheme.primaryContainer,
              foregroundColor: colorScheme.onPrimaryContainer,
            )
          : null,
    );
  }

  Widget _buildHomePage(ColorScheme colorScheme) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // 头像区域
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [colorScheme.primary, colorScheme.tertiary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: const Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            // 主标题
            Text(
              'Hello Flutter!',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              '我已经完成第14周入门任务！',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 24),
            // 信息卡片
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _infoRow(Icons.badge, '姓名', '陈宇博'),
                    const Divider(height: 24),
                    _infoRow(Icons.numbers, '学号', '20231060048'),
                    const Divider(height: 24),
                    _infoRow(Icons.group, '小组', '第6组'),
                    const Divider(height: 24),
                    _infoRow(Icons.school, '专业', '智能科学与技术'),
                    const Divider(height: 24),
                    _infoRow(Icons.code, '课程', '创新实验'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // 打卡统计卡片
            Card(
              color: colorScheme.secondaryContainer,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.emoji_events,
                          color: colorScheme.secondary,
                          size: 32,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '今日已完成任务：$_completedTasks 次',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSecondaryContainer,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (_completedTasks > 0)
                      Text(
                        _completedTasks >= 5
                            ? '太棒了！今天效率超高！🔥'
                            : _completedTasks >= 3
                                ? '继续加油，你可以的！💪'
                                : '好的开始，继续保持！✨',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSecondaryContainer,
                            ),
                      ),
                    if (_completedTasks > 0)
                      const SizedBox(height: 12),
                    if (_completedTasks > 0)
                      TextButton.icon(
                        onPressed: _resetTasks,
                        icon: const Icon(Icons.refresh),
                        label: const Text('重置计数'),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutPage(ColorScheme colorScheme) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              '关于我',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _skillChip('Flutter', '入门学习中', colorScheme),
                    _skillChip('Python', '熟练使用', colorScheme),
                    _skillChip('Java', '课程学习中', colorScheme),
                    _skillChip('Hadoop/Spark', '大数据基础', colorScheme),
                    _skillChip('机器学习', 'PyTorch实践', colorScheme),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '项目经历',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12),
                    _projectItem('hair-advisor-agent', 'AI推荐引擎开发', '负责C模块推荐引擎核心代码'),
                    const SizedBox(height: 8),
                    _projectItem('Jekyll Blog', '个人博客搭建', 'GitHub Pages部署'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordPage(ColorScheme colorScheme) {
    final tasks = List.generate(
      _completedTasks.clamp(0, 10),
      (i) => '任务 ${i + 1}：Flutter学习打卡 ✓',
    );

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            '学习记录',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
          ),
          const SizedBox(height: 16),
          if (tasks.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    Icon(
                      Icons.inbox_outlined,
                      size: 64,
                      color: colorScheme.outline,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '还没有打卡记录',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: colorScheme.outline,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '去首页完成第一次打卡吧！',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: colorScheme.outline,
                          ),
                    ),
                  ],
                ),
              ),
            )
          else
            ...tasks.map((task) => Card(
                  elevation: 1,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colorScheme.primaryContainer,
                      child: Icon(
                        Icons.check,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                    title: Text(task),
                    subtitle: Text(
                      '第14周创新实验',
                      style: TextStyle(color: colorScheme.outline),
                    ),
                  ),
                )),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 22),
        const SizedBox(width: 12),
        Text(
          '$label：',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        ),
      ],
    );
  }

  Widget _skillChip(String name, String level, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Chip(
            label: Text(name),
            backgroundColor: colorScheme.primaryContainer,
            labelStyle: TextStyle(
              color: colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            level,
            style: TextStyle(
              color: colorScheme.onSurfaceVariant,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _projectItem(String name, String desc, String role) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          desc,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 2),
        Text(
          role,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
        ),
      ],
    );
  }
}
