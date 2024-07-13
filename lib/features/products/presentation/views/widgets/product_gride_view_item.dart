import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_task/core/helper/extensions/assetss_widgets.dart';
import 'package:route_task/core/helper/utilities/app_color.dart';
import 'package:route_task/core/helper/utilities/app_strings.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.des,
    required this.price,
    required this.oldPrice,
    required this.review,
    this.onTap,
  });
  final String image;
  final String title;
  final String des;
  final double price;
  final num oldPrice;
  final String review;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: AppColors.main),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // image and love icon ....................................................
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    fit: BoxFit.contain,
                    imageUrl: image,
                  ),
                ),
                // love icon ...........................................................
                Positioned(
                  top: 5,
                  right: 5,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Container(
                      padding: 3.aEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          AppStrings.loveIcon,
                          color: AppColors.main,
                          height: 18,
                          width: 19,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // title and price and cart icon ..........................................
          Container(
            padding: 10.aEdge,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                des,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Text('EGP $price'),
                  8.wSize,
                  // salary before ......
                  Text(
                    'EGP $oldPrice',
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Color(0xff004182),
                    ),
                  ),
                ],
              ),
              6.hSize,
              Row(children: [
                // review icon and number of review...............................
                Text(
                  'Review($review)',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                6.wSize,
                const Icon(Icons.star, color: Colors.amber, size: 15),
                const Spacer(),
                // add to cart icon ................................................
                GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset(
                    AppStrings.plusTocartIcon,
                  ),
                )
              ])
            ]),
          )
        ],
      ),
    );
  }
}
