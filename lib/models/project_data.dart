// lib/data/projects_data.dart
import 'package:my_portfolio/models/project.dart';

// 포트폴리오의 프로젝트 데이터를 관리하는 클래스
class ProjectsData {
  // 싱글톤 패턴 구현
  static final ProjectsData _instance = ProjectsData._internal();

  factory ProjectsData() {
    return _instance;
  }

  ProjectsData._internal();

  // 프로젝트 목록 데이터
  final List<Project> projects = [
    // 프로젝트 1: 농산물 직거래 쇼핑몰 플랫폼
    Project(
        id: 'proj-001',
        title: '농산물 직거래 쇼핑몰 플랫폼',
        description:
            '농산물 직거래 쇼핑몰 플랫폼 개발 및 배포. 상품 관리 및 게시판 관리자 기능, 유저 관리, SNS 로그인 기능을 구현했습니다.',
        technologies: [
          'Spring Boot 3.x',
          'Spring Security',
          'Spring Data JPA',
          'Thymeleaf',
          'MySQL 8.4',
          'OAuth2.0'
        ],
        imageUrl: 'assets/images/projects/farm_market.jpg',
        githubUrl: 'https://github.com/jin123346/farm-market',
        role: '풀스택 개발 (4인 팀)',
        period: '2024.9.10 ~ 2024.9.15',
        features: [
          'Spring Security를 사용한 세션 기반 사용자 관리(회원가입, 로그인)',
          'SNS 로그인(카카오, 네이버, 구글) 구현',
          '게시판 기능 구현',
          '공지사항 및 게시판 관리자 기능 개발'
        ],
        troubleShooting: [
          {
            'title': '웹 서비스 UI/UX 개선 (Thymeleaf)',
            'problem':
                '페이지를 개별로 구현한 후 합쳐서 사용하므로, 일관성이 부족했고, 공통된 부분을 변경 시 여러 곳을 변경해줘야 하는 문제가 생겼습니다.',
            'solution':
                'Thymeleaf 공식 문서를 참고하여 공통 레이아웃(header, footer, sidebar)을 정의하여, 공통된 부분의 분리하여 구성하였습니다. Thymeleaf Layout Dialect를 적용하여 페이지 별 콘텐츠만 변경하면서 일관된 UI/UX를 제공했습니다.',
            'result':
                '공통 템플릿 구조로 변경하고 Fragment 기능을 사용하여 재사용성을 높여 중복 코드 50% 감소했으며, UI 변경 시 한 곳에서 수정하면 모든 페이지에 적용되어 디자인 수정 시간을 40% 단축할 수 있었습니다.'
          },
          {
            'title': 'SNS 통합 인증 시스템 구축',
            'problem': '각 SNS 플랫폼 별로 반환하는 사용자 정보 구조가 달라 통합 관리가 어려웠습니다.',
            'solution':
                'Kakao, Naver, Google 공식 API 문서를 분석하여 OAuth2.0 인증 흐름에 맞춰 Authorization Code 방식으로 로그인을 구현했습니다. 토큰 발급 및 만료 관리를 통해 보안성을 강화하고 사용자 인증 상태를 유지했습니다.',
            'result':
                '다양한 SNS 로그인을 지원하면서도 일관된 사용자 경험을 제공할 수 있게 되었습니다. 사용자의 회원가입 및 로그인 과정이 간소화되어 서비스 진입 장벽이 낮아졌습니다.'
          }
        ]),

    // 프로젝트 2: 쇼핑몰 웹사이트 프로젝트 (LotteOn)
    Project(
        id: 'proj-002',
        title: '쇼핑몰 웹사이트 프로젝트 (LotteOn)',
        description:
            '롯데온 쇼핑몰 플랫폼의 핵심 기능을 구현한 프로젝트입니다. 상품 관리, 주문/결제, 권한 관리 등의 시스템을 구축했습니다.',
        technologies: [
          'Spring Boot',
          'Spring Security',
          'Spring Data JPA',
          'QueryDSL',
          'MySQL',
          'Thymeleaf',
          'AWS EC2',
          'GitHub Actions'
        ],
        imageUrl: 'assets/images/projects/lotteon.png',
        githubUrl: 'https://github.com/jin123346/Team3-LotteOn-Project',
        liveUrl: 'https://youtu.be/zAxkudEVJoU?si=oCiFe2wKfmOv__0P',
        role: '팀장 & 풀스택 개발 (6인 팀)',
        period: '2024.10.14 ~ 2024.11.15',
        features: [
          '메인화면 및 상품 관련 화면 구현',
          '상품 관리 시스템 구축 (상품 CRUD 및 옵션 관리, JPA를 활용한 페이징 처리)',
          '주문/결제 프로세스 개발 (장바구니 기능, 주문 프로세스 상태 관리)',
          '권한 관리 시스템 설계 (Spring Security 기반 인증/인가)',
          'CI/CD 파이프라인 구성 (GitHub Actions 활용)'
        ],
        troubleShooting: [
          {
            'title': '상품 카테고리 Redis 캐시 소실 문제',
            'problem':
                '계층형 카테고리 데이터의 Redis 캐시가 예기치 않게 소실되는 현상이 발생했습니다. 캐시 소실 시 모든 요청이 DB에 직접 접근하여 서버 부하가 증가하고, 응답 시간 지연으로 사용자 경험이 저하되었습니다.',
            'solution':
                '1) 캐시 미스 상황 대응 로직을 구현하여 자동 복구되도록 했습니다. 2) 계층적 캐싱 구조를 설계하여 상위 카테고리와 하위 카테고리를 분리하여 캐시 저장했습니다. 3) Redis 캐시 상태 모니터링을 추가하고 캐시 미스 발생 시 로깅 처리를 구현했습니다.',
            'result':
                '캐시 소실 시에도 자동 복구되어 서비스 안정성이 향상되었고, DB 부하 감소로 전반적인 시스템 성능이 개선되었습니다. 카테고리 데이터 조회 응답 시간이 일정하게 유지되어 사용자 경험이 향상되었습니다.'
          }
        ]),

    // 프로젝트 3: 업무 플랫폼(Plantry) 프로젝트
    Project(
        id: 'proj-003',
        title: '업무 플랫폼(Plantry) 프로젝트',
        description:
            '기업 및 개인 사용자를 위한 커뮤니티 플랫폼 개발. 파일 드라이브 시스템, 권한 관리 및 공유 기능 등을 구현했습니다.',
        technologies: [
          'Spring Boot',
          'Spring Security',
          'JWT',
          'Spring Data JPA',
          'MongoDB',
          'React.js',
          'Vite',
          'React Query',
          'Zustand',
          'TailwindCSS',
          'AWS EC2',
          'SFTP',
          'Nginx'
        ],
        imageUrl: 'assets/images/projects/plantry.png',
        githubUrl: 'https://github.com/jin123346/Plantry-FO',
        liveUrl: 'https://youtu.be/gYq8mfhy5Bk?si=gy_oUdW9legJrJc7',
        role: '풀스택 개발 (7인 팀)',
        period: '2024.11.18 ~ 2024.12.27',
        features: [
          'SFTP 기반 파일 업로드/다운로드 시스템 개발',
          '사용자별 저장공간 분리 구현',
          '권한 기반 접근 제어 시스템 개발',
          '파일/폴더 단위 접근 권한 설정',
          '공유 링크 생성 및 접근 제어 기능 구현'
        ],
        troubleShooting: [
          {
            'title': '파일 시스템 설계',
            'problem': '다수 사용자의 파일 관리 방식을 결정해야 했으며, 보안과 편의성 사이의 균형점이 필요했습니다.',
            'solution':
                '관리의 편리성과 디렉터리 구조 기반으로 접근 제한을 사용하여 단일 SFTP 사용자를 사용하기로 결정했습니다. 단일 SFTP 사용자(sftpuser)를 사용하여 개별 폴더 접근을 경로 기반으로 제한하고, chroot 적용을 통해 홈 디렉토리 내부에서만 작업 가능하도록 설정했습니다.',
            'result':
                '파일 업로드/다운로드 속도가 향상되고 사용자 권한 문제가 해결되었습니다. 보안성을 유지하면서도 간편한 접근 방식을 제공할 수 있게 되었습니다.'
          },
          {
            'title': '휴지통 복구 및 사용자 편의성 문제 해결',
            'problem': '삭제된 파일/폴더 복구 시 경로 충돌이 발생할 수 있고, 데이터 정합성 유지가 필요했습니다.',
            'solution':
                '사용자의 편의성에 초점을 맞추어, 기존 경로와 폴더 이름은 유지하지만 새로운 UUID 이름을 생성하여 DB를 업데이트하여 경로 충돌 가능성을 줄였습니다. restore_history 테이블을 구성하여 하위 폴더 복구 후 삭제된 상위 폴더를 복구하는 경우에 history 테이블을 확인한 후 경로 복구 로직을 실행하도록 구현했습니다.',
            'result':
                '사용자 경험이 개선되어 직관적인 파일 관리 시스템을 제공할 수 있게 되었습니다. 클라우드 서비스(구글 드라이브, 네이버 클라우드)와 유사한 UX를 구현했으며, 삭제 및 복구 과정의 안정성을 높이고 데이터 손실 가능성을 최소화했습니다.'
          }
        ]),

    // 프로젝트 4: Flutter 프로젝트 APPLUS Market
    Project(
        id: 'proj-004',
        title: 'Flutter 프로젝트 APPLUS Market',
        description:
            'Spring Boot 기반의 API 서버와 Flutter을 이용한 전자제품 중고거래 플랫폼 앱 개발. 중고상품 등록, 유저 기능, 애쁠페이(자체 뱅크), 채팅 기능을 구현했습니다.',
        technologies: [
          'Spring Boot',
          'MyBatis',
          'Spring Security',
          'JWT',
          'MongoDB',
          'WebClient',
          'Jsoup',
          'Flutter',
          'Dart',
          'Riverpod'
        ],
        imageUrl: 'assets/images/projects/applus_market.png',
        githubUrl: 'https://github.com/jin123346/applus-market',
        role: '프로젝트 일정 관리 및 백엔드 개발 (3인 팀)',
        period: '2025.1.20 ~ 진행중',
        features: [
          'JWT 기반 인증/인가 시스템 구현',
          '회원가입, 로그인, 비밀번호 찾기 기능 개발',
          '회원정보 관리 기능 구현',
          '삼성 제품 정보 자동 수집 시스템 개발',
          '실시간 제품 검색 기능 구현',
          'MongoDB 기반 데이터 저장 시스템 개발'
        ],
        troubleShooting: [
          {
            'title': '전자제품 크롤링 및 데이터 관리',
            'problem':
                '다양한 전자제품 정보의 수동 입력이 비효율적이고 사용자 편의성이 떨어졌습니다. 제품 정보의 정확성 확보와 실시간 데이터 업데이트가 필요했습니다.',
            'solution':
                '웹 크롤링 시스템을 구축하여 WebClient로 API 요청을 처리하고, Jsoup으로 HTML을 파싱했습니다. 동적 데이터는 Selenium을 활용했습니다. 또한 MongoDB에 제품 정보를 저장하고 검색 인덱스를 설계하여 검색 최적화를 구현했습니다.',
            'result':
                '삼성 공식 홈페이지의 제품 정보를 자동으로 크롤링하여 MongoDB에 저장하고, 사용자가 제품 등록 시 해당 데이터를 검색 및 자동 완성으로 활용할 수 있게 되었습니다. 이를 통해 사용자 경험이 크게 향상되었고, 제품 데이터의 정확성도 확보할 수 있었습니다.'
          }
        ])
  ];

  // ID로 프로젝트 찾기
  Project? getProjectById(String id) {
    try {
      return projects.firstWhere((project) => project.id == id);
    } catch (e) {
      return null; // 일치하는 프로젝트가 없는 경우
    }
  }

  // 기술 기반 프로젝트 필터링
  List<Project> getProjectsByTechnology(String technology) {
    return projects
        .where((project) => project.technologies.contains(technology))
        .toList();
  }

  // 프로젝트 검색
  List<Project> searchProjects(String query) {
    query = query.toLowerCase();
    return projects
        .where((project) =>
            project.title.toLowerCase().contains(query) ||
            project.description.toLowerCase().contains(query))
        .toList();
  }
}
