import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:bamtol_market_app/src/market/market_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationSelectPage extends StatefulWidget {
  const LocationSelectPage({super.key});

  @override
  State<LocationSelectPage> createState() => _LocationSelectPageState();
}

class _LocationSelectPageState extends State<LocationSelectPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _locations = [
    '경기도 성남시 분당구',
    '경기도 성남시 수정구',
    '경기도 성남시 중원구',
    '경기도 수원시 영통구',
    '경기도 수원시 장안구',
    '경기도 수원시 권선구',
    '경기도 수원시 팔달구',
    '경기도 용인시 수지구',
    '경기도 용인시 기흥구',
    '경기도 용인시 처인구',
    '경기도 고양시 덕양구',
    '경기도 고양시 일산동구',
    '경기도 고양시 일산서구',
    '경기도 화성시',
    '경기도 안양시 동안구',
    '경기도 안양시 만안구',
    '경기도 부천시',
    '경기도 광명시',
    '경기도 평택시',
    '경기도 안산시 단원구',
    '경기도 안산시 상록구',
    '경기도 남양주시',
    '경기도 시흥시',
    '경기도 파주시',
    '경기도 의정부시',
  ];
  List<String> _filteredLocations = [];

  @override
  void initState() {
    super.initState();
    _filteredLocations = _locations;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterLocations(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredLocations = _locations;
      } else {
        _filteredLocations = _locations
            .where((location) =>
                location.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xff212123),
        appBar: AppBar(
          title: const AppFont(
            '내 동네 설정',
            size: 18,
            fontWeight: FontWeight.bold,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
        ),
      body: Column(
        children: [
          // 검색 바
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _filterLocations,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: '동네 이름을 검색하세요',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          onPressed: () {
                            _searchController.clear();
                            _filterLocations('');
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ),

          // 안내 텍스트
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppFont(
                  '현재 위치',
                  size: 14,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 8),
                AppFont(
                  'GPS로 현재 위치를 확인할 수 있어요',
                  size: 12,
                  color: Colors.white.withOpacity(0.6),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // 현재 위치 버튼
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.snackbar(
                    '위치 설정',
                    'GPS로 현재 위치를 확인합니다',
                    backgroundColor: Colors.orange,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                    margin: const EdgeInsets.all(20),
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.my_location,
                          color: Colors.orange,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const AppFont(
                        '현재 위치로 설정',
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          // 구분선
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const AppFont(
                  '또는 직접 검색',
                  size: 14,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 동네 목록
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _filteredLocations.length,
              itemBuilder: (context, index) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Get.snackbar(
                        '동네 설정 완료',
                        '${_filteredLocations[index]}로 설정되었습니다',
                        backgroundColor: Colors.orange,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        margin: const EdgeInsets.all(20),
                        duration: const Duration(seconds: 1),
                      );
                      // 1초 후 중고거래 홈으로 이동
                      Future.delayed(const Duration(milliseconds: 1200), () {
                        Get.offAll(
                          () => const MarketHomePage(),
                          transition: Transition.fadeIn,
                        );
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
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
                            Icons.location_on_outlined,
                            color: Colors.white.withOpacity(0.5),
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: AppFont(
                              _filteredLocations[index],
                              size: 15,
                            ),
                          ),
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
              },
            ),
          ),
        ],
      ),
      ),
    );
  }
}
