import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NearbyPage extends StatelessWidget {
  const NearbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> places = [
      {
        'name': '스타벅스 분당정자점',
        'category': '카페',
        'distance': '150m',
        'rating': 4.5,
        'reviews': 230,
        'image': '☕',
      },
      {
        'name': '올리브영 서현점',
        'category': '뷰티',
        'distance': '300m',
        'rating': 4.3,
        'reviews': 185,
        'image': '💄',
      },
      {
        'name': '정자동 주민센터',
        'category': '공공기관',
        'distance': '450m',
        'rating': 4.0,
        'reviews': 42,
        'image': '🏢',
      },
      {
        'name': '분당 중앙공원',
        'category': '공원',
        'distance': '600m',
        'rating': 4.7,
        'reviews': 512,
        'image': '🌳',
      },
      {
        'name': '교보문고 분당점',
        'category': '서점',
        'distance': '800m',
        'rating': 4.6,
        'reviews': 342,
        'image': '📚',
      },
      {
        'name': '분당 CGV',
        'category': '영화관',
        'distance': '1km',
        'rating': 4.4,
        'reviews': 678,
        'image': '🎬',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xff212123),
      body: Column(
        children: [
          // 검색바
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: '장소, 업종 검색',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white.withOpacity(0.7),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // 카테고리 버튼
          Container(
            height: 76,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCategoryButton('맛집', '🍽️'),
                _buildCategoryButton('카페', '☕'),
                _buildCategoryButton('병원', '🏥'),
                _buildCategoryButton('은행', '🏦'),
                _buildCategoryButton('공원', '🌳'),
                _buildCategoryButton('더보기', '➕'),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.white10),
          // 장소 리스트
          Expanded(
            child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Get.snackbar(
                        '장소 정보',
                        place['name'],
                        backgroundColor: Colors.purple,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                      );
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
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                place['image'],
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppFont(
                                  place['name'],
                                  size: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(height: 4),
                                AppFont(
                                  place['category'],
                                  size: 13,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(width: 4),
                                    AppFont(
                                      '${place['rating']}',
                                      size: 13,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    const SizedBox(width: 8),
                                    AppFont(
                                      '리뷰 ${place['reviews']}',
                                      size: 13,
                                      color: Colors.white.withOpacity(0.6),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.purple,
                              ),
                              const SizedBox(height: 4),
                              AppFont(
                                place['distance'],
                                size: 13,
                                color: Colors.white.withOpacity(0.8),
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

  Widget _buildCategoryButton(String label, String emoji) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 26),
              ),
            ),
          ),
          const SizedBox(height: 4),
          AppFont(
            label,
            size: 11,
            color: Colors.white.withOpacity(0.8),
          ),
        ],
      ),
    );
  }
}
