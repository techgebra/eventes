import 'package:evantez/app/router/router_constant.dart';
import 'package:evantez/src/view/core//constants/app_images.dart';
import 'package:evantez/src/view/view/transactions/payment/payment_view/widgets/payment_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/themes/typography.dart';
import '../../../../core/widgets/custom_textfield.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.of(context).size;
    return SizedBox(
      height: kSize.height,
      width: kSize.width,
      child: Column(
        children: [
          appBar(context, kSize),
          SizedBox(
            height: kSize.height * 0.018,
          ),
          searchField(kSize),
          SizedBox(
            height: kSize.height * 0.050,
          ),
          paymentHistory(kSize),
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context, Size kSize) {
    return AppBar(
      elevation: 0,
      leading: const SizedBox(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
      title: Text(
        AppStrings.paymentText,
        style: AppTypography.poppinsSemiBold.copyWith(
          color: AppColors.secondaryColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            //
            Navigator.pushNamed(context, RouterConstants.newPaymentRoute);
          },
          icon: SvgPicture.asset(
            AppImages.addCircle,
            colorFilter: const ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
        )
      ],
    );
  }

  Widget searchField(Size kSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.baseBorderRadius),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: CustomTextField(
              text: '',
              hintText: AppStrings.searchText,
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: SvgPicture.asset(
                  AppImages.search,
                  colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                ),
              ),
            ),
          ),
          SizedBox(
            width: kSize.width * 0.032,
          ),
          SizedBox(
            width: kSize.width * 0.1,
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                ),
                onPressed: () {},
                child: SvgPicture.asset(
                  AppImages.filter,
                  colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                )),
          )
        ],
      ),
    );
  }

  Widget paymentHistory(Size kSize) {
    return Expanded(
        child: ListView.builder(
            itemCount: 10,
            padding: EdgeInsets.only(
                right: AppConstants.basePadding,
                bottom: kSize.height * 0.15,
                left: AppConstants.baseBorderRadius),
            itemBuilder: (context, index) {
              return const PaymentTile();
            }));
  }
}
