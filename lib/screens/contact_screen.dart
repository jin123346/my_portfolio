// lib/screens/contact_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_app_bar.dart';

// 연락처 정보를 보여주는 화면
class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  // 폼 키
  final _formKey = GlobalKey<FormState>();

  // 텍스트 컨트롤러
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  // 연락 정보
  final contactInfo = {
    'email': 'your.email@example.com',
    'phone': '+82 10-1234-5678',
    'github': 'https://github.com/yourusername',
    'linkedin': 'https://linkedin.com/in/yourusername',
  };

  // 메시지 전송 중 여부
  bool _isSending = false;

  @override
  void dispose() {
    // 컨트롤러 해제
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // 메시지 전송 함수
  Future<void> _sendMessage() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      // 여기서 실제 메시지 전송 로직을 구현합니다.
      // 이메일 API, Firebase 등을 사용할 수 있습니다.

      // 전송 시뮬레이션 (2초 딜레이)
      await Future.delayed(Duration(seconds: 2));

      setState(() {
        _isSending = false;
      });

      // 폼 초기화
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();

      // 성공 메시지 표시
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('메시지가 성공적으로 전송되었습니다!')),
      );
    }
  }

  // URL 열기 함수
  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('URL을 열 수 없습니다: $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '연락처'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '연락하기',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 8),
            Text(
              '함께 일하고 싶으시거나 문의사항이 있으시면 아래의 연락처로 연락주세요.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 24),

            // 연락처 정보 카드
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // 이메일
                    ListTile(
                      leading: Icon(Icons.email,
                          color: Theme.of(context).primaryColor),
                      title: Text('이메일'),
                      subtitle: Text(contactInfo['email']!),
                      trailing: IconButton(
                        icon: Icon(Icons.content_copy),
                        onPressed: () {
                          Clipboard.setData(
                              ClipboardData(text: contactInfo['email']!));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('이메일이 클립보드에 복사되었습니다')),
                          );
                        },
                      ),
                      onTap: () {
                        _launchUrl('mailto:${contactInfo['email']}');
                      },
                    ),

                    // 전화번호
                    ListTile(
                      leading: Icon(Icons.phone,
                          color: Theme.of(context).primaryColor),
                      title: Text('전화번호'),
                      subtitle: Text(contactInfo['phone']!),
                      trailing: IconButton(
                        icon: Icon(Icons.content_copy),
                        onPressed: () {
                          Clipboard.setData(
                              ClipboardData(text: contactInfo['phone']!));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('전화번호가 클립보드에 복사되었습니다')),
                          );
                        },
                      ),
                      onTap: () {
                        _launchUrl('tel:${contactInfo['phone']}');
                      },
                    ),

                    // GitHub
                    ListTile(
                      leading: Icon(Icons.code,
                          color: Theme.of(context).primaryColor),
                      title: Text('GitHub'),
                      subtitle: Text(contactInfo['github']!),
                      onTap: () {
                        _launchUrl(contactInfo['github']!);
                      },
                    ),

                    // LinkedIn
                    ListTile(
                      leading: Icon(Icons.business,
                          color: Theme.of(context).primaryColor),
                      title: Text('LinkedIn'),
                      subtitle: Text(contactInfo['linkedin']!),
                      onTap: () {
                        _launchUrl(contactInfo['linkedin']!);
                      },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 32),

            // 메시지 폼
            Text(
              '메시지 보내기',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 16),

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // 이름 입력 필드
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: '이름',
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '이름을 입력해주세요';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      // 이메일 입력 필드
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: '이메일',
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '이메일을 입력해주세요';
                          }

                          // 간단한 이메일 형식 검증
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return '유효한 이메일 주소를 입력해주세요';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      // 메시지 입력 필드
                      TextFormField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          labelText: '메시지',
                          prefixIcon: Icon(Icons.message),
                          alignLabelWithHint: true,
                        ),
                        maxLines: 5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '메시지를 입력해주세요';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24),

                      // 전송 버튼
                      ElevatedButton(
                        onPressed: _isSending ? null : _sendMessage,
                        child: _isSending
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Text('전송 중...'),
                                ],
                              )
                            : Text('메시지 전송'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
