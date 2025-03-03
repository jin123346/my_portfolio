// lib/screens/projects_screen.dart
// 프로젝트 화면 - 로컬 데이터 서비스 사용

import 'package:flutter/material.dart';

import '../models/project.dart';
import '../service/projects_service.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/project_card.dart';

class ProjectsScreen extends StatefulWidget {
  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final ProjectsService _projectsService = ProjectsService();
  List<Project> projects = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  Future<void> _loadProjects() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      final loadedProjects = await _projectsService.getProjects();

      setState(() {
        projects = loadedProjects;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = '프로젝트를 불러오는 중 오류가 발생했습니다: ${e.toString()}';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '프로젝트'),
      body: RefreshIndicator(
        onRefresh: _loadProjects,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: Colors.red),
            SizedBox(height: 16),
            Text(errorMessage!, textAlign: TextAlign.center),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadProjects,
              child: Text('다시 시도'),
            ),
          ],
        ),
      );
    }

    if (projects.isEmpty) {
      return Center(
        child: Text('프로젝트가 없습니다',
            style: Theme.of(context).textTheme.headlineMedium),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ProjectCard(project: projects[index]),
        );
      },
    );
  }
}
