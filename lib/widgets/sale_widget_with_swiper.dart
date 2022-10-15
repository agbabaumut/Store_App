import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:store_app/widgets/sale_widget.dart';

class SaleWidgetWithSwiper extends StatelessWidget {
  const SaleWidgetWithSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Swiper(
        autoplay: true,
        duration: 300,
        itemCount: 4,
        itemBuilder: (ctx, index) {
          return const SaleWidget();
        },
        pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
              activeColor: Colors.orangeAccent,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
