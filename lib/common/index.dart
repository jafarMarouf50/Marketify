library;

import 'dart:developer';

import 'package:ecommerce_app/core/index.dart';
import 'package:ecommerce_app/presentation/home/index.dart';
import 'package:ecommerce_app/presentation/notification/index.dart';
import 'package:ecommerce_app/presentation/profile/index.dart';
import 'package:ecommerce_app/presentation/receipt/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

//bloc
part './bloc/button/button_cubit.dart';
part './bloc/button/button_state.dart';
part 'helper/bottomsheet/app_bottomsheet.dart';
part 'helper/functions/paresToUserEntity.dart';
part 'helper/functions/saveDataInLocalDB.dart';
// helpers
part 'helper/navigator/app_navigator.dart';
part 'helper/snackbar/snackbar.dart';
//widgets
part 'widget/appbar/basic_app_bar.dart';
part 'widget/bottom_nav_bar/bottom_nav_bar.dart';
part 'widget/bottom_nav_bar/custom_bottom_nav_bar.dart';
part 'widget/button/basic_app_button.dart';
part 'widget/button/basic_reactive_button.dart';
part 'widget/empty_notifications_and_orders/empty_notifications_and_orders.dart';
part 'widget/product_card/product_card.dart';
