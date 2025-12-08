import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212123),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 프로필 헤더
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '🍆',
                        style: TextStyle(fontSize: 35),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppFont(
                          '가지마켓 유저',
                          size: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 4),
                        AppFont(
                          '경기도 성남시 분당구',
                          size: 14,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white),
                    onPressed: () {
                      Get.snackbar(
                        '설정',
                        '설정 페이지',
                        backgroundColor: Colors.purple,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                  ),
                ],
              ),
            ),
            
            // 매너 온도
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppFont(
                        '매너 온도',
                        size: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          const AppFont(
                            '36.5°C',
                            size: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.sentiment_satisfied_alt,
                            color: Colors.green,
                            size: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: 0.365,
                      minHeight: 8,
                      backgroundColor: Colors.white.withOpacity(0.1),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 나의 거래
            _buildSection(
              title: '나의 거래',
              items: [
                _buildMenuItem('판매내역', Icons.shopping_bag_outlined, '3'),
                _buildMenuItem('구매내역', Icons.shopping_cart_outlined, '5'),
                _buildMenuItem('관심목록', Icons.favorite_border, '12'),
              ],
            ),

            const SizedBox(height: 20),

            // 나의 활동
            _buildSection(
              title: '나의 활동',
              items: [
                _buildMenuItem('동네생활 글', Icons.article_outlined, '2'),
                _buildMenuItem('동네생활 댓글', Icons.chat_bubble_outline, '8'),
                _buildMenuItem('받은 매너 평가', Icons.thumb_up_outlined, '15'),
              ],
            ),

            const SizedBox(height: 20),

            // 기타
            _buildSection(
              title: '기타',
              items: [
                _buildMenuItem('공지사항', Icons.campaign_outlined, null),
                _buildMenuItem('자주 묻는 질문', Icons.help_outline, null),
                _buildMenuItem('약관 및 정책', Icons.description_outlined, null),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppFont(
            title,
            size: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Column(children: items),
        ),
      ],
    );
  }

  Widget _buildMenuItem(String title, IconData icon, String? badge) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.snackbar(
            title,
            '$title 페이지',
            backgroundColor: Colors.purple,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.05),
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white.withOpacity(0.7),
                size: 22,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppFont(
                  title,
                  size: 15,
                ),
              ),
              if (badge != null) ...[
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AppFont(
                    badge,
                    size: 12,
                    color: Colors.purple.shade200,
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Icon(
                Icons.chevron_right,
                color: Colors.white.withOpacity(0.3),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
