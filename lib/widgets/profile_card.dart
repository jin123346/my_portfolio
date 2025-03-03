import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String title;
  final String imageUrl;
  final String description;
  final List<Map<String, String>>? socialLinks;

  // 생성자: 개발자 정보 설정
  const ProfileCard({
    Key? key,
    required this.name,
    required this.title,
    required this.imageUrl,
    required this.description,
    this.socialLinks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 프로필 이미지
            CircleAvatar(
              radius: 60,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
              backgroundImage: _buildProfileImage(),
            ),
            SizedBox(height: 16),

            // 이름
            Text(
              name,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 4),

            // 직함/타이틀
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            SizedBox(height: 16),

            // 자기소개
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),

            // 소셜 링크 (있는 경우)
            if (socialLinks != null && socialLinks!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: _buildSocialLinks(context),
              ),
          ],
        ),
      ),
    );
  }

  // 프로필 이미지 로드 처리
  ImageProvider _buildProfileImage() {
    try {
      // 외부 URL인 경우 NetworkImage 사용
      if (imageUrl.startsWith('http')) {
        return NetworkImage(imageUrl);
      } else {
        // 로컬 에셋 이미지인 경우 AssetImage 사용
        return AssetImage(imageUrl);
      }
    } catch (e) {
      // 이미지 로드 실패 시 기본 이미지 반환
      return AssetImage('assets/images/default_profile.png');
    }
  }

  // 소셜 링크 버튼 구성
  Widget _buildSocialLinks(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socialLinks!.map((link) {
        // 아이콘 매핑
        IconData icon = _getIconForSocial(link['type'] ?? '');

        return InkWell(
          onTap: () {
            // URL 열기 처리
            // 실제 구현에서는 url_launcher 패키지 사용
            print('Open link: ${link['url']}');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 24,
            ),
          ),
        );
      }).toList(),
    );
  }

  // 소셜 미디어 타입에 따른 아이콘 매핑
  IconData _getIconForSocial(String type) {
    switch (type.toLowerCase()) {
      case 'github':
        return Icons.code;
      case 'linkedin':
        return Icons.business;
      case 'twitter':
        return Icons.chat;
      case 'instagram':
        return Icons.camera_alt;
      case 'facebook':
        return Icons.facebook;
      default:
        return Icons.link;
    }
  }
}
