// lib/widgets/project_card.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/project.dart';
import '../screens/project_detail_screen.dart';

// 프로젝트 카드 위젯 - 각 프로젝트 정보를 보여줍니다
class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectDetailScreen(
              project: project,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 프로젝트 이미지
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                project.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: Center(
                      child: Icon(Icons.broken_image, size: 50),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 프로젝트 제목
                  Text(
                    project.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 8),
                  // 프로젝트 설명
                  Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 12),
                  // 사용된 기술 목록
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: project.technologies.map((tech) {
                      return Chip(
                        label: Text(tech),
                        backgroundColor:
                            Theme.of(context).primaryColor.withOpacity(0.1),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  // 버튼 영역
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // GitHub 버튼
                      TextButton.icon(
                        icon: Icon(Icons.code),
                        label: Text('GitHub'),
                        onPressed: () async {
                          if (await canLaunch(project.githubUrl)) {
                            await launch(project.githubUrl);
                          }
                        },
                      ),
                      // 라이브 데모 버튼 (있는 경우에만 표시)
                      if (project.liveUrl != null)
                        TextButton.icon(
                          icon: Icon(Icons.visibility),
                          label: Text('라이브 데모'),
                          onPressed: () async {
                            _launchUrl(project.githubUrl);
                          },
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw '해당 URL을 열 수 없습니다: $urlString';
    }
  }
}
