import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:bamtol_market_app/src/init/page/location_select_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitStartPage extends StatefulWidget {
  final Function() onStart;
  const InitStartPage({super.key, required this.onStart});

  @override
  State<InitStartPage> createState() => _InitStartPageState();
}

class _InitStartPageState extends State<InitStartPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.elasticOut),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF2D2D2D),
              const Color(0xFF1A1A1A),
              const Color(0xFF0D0D0D),
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 로고 애니메이션
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: 120,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.3),
                            blurRadius: 30,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          '🍆',
                          style: TextStyle(fontSize: 80),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                
                // 타이틀 애니메이션
                SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      children: [
                        const AppFont(
                          '당신 근처의 가지마켓',
                          fontWeight: FontWeight.bold,
                          size: 24,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: 60,
                          height: 4,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.purple,
                                Colors.purple.withOpacity(0.3),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                
                // 설명 텍스트 애니메이션
                SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: AppFont(
                        '중고 거래부터 동네 정보까지,\n지금 내 동네를 선택하고 시작해보세요!',
                        align: TextAlign.center,
                        size: 16,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // 특징 아이콘들
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildFeatureIcon(Icons.shopping_bag, '중고거래'),
                      const SizedBox(width: 40),
                      _buildFeatureIcon(Icons.location_on, '동네정보'),
                      const SizedBox(width: 40),
                      _buildFeatureIcon(Icons.people, '이웃소통'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: FadeTransition(
        opacity: _fadeAnimation,
        child: Padding(
          padding: EdgeInsets.only(
            left: 25,
            right: 25,
            bottom: 25 + Get.mediaQuery.padding.bottom,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  Colors.purple,
                  Colors.purple.shade700,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.4),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // 동네 선택 페이지로 이동
                  Get.to(
                    () => const LocationSelectPage(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(milliseconds: 300),
                  );
                  // onStart는 동네 선택 완료 후 호출하도록 변경
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      AppFont(
                        '시작하기',
                        align: TextAlign.center,
                        size: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            color: Colors.purple,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        AppFont(
          label,
          size: 12,
          color: Colors.white.withOpacity(0.6),
        ),
      ],
    );
  }
}
