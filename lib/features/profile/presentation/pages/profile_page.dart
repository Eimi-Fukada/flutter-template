import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 用户信息卡片
            _buildUserCard(context),
            const SizedBox(height: 24),
            
            // 我的服务
            _buildSectionTitle('我的服务'),
            const SizedBox(height: 12),
            _buildServiceGrid(context),
            const SizedBox(height: 24),
            
            // 常用功能
            _buildSectionTitle('常用功能'),
            const SizedBox(height: 12),
            _buildCommonFunctions(context),
            const SizedBox(height: 24),
            
            // 设置选项
            _buildSectionTitle('设置'),
            const SizedBox(height: 12),
            _buildSettings(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUserCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.8),
            Theme.of(context).colorScheme.primary.withOpacity(0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              size: 40,
              color: Colors.red,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '网易云音乐用户',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '点击登录，享受更多功能',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildServiceGrid(BuildContext context) {
    final services = [
      {'icon': Icons.favorite, 'title': '我喜欢', 'color': Colors.red},
      {'icon': Icons.history, 'title': '最近播放', 'color': Colors.blue},
      {'icon': Icons.download, 'title': '下载管理', 'color': Colors.green},
      {'icon': Icons.cloud, 'title': '云盘', 'color': Colors.purple},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: service['color'] as Color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                service['icon'] as IconData,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              service['title'] as String,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }

  Widget _buildCommonFunctions(BuildContext context) {
    final functions = [
      {'icon': Icons.nightlight, 'title': '夜间模式'},
      {'icon': Icons.timer, 'title': '定时关闭'},
      {'icon': Icons.car_rental, 'title': '驾考模式'},
      {'icon': Icons.headphones, 'title': '听歌识曲'},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: functions.length,
      itemBuilder: (context, index) {
        final function = functions[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              function['icon'] as IconData,
              color: Colors.grey[700],
            ),
          ),
          title: Text(function['title'] as String),
          trailing: const Icon(Icons.chevron_right),
        );
      },
    );
  }

  Widget _buildSettings(BuildContext context) {
    return Column(
      children: [
        _buildSettingItem(context, '账号和绑定', Icons.account_circle),
        _buildSettingItem(context, '隐私设置', Icons.lock),
        _buildSettingItem(context, '听歌偏好', Icons.settings),
        _buildSettingItem(context, '关于', Icons.info),
      ],
    );
  }

  Widget _buildSettingItem(BuildContext context, String title, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: Colors.grey[700],
        ),
      ),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
