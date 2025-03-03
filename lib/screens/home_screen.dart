// lib/screens/home_screen.dart
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/menu_button.dart';
import '../widgets/profile_card.dart';

// 홈 화면을 담당하는 StatefulWidget 클래스입니다.
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// 홈 화면의 상태를 관리하는 State 클래스입니다.
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '하진희의 포트폴리오'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 프로필 카드 위젯 사용
              Center(
                child: ProfileCard(
                  name: '하진희',
                  title: 'Full-Stack 개발자',
                  imageUrl: 'assets/images/profile.jpg',
                  description:
                      '안녕하세요! Flutter와 Spring Boot를 활용한 풀스택 개발에 관심이 많은 개발자입니다.',
                ),
              ),
              SizedBox(height: 24),
              Text(
                '포트폴리오 메뉴',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 16),
              // 메뉴 버튼들
              MenuButton(
                icon: Icons.code,
                title: '프로젝트',
                description: '지금까지 진행한 프로젝트들을 살펴보세요',
                onTap: () {
                  Navigator.pushNamed(context, '/projects');
                },
              ),
              SizedBox(height: 12),
              MenuButton(
                icon: Icons.build,
                title: '기술 스택',
                description: '제가 사용할 수 있는 기술들입니다',
                onTap: () {
                  Navigator.pushNamed(context, '/skills');
                },
              ),
              SizedBox(height: 12),
              MenuButton(
                icon: Icons.contact_mail,
                title: '연락처',
                description: '함께 일하고 싶으시다면 연락주세요',
                onTap: () {
                  Navigator.pushNamed(context, '/contact');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
