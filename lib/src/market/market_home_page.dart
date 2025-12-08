import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:bamtol_market_app/src/init/page/location_select_page.dart';
import 'package:bamtol_market_app/src/market/community_page.dart';
import 'package:bamtol_market_app/src/market/nearby_page.dart';
import 'package:bamtol_market_app/src/market/chat_page.dart';
import 'package:bamtol_market_app/src/market/my_profile_page.dart';
import 'package:bamtol_market_app/src/market/product_add_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarketHomePage extends StatefulWidget {
  const MarketHomePage({super.key});

  @override
  State<MarketHomePage> createState() => _MarketHomePageState();
}

class _MarketHomePageState extends State<MarketHomePage> {
  int _selectedIndex = 0;
  final String _selectedLocation = '경기도 성남시 분당구';

  // 샘플 상품 데이터
  List<Map<String, dynamic>> _products = [
    {
      'title': '아이폰 14 Pro',
      'price': 850000,
      'location': '분당구 정자동',
      'time': '5분 전',
      'likes': 12,
      'chats': 3,
      'image': '📱',
    },
    {
      'title': '맥북 프로 M2',
      'price': 1500000,
      'location': '분당구 서현동',
      'time': '1시간 전',
      'likes': 25,
      'chats': 8,
      'image': '💻',
    },
    {
      'title': '에어팟 프로 2세대',
      'price': 180000,
      'location': '분당구 야탑동',
      'time': '2시간 전',
      'likes': 8,
      'chats': 2,
      'image': '🎧',
    },
    {
      'title': '갤럭시 워치 6',
      'price': 200000,
      'location': '분당구 정자동',
      'time': '3시간 전',
      'likes': 15,
      'chats': 5,
      'image': '⌚',
    },
    {
      'title': '닌텐도 스위치',
      'price': 250000,
      'location': '분당구 수내동',
      'time': '5시간 전',
      'likes': 20,
      'chats': 7,
      'image': '🎮',
    },
    {
      'title': '무선 청소기',
      'price': 150000,
      'location': '분당구 서현동',
      'time': '6시간 전',
      'likes': 10,
      'chats': 4,
      'image': '🧹',
    },
  ];

  void _addProduct(Map<String, dynamic> newProduct) {
    setState(() {
      _products.insert(0, newProduct);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
    Get.snackbar(
      '삭제 완료',
      '상품이 삭제되었습니다',
      backgroundColor: Colors.purple,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212123),
      appBar: AppBar(
        title: Row(
          children: [
            AppFont(
              _selectedLocation,
              size: 16,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
            onPressed: () {
              Get.off(() => const LocationSelectPage());
            },
            tooltip: '위치 재설정',
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Get.snackbar(
                '검색',
                '검색 기능',
                backgroundColor: Colors.purple,
                colorText: Colors.white,
                snackPosition: SnackPosition.TOP,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {
              Get.snackbar(
                '알림',
                '새로운 알림이 없습니다',
                backgroundColor: Colors.purple,
                colorText: Colors.white,
                snackPosition: SnackPosition.TOP,
              );
            },
          ),
        ],
      ),
      body: _selectedIndex == 0
          ? _buildHomeTab()
          : _selectedIndex == 1
              ? const CommunityPage()
              : _selectedIndex == 2
                  ? const NearbyPage()
                  : _selectedIndex == 3
                      ? const ChatPage()
                      : const MyProfilePage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => ProductAddPage(onProductAdded: _addProduct));
        },
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: const Color(0xff2a2a2c),
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            activeIcon: Icon(Icons.article),
            label: '동네생활',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            activeIcon: Icon(Icons.location_on),
            label: '내 근처',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat_bubble),
            label: '채팅',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: '나의 가지',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeTab() {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        Get.snackbar(
          '새로고침',
          '최신 상품을 불러왔습니다',
          backgroundColor: Colors.purple,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1),
        );
      },
      color: Colors.purple,
      child: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return _buildProductCard(product, index);
        },
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product, int index) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.snackbar(
            '상품 상세',
            '${product['title']} 상세 페이지',
            backgroundColor: Colors.purple,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        onLongPress: () {
          Get.dialog(
            AlertDialog(
              backgroundColor: const Color(0xff2a2a2c),
              title: const AppFont(
                '상품 삭제',
                size: 18,
                fontWeight: FontWeight.bold,
              ),
              content: AppFont(
                '"${product['title']}"을(ub97c) 삭제하시겠습니까?',
                size: 14,
                color: Colors.white.withOpacity(0.8),
              ),
              actions: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: const AppFont(
                    '취소',
                    size: 14,
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                    _deleteProduct(index);
                  },
                  child: const AppFont(
                    '삭제',
                    size: 14,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상품 이미지
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    product['image'],
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // 상품 정보
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppFont(
                      product['title'],
                      size: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 4),
                    AppFont(
                      '${product['location']} · ${product['time']}',
                      size: 13,
                      color: Colors.white.withOpacity(0.6),
                    ),
                    const SizedBox(height: 8),
                    AppFont(
                      '${_formatPrice(product['price'])}원',
                      size: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 16,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        const SizedBox(width: 4),
                        AppFont(
                          '${product['chats']}',
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
                          '${product['likes']}',
                          size: 13,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatPrice(int price) {
    if (price >= 10000) {
      int man = price ~/ 10000;
      int remainder = price % 10000;
      if (remainder == 0) {
        return '$man만';
      } else {
        return '$man만 ${remainder ~/ 1000}천';
      }
    } else if (price >= 1000) {
      return '${price ~/ 1000}천';
    } else {
      return price.toString();
    }
  }
}
