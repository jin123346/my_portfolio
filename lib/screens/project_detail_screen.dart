// lib/screens/project_detail_screen.dart
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../models/project.dart';
import '../widgets/custom_app_bar.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailScreen({
    Key? key,
    required this.project,
  }) : super(key: key);

  Future<void> _launchUrl(String urlString) async {
    final Uri uri = Uri.parse(urlString);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw '해당 URL을 열 수 없습니다: $urlString';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: project.title),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 프로젝트 이미지
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                width: double.infinity,
                color: Colors.grey.shade200,
                child: Image.asset(
                  project.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(Icons.image_not_supported, size: 50),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 기본 정보 섹션
                  _buildInfoSection(context),

                  // 프로젝트 설명
                  const SizedBox(height: 24),
                  Text(
                    '프로젝트 설명',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  // 담당 역할 및 기능
                  if (project.features != null && project.features!.isNotEmpty)
                    _buildFeaturesSection(context),

                  // 사용 기술
                  const SizedBox(height: 24),
                  Text(
                    '사용 기술',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
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

                  // 트러블슈팅
                  if (project.troubleShooting != null &&
                      project.troubleShooting!.isNotEmpty)
                    _buildTroubleshootingSection(context),

                  // 링크 버튼
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.code),
                          label: const Text('GitHub'),
                          onPressed: () => _launchUrl(project.githubUrl),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      if (project.liveUrl != null)
                        Expanded(
                          child: OutlinedButton.icon(
                            icon: const Icon(Icons.visibility),
                            label: const Text('라이브 데모'),
                            onPressed: () => _launchUrl(project.liveUrl!),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
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

  // 기본 정보 섹션 (역할, 기간)
  Widget _buildInfoSection(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 역할 정보
            if (project.role != null)
              _buildInfoRow(context, '역할', project.role!),

            // 기간 정보
            if (project.period != null)
              _buildInfoRow(context, '기간', project.period!),
          ],
        ),
      ),
    );
  }

  // 정보 행 위젯
  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }

  // 담당 기능 섹션
  Widget _buildFeaturesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          '담당 기능',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: project.features!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• '),
                  Expanded(
                    child: Text(project.features![index]),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  // 트러블슈팅 섹션
  Widget _buildTroubleshootingSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          '트러블슈팅',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: project.troubleShooting!.length,
          separatorBuilder: (context, index) => const Divider(height: 32),
          itemBuilder: (context, index) {
            final troubleShoot = project.troubleShooting![index];
            return _buildTroubleshootItem(context, troubleShoot);
          },
        ),
      ],
    );
  }

  // 트러블슈팅 항목 위젯
  Widget _buildTroubleshootItem(
      BuildContext context, Map<String, String> troubleShoot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 트러블슈팅 제목
        Text(
          troubleShoot['title'] ?? '',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),

        // 문제 설명
        if (troubleShoot['problem'] != null) ...[
          _buildTroubleshootSection(context, '문제 상황', troubleShoot['problem']!),
          const SizedBox(height: 8),
        ],

        // 해결 방법
        if (troubleShoot['solution'] != null) ...[
          _buildTroubleshootSection(
              context, '해결 방법', troubleShoot['solution']!),
          const SizedBox(height: 8),
        ],

        // 결과
        if (troubleShoot['result'] != null)
          _buildTroubleshootSection(context, '결과', troubleShoot['result']!),
      ],
    );
  }

  // 트러블슈팅 섹션 항목 위젯
  Widget _buildTroubleshootSection(
      BuildContext context, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

// // 프로젝트 상세 화면 추가
//
// import 'package:flutter/material.dart';
//
// import 'package:url_launcher/url_launcher.dart';
//
// import '../models/project.dart';
// import '../service/projects_service.dart';
// import '../widgets/custom_app_bar.dart';
//
// class ProjectDetailScreen extends StatefulWidget {
//   final String projectId;
//
//   const ProjectDetailScreen({
//     Key? key,
//     required this.projectId,
//   }) : super(key: key);
//
//   @override
//   _ProjectDetailScreenState createState() => _ProjectDetailScreenState();
// }
//
// class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
//   final ProjectsService _projectsService = ProjectsService();
//   Project? project;
//   bool isLoading = true;
//   String? errorMessage;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadProject();
//   }
//
//   Future<void> _loadProject() async {
//     try {
//       setState(() {
//         isLoading = true;
//         errorMessage = null;
//       });
//
//       final loadedProject =
//           await _projectsService.getProjectById(widget.projectId);
//
//       if (loadedProject == null) {
//         setState(() {
//           errorMessage = '프로젝트를 찾을 수 없습니다';
//           isLoading = false;
//         });
//         return;
//       }
//
//       setState(() {
//         project = loadedProject;
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         errorMessage = '프로젝트를 불러오는 중 오류가 발생했습니다: ${e.toString()}';
//         isLoading = false;
//       });
//     }
//   }
//
//   Future<void> _launchUrl(String urlString) async {
//     final Uri uri = Uri.parse(urlString);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri);
//     } else {
//       throw '해당 URL을 열 수 없습니다: $urlString';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: isLoading ? '프로젝트 상세' : (project?.title ?? '프로젝트 상세'),
//       ),
//       body: _buildContent(),
//     );
//   }
//
//   Widget _buildContent() {
//     if (isLoading) {
//       return Center(child: CircularProgressIndicator());
//     }
//
//     if (errorMessage != null) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.error_outline, size: 48, color: Colors.red),
//             SizedBox(height: 16),
//             Text(errorMessage!, textAlign: TextAlign.center),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _loadProject,
//               child: Text('다시 시도'),
//             ),
//           ],
//         ),
//       );
//     }
//
//     final proj = project!;
//
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // 프로젝트 이미지
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.asset(
//               proj.imageUrl,
//               width: double.infinity,
//               height: 200,
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) {
//                 return Container(
//                   height: 200,
//                   color: Colors.grey[300],
//                   child: Center(
//                     child: Icon(Icons.broken_image, size: 50),
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 24),
//
//           // 프로젝트 제목
//           Text(
//             proj.title,
//             style: Theme.of(context).textTheme.headlineSmall,
//           ),
//           SizedBox(height: 16),
//
//           // 프로젝트 설명
//           Text(
//             proj.description,
//             style: Theme.of(context).textTheme.bodyMedium,
//           ),
//           SizedBox(height: 24),
//
//           // 사용 기술
//           Text(
//             '사용 기술',
//             style: Theme.of(context).textTheme.bodySmall,
//           ),
//           SizedBox(height: 8),
//           Wrap(
//             spacing: 8,
//             runSpacing: 8,
//             children: proj.technologies.map((tech) {
//               return Chip(
//                 label: Text(tech),
//                 backgroundColor:
//                     Theme.of(context).primaryColor.withOpacity(0.1),
//               );
//             }).toList(),
//           ),
//           SizedBox(height: 24),
//
//           // 링크 버튼
//           Row(
//             children: [
//               Expanded(
//                 child: ElevatedButton.icon(
//                   icon: Icon(Icons.code),
//                   label: Text('GitHub'),
//                   onPressed: () => _launchUrl(proj.githubUrl),
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.symmetric(vertical: 12),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 16),
//               if (proj.liveUrl != null)
//                 Expanded(
//                   child: OutlinedButton.icon(
//                     icon: Icon(Icons.language),
//                     label: Text('라이브 데모'),
//                     onPressed: () => _launchUrl(proj.liveUrl!),
//                     style: OutlinedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(vertical: 12),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
