library;

import 'package:ecommerce_app/common/index.dart';
import 'package:ecommerce_app/core/index.dart';
import 'package:ecommerce_app/data/product/index.dart';
import 'package:ecommerce_app/domain/product/index.dart';
import 'package:ecommerce_app/domain/search/index.dart';
import 'package:ecommerce_app/presentation/home/index.dart';
import 'package:ecommerce_app/presentation/product/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// bloc
part 'bloc/select_filter_by_type_cubit.dart';
part 'pages/search_view.dart';
part 'widgets/build_bottom_sheet_option.dart';
part 'widgets/build_gender_bottom_sheet.dart';
part 'widgets/build_onsale_bottom_sheet.dart';
part 'widgets/build_price_bottom_sheet.dart';
part 'widgets/build_sort_by_bottom_sheet.dart';
part 'widgets/filter_chip.dart';
part 'widgets/filter_option_search.dart';
part 'widgets/filter_section.dart';
part 'widgets/filter_type_bottom_sheet.dart';
