import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_task/core/helper/extensions/assetss_widgets.dart';
import 'package:route_task/core/helper/utilities/app_color.dart';
import 'package:route_task/core/helper/utilities/app_strings.dart';
import 'package:route_task/core/widgets/app_text_form_field.dart';
import 'package:route_task/features/products/data/repos/product_repo_imple.dart';
import 'package:route_task/features/products/presentation/manager/product_cubit/product_cubit.dart';
import 'package:route_task/features/products/presentation/views/widgets/product_gride_view_item.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
          child: BlocProvider(
            create: (context) =>
                ProductCubit(ProductRepoImple())..getProducts(),
            child: BlocConsumer<ProductCubit, ProductState>(
              listener: (context, state) {},
              builder: (context, state) {
                var productCubit = ProductCubit.get(context);
                var productList = productCubit.allProductsList;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // logo image ............................................................
                    SvgPicture.asset(
                      AppStrings.logo,
                      height: 30,
                      color: AppColors.main,
                    ),
                    20.hSize,
                    // search bar ............................................................
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: MainTextField(
                            onChanged: (value) async {},
                            hintText: 'what do you search for?',
                            prefixIcon: Icons.search,
                            fillColor: Colors.transparent,
                            border: searchBorder(),
                            focusedBorder: searchBorder(),
                            enabledBorder: searchBorder(),
                          ),
                        ),
                        20.wSize,
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            AppStrings.cartIcon,
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                    10.hSize,
                    // product grid view ................................................
                    Expanded(
                      child: state is ProductLoading
                          ? const Center(child: CircularProgressIndicator())
                          : state is Productfailuer
                              ? Center(
                                  child: Text(
                                    state.error,
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    childAspectRatio: 1 / 1.2,
                                  ),
                                  itemBuilder: (context, index) =>
                                      ProductItemWidget(
                                    image: productList[index].image ?? '',
                                    title: productList[index].title ?? '',
                                    price: productList[index].price ?? 0.0,
                                    oldPrice:
                                        productList[index].discountPercentage ??
                                            0.0,
                                    onTap: () {},
                                    des: productList[index].description ?? '',
                                    review:
                                        productList[index].rating.toString(),
                                  ),
                                  itemCount: productList.length,
                                ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

InputBorder searchBorder() {
  return OutlineInputBorder(
    borderRadius: 50.cBorder,
    borderSide: const BorderSide(
      color: AppColors.main,
      width: 0.5,
    ),
  );
}
