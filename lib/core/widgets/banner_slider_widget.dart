import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_gradients.dart';

class BannerSliderWidget extends StatefulWidget {
  const BannerSliderWidget({super.key});

  @override
  State<BannerSliderWidget> createState() => _BannerSliderWidgetState();
}

class _BannerSliderWidgetState extends State<BannerSliderWidget> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  final List<Map<String, String>> _banners = [
    {
      'title': 'Explore Bangladesh by Train',
      'subtitle': 'Official Bangladesh Railway Intercity Network',
      'tag': 'Official Booking',
      'image': 'https://images.unsplash.com/photo-1596176530529-78163a4f7af2?auto=format&fit=crop&w=1200&q=80',
    },
    {
      'title': 'Cox\'s Bazar Express Direct',
      'subtitle': 'Direct Non-Stop Journey to Dhaka - Cox\'s Bazar',
      'tag': 'Special Route',
      'image': 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?auto=format&fit=crop&w=1200&q=80',
    },
    {
      'title': 'Instant E-Ticketing & PNR',
      'subtitle': 'Interactive Seat Selection & QR Verification',
      'tag': 'Smart Transit',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo0fWqUPmRJYXcsajNqxAQvb_H6ylD1BtZWw1je5WDrw&s=10',
    },
    {
      'title': 'Instant E-Ticketing & PNR',
      'subtitle': 'Interactive Seat Selection & QR Verification',
      'tag': 'Smart Transit',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlYjFYTdvtvZHVtOV36mI642AfXH6a-mjS9XxdswQEtxDEOVH6StKa4as&s=10',
    },
    {
      'title': 'Instant E-Ticketing & PNR',
      'subtitle': 'Interactive Seat Selection & QR Verification',
      'tag': 'Smart Transit',
      'image': 'https://images.unsplash.com/photo-1474487548417-781cb71495f3?auto=format&fit=crop&w=1200&q=80',
    },
    {
      'title': 'Instant E-Ticketing & PNR',
      'subtitle': 'Interactive Seat Selection & QR Verification',
      'tag': 'Smart Transit',
      'image': 'hhttps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo0fWqUPmRJYXcsajNqxAQvb_H6ylD1BtZWw1je5WDrw&s=10',
    },
    {
      'title': 'Instant E-Ticketing & PNR',
      'subtitle': 'Interactive Seat Selection & QR Verification',
      'tag': 'Smart Transit',
      'image': 'https://images.unsplash.com/photo-1474487548417-781cb71495f3?auto=format&fit=crop&w=1200&q=80',
    },{
      'title': 'Instant E-Ticketing & PNR',
      'subtitle': 'Interactive Seat Selection & QR Verification',
      'tag': 'Smart Transit',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo0fWqUPmRJYXcsajNqxAQvb_H6ylD1BtZWw1je5WDrw&s=10',
    },{
      'title': 'Instant E-Ticketing & PNR',
      'subtitle': 'Interactive Seat Selection & QR Verification',
      'tag': 'Smart Transit',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRl2Rnk6HVrrbO1Au3dommzvdj9BWiOkD69pqMSPo3tg&s=10',
    },{
      'title': 'Instant E-Ticketing & PNR',
      'subtitle': 'Interactive Seat Selection & QR Verification',
      'tag': 'Smart Transit',
      'image': 'https://ecdn.dhakatribune.net/contents/cache/images/1200x630x1xxxxx1x694528/uploads/dten/2019/06/web-eid-train-2-zakir-1559570760357.jpg?watermark=media%2F2023%2F05%2F28%2F1280px-Dhaka_Tribune_Logo.svg-1-a9e61c86dded62d74300fef48fee558f.png',
    },{
      'title': 'Instant E-Ticketing & PNR',
      'subtitle': 'Interactive Seat Selection & QR Verification',
      'tag': 'Smart Transit',
      'image': 'https://images.unsplash.com/photo-1474487548417-781cb71495f3?auto=format&fit=crop&w=1200&q=80',
    },{
      'title': 'Instant E-Ticketing & PNR',
      'subtitle': 'Interactive Seat Selection & QR Verification',
      'tag': 'Smart Transit',
      'image': 'https://images.unsplash.com/photo-1474487548417-781cb71495f3?auto=format&fit=crop&w=1200&q=80',
    },{
      'title': 'Instant E-Ticketing & PNR',
      'subtitle': 'Interactive Seat Selection & QR Verification',
      'tag': 'Smart Transit',
      'image': 'https://ecdn.dhakatribune.net/contents/cache/images/1200x630x1xxxxx1x694528/uploads/dten/2019/06/web-eid-train-2-zakir-1559570760357.jpg?watermark=media%2F2023%2F05%2F28%2F1280px-Dhaka_Tribune_Logo.svg-1-a9e61c86dded62d74300fef48fee558f.png',
    },{
      'title': 'Instant E-Ticketing & PNR',
      'subtitle': 'Interactive Seat Selection & QR Verification',
      'tag': 'Smart Transit',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfRiMxhH5Jy1B4U7cQ1itOwGa0dqEZGNQoh2umw1CubA&s=10',
    },{
      'title': 'Instant E-Ticketing & PNR',
      'subtitle': 'Interactive Seat Selection & QR Verification',
      'tag': 'Smart Transit',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZqh486uS_eNWHLy6V8R3wnzVyLf1jP5oh8X9TAwdElg&s=10',
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_pageController.hasClients) {
        int nextIndex = (_currentIndex + 1) % _banners.length;
        _pageController.animateToPage(
          nextIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.25),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _banners.length,
              itemBuilder: (context, index) {
                final banner = _banners[index];
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      banner['image']!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        decoration: BoxDecoration(gradient: AppGradients.primaryGradient(context)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              banner['tag']!,
                              style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            banner['title']!,
                            style: AppTextStyles.headlineMedium(context).copyWith(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            banner['subtitle']!,
                            style: AppTextStyles.bodySmall(context).copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 12,
              right: 16,
              child: Row(
                children: List.generate(
                  _banners.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.only(left: 4),
                    width: _currentIndex == index ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? colorScheme.primary : Colors.white54,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
