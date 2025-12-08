import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:bamtol_market_app/src/market/community_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> posts = [
      {
        'category': '맛집',
        'title': '분당 정자동 맛집 추천해주세요!',
        'content': '가족들이랑 저녁 먹을 곳 찾고 있어요',
        'author': '김가지',
        'time': '10분 전',
        'likes': 8,
        'comments': 12,
        'image': '🍽️',
      },
      {
        'category': '질문',
        'title': '이 동네 주차하기 어려운가요?',
        'content': '이사 고려 중인데 주차 정보 궁금합니다',
        'author': '이가지',
        'time': '30분 전',
        'likes': 5,
        'comments': 7,
        'image': '🚗',
      },
      {
        'category': '동네소식',
        'title': '서현역 근처 공사 언제까지 하나요?',
        'content': '출퇴근길이 너무 불편해요',
        'author': '박가지',
        'time': '1시간 전',
        'likes': 15,
        'comments': 23,
        'image': '🚧',
      },
      {
        'category': '분실/실종',
        'title': '고양이 찾습니다',
        'content': '갈색 턱시도 고양이 보신 분 연락주세요',
        'author': '최가지',
        'time': '2시간 전',
        'likes': 32,
        'comments': 18,
        'image': '🐱',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xff212123),
      body: Column(
        children: [
          // 카테고리 필터
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryChip('전체', true),
                _buildCategoryChip('맛집', false),
                _buildCategoryChip('질문', false),
                _buildCategoryChip('동네소식', false),
                _buildCategoryChip('분실/실종', false),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.white10),
          // 게시글 리스트
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => CommunityDetailPage(post: post));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white.withOpacity(0.05),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
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
                              const Spacer(),
                              Text(
                                post['image'],
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          AppFont(
                            post['title'],
                            size: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 4),
                          AppFont(
                            post['content'],
                            size: 14,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              AppFont(
                                post['author'],
                                size: 13,
                                color: Colors.white.withOpacity(0.6),
                              ),
                              const SizedBox(width: 8),
                              AppFont(
                                post['time'],
                                size: 13,
                                color: Colors.white.withOpacity(0.5),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.chat_bubble_outline,
                                size: 16,
                                color: Colors.white.withOpacity(0.5),
                              ),
                              const SizedBox(width: 4),
                              AppFont(
                                '${post['comments']}',
                                size: 13,
                                color: Colors.white.withOpacity(0.6),
                              ),
                              const SizedBox(width: 12),
                              Icon(
                                Icons.favorite_border,
                                size: 16,
                                color: Colors.white.withOpacity(0.5),
                              ),
                              const SizedBox(width: 4),
                              AppFont(
                                '${post['likes']}',
                                size: 13,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[800],
          borderRadius: BorderRadius.circular(20),
        ),
        child: AppFont(
          label,
          size: 14,
          color: Colors.white,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
