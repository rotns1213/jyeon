import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityDetailPage extends StatelessWidget {
  final Map<String, dynamic> post;

  const CommunityDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212123),
      appBar: AppBar(
        title: const AppFont(
          '게시글',
          size: 18,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 작성자 정보
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: AppFont(
                        post['author'][0],
                        size: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppFont(
                          post['author'],
                          size: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 2),
                        AppFont(
                          post['time'],
                          size: 13,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const Divider(height: 1, color: Colors.white10),
            
            // 게시글 내용
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 카테고리
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: AppFont(
                      post['category'],
                      size: 12,
                      color: Colors.purple,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // 제목
                  AppFont(
                    post['title'],
                    size: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 16),
                  
                  // 내용
                  AppFont(
                    post['content'],
                    size: 16,
                    color: Colors.white.withOpacity(0.9),
                  ),
                  const SizedBox(height: 20),
                  
                  // 이모지 이미지
                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          post['image'],
                          style: const TextStyle(fontSize: 100),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // 좋아요, 댓글 정보
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 20,
                    color: Colors.white.withOpacity(0.6),
                  ),
                  const SizedBox(width: 6),
                  AppFont(
                    '공감 ${post['likes']}',
                    size: 14,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  const SizedBox(width: 20),
                  Icon(
                    Icons.chat_bubble_outline,
                    size: 20,
                    color: Colors.white.withOpacity(0.6),
                  ),
                  const SizedBox(width: 6),
                  AppFont(
                    '댓글 ${post['comments']}',
                    size: 14,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            const Divider(height: 1, color: Colors.white10),
            
            // 댓글 목록
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppFont(
                    '댓글',
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 16),
                  
                  // 샘플 댓글들
                  _buildComment('정가지', '좋은 정보 감사합니다!', '5분 전'),
                  _buildComment('박가지', '저도 궁금했는데 도움됐어요', '10분 전'),
                  _buildComment('최가지', '공감합니다', '15분 전'),
                  
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
          bottom: 12 + MediaQuery.of(context).padding.bottom,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff2a2a2c),
          border: Border(
            top: BorderSide(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AppFont(
                  '댓글을 입력하세요',
                  size: 14,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComment(String author, String content, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: AppFont(
                author[0],
                size: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppFont(
                      author,
                      size: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(width: 8),
                    AppFont(
                      time,
                      size: 12,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                AppFont(
                  content,
                  size: 14,
                  color: Colors.white.withOpacity(0.9),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
