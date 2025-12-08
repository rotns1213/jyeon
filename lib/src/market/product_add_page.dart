import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAddPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onProductAdded;
  
  const ProductAddPage({super.key, required this.onProductAdded});

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedCategory = '디지털기기';

  final List<String> _categories = [
    '디지털기기',
    '가구/인테리어',
    '유아동',
    '생활/가공식품',
    '스포츠/레저',
    '여성잡화',
    '남성패션/잡화',
    '게임/취미',
    '뷰티/미용',
    '도서',
    '기타 중고물품',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212123),
      appBar: AppBar(
        title: const AppFont(
          '내 물건 팔기',
          size: 18,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_titleController.text.isEmpty) {
                Get.snackbar(
                  '알림',
                  '제목을 입력해주세요',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.TOP,
                );
                return;
              }
              if (_priceController.text.isEmpty) {
                Get.snackbar(
                  '알림',
                  '가격을 입력해주세요',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.TOP,
                );
                return;
              }
              
              // 새 상품 데이터 생성
              final newProduct = {
                'title': _titleController.text,
                'price': int.tryParse(_priceController.text.replaceAll(',', '')) ?? 0,
                'location': '분당구',
                'time': '방금 전',
                'likes': 0,
                'chats': 0,
                'image': '📦',
                'category': _selectedCategory,
                'description': _descriptionController.text,
              };
              
              // 상품 추가 콜백 호출
              widget.onProductAdded(newProduct);
              
              Get.snackbar(
                '완료',
                '게시물이 등록되었습니다',
                backgroundColor: Colors.purple,
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM,
              );
              Get.back();
            },
            child: const AppFont(
              '완료',
              size: 16,
              color: Colors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 이미지 추가 영역
            Container(
              height: 120,
              color: Colors.grey[900],
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(16),
                children: [
                  _buildAddImageBox(),
                  const SizedBox(width: 8),
                  _buildImagePreview('📸'),
                  const SizedBox(width: 8),
                  _buildImagePreview('📷'),
                ],
              ),
            ),
            const Divider(height: 1, color: Colors.white10),
            
            // 제목 입력
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppFont(
                    '제목',
                    size: 14,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _titleController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: '제목을 입력하세요',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      filled: true,
                      fillColor: Colors.grey[900],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 카테고리 선택
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppFont(
                    '카테고리',
                    size: 14,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedCategory,
                        isExpanded: true,
                        dropdownColor: Colors.grey[900],
                        style: const TextStyle(color: Colors.white),
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                        items: _categories.map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: AppFont(category, size: 16),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _selectedCategory = newValue;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 가격 입력
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppFont(
                    '가격',
                    size: 14,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: '가격을 입력하세요',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      suffixText: '원',
                      suffixStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[900],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 설명 입력
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppFont(
                    '설명',
                    size: 14,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _descriptionController,
                    maxLines: 8,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: '올릴 게시글 내용을 작성해주세요.\n가격, 거래 방법, 물품 상태 등을 자세히 적어주세요.',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      filled: true,
                      fillColor: Colors.grey[900],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildAddImageBox() {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[700]!, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.camera_alt, color: Colors.grey[400], size: 32),
          const SizedBox(height: 4),
          AppFont(
            '0/10',
            size: 12,
            color: Colors.grey[400]!,
          ),
        ],
      ),
    );
  }

  Widget _buildImagePreview(String emoji) {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 40),
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
