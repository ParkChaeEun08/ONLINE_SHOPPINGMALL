import 'package:flutter/material.dart';
import 'package:nakwon_online_shoppingmall/pages/cart/shopping_cart_Page.dart';
import 'package:nakwon_online_shoppingmall/album.dart';

class DetailPage extends StatelessWidget {
  final Album album; // Album 객체를 받기 위한 변수

  const DetailPage({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NakWon',
          style: TextStyle(
              fontFamily: "Inter-Italic",
              fontWeight: FontWeight.w100,
              color: Colors.white), // AppBar의 글자 색상 설정
        ),
        backgroundColor: Colors.black, // AppBar의 배경 색상 설정
        centerTitle: true, // 제목의 위치를 가운데로 설정
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart), // 장바구니 아이콘 설정
            onPressed: () {
              // 장바구니 페이지로 이동하는 코드
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShoppingCartPage()));
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 요소들을 왼쪽 정렬
        children: [
          Image.network(album.imagePath), // 앨범 커버 이미지 표시
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              album.song,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold), // 제목 스타일 설정
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '₩${album.price}',
              style: const TextStyle(
                  fontSize: 20, color: Colors.green), // 가격 스타일 설정
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // 장바구니에 담는 기능
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('장바구니에 담겼습니다'),
                  ),
                );
              },
              child: const Text('장바구니에 담기'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              album.artist, // 가수 이름 표시
            ),
          ),
        ],
      ),
    );
  }
}
