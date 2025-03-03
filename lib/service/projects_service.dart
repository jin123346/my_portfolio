// lib/services/projects_service.dart
// 로컬 데이터를 서비스로 래핑하여 사용

import '../models/project.dart';
import '../models/project_data.dart';

class ProjectsService {
  // 프로젝트 데이터 인스턴스
  final ProjectsData _projectsData = ProjectsData();

  // 모든 프로젝트 가져오기
  Future<List<Project>> getProjects() async {
    // 실제 API 호출을 시뮬레이션하기 위한 지연
    await Future.delayed(Duration(milliseconds: 800));
    return _projectsData.projects;
  }

  // ID로 프로젝트 가져오기
  Future<Project?> getProjectById(String id) async {
    await Future.delayed(Duration(milliseconds: 300));
    return _projectsData.getProjectById(id);
  }

  // 기술로 프로젝트 필터링
  Future<List<Project>> getProjectsByTechnology(String technology) async {
    await Future.delayed(Duration(milliseconds: 500));
    return _projectsData.getProjectsByTechnology(technology);
  }

  // 프로젝트 검색
  Future<List<Project>> searchProjects(String query) async {
    await Future.delayed(Duration(milliseconds: 500));
    return _projectsData.searchProjects(query);
  }
}
