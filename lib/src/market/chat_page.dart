import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chats = [
      {
        'name': '김가지',
        'message': '아직 판매 가능한가요?',
        'time': '방금 전',
        'unread': 2,
        'product': '아이폰 14 Pro',
        'image': '📱',
      },
      {
        'name': '이가지',
        'message': '네 내일 오후 2시 어떠세요?',
        'time': '5분 전',
        'unread': 0,
        'product': '맥북 프로 M2',
        'image': '💻',
      },
      {
        'name': '박가지',
        'message': '직거래 가능한가요?',
        'time': '1시간 전',
        'unread': 1,
        'product': '에어팟 프로',
        'image': '🎧',
      },
      {
        'name': '최가지',
        'message': '감사합니다!',
        'time': '어제',
        'unread': 0,
        'product': '갤럭시 워치',
        'image': '⌚',
      },
      {
        'name': '정가지',
        'message': '사진 더 보내주실 수 있나요?',
        'time': '2일 전',
        'unread': 0,
        'product': '닌텐도 스위치',
        'image': '🎮',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xff212123),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Get.snackbar(
                  '채팅',
                  '${chat['name']}님과의 채팅',
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
                    // 프로필 + 뱃지
                    Stack(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.purple.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: AppFont(
                              chat['name'][0],
                              size: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (chat['unread'] > 0)
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ),
                              child: Center(
                                child: AppFont(
                                  '${chat['unread']}',
                                  size: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    // 채팅 내용
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              AppFont(
                                chat['name'],
                                size: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              const Spacer(),
                              AppFont(
                                chat['time'],
                                size: 12,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          AppFont(
                            chat['message'],
                            size: 14,
                            color: chat['unread'] > 0
                                ? Colors.white
                                : Colors.white.withOpacity(0.6),
                            fontWeight: chat['unread'] > 0
                                ? FontWeight.w500
                                : FontWeight.normal,
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Text(
                                chat['image'],
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(width: 6),
                              AppFont(
                                chat['product'],
                                size: 12,
                                color: Colors.white.withOpacity(0.5),
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
        },
      ),
    );
  }
}
