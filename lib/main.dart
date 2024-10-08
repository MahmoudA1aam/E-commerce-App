import 'package:bot_toast/bot_toast.dart';
import 'package:ecommerce/core/application_theme/application_theme.dart';
import 'package:ecommerce/core/cofig/routes.dart';
import 'package:ecommerce/core/widget_helper/myBlocObserver.dart';
import 'package:ecommerce/core/widget_helper/shared_preference.dart';
import 'package:ecommerce/domain/use_case/cart_use_case/add_to_cart_use_case.dart';
import 'package:ecommerce/domain/use_case/cart_use_case/delete_item_of_cart.dart';
import 'package:ecommerce/domain/use_case/cart_use_case/get_from_cart_use_case.dart';
import 'package:ecommerce/domain/use_case/cart_use_case/update_count_of_cart.dart';
import 'package:ecommerce/domain/use_case/favorite_tab_use_case/add_to_favorite_use_case.dart';
import 'package:ecommerce/domain/use_case/favorite_tab_use_case/delete_from_favorite_use_case.dart';
import 'package:ecommerce/domain/use_case/favorite_tab_use_case/get_from_favorite_use_case.dart';
import 'package:ecommerce/presentation/cubit/home_layer/tabs/cart_view/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/cofig/page_route_name.dart';

// GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp(BlocProvider<Cart_FavoriteCubit>(
    create: (context) => Cart_FavoriteCubit(
        addToCartUseCase: injectAddToCartUseCase(),
        getFromCartUseCase: injectGetFromCartUseCase(),
        deleteItemOfCartUseCase: injectDeleteItemOfCartUseCase(),
        updateCountOfCartUseCase: injectUpdateCountOfCartUseCase(),
        deleteFromFavoriteUseCase: injectDeleteFromFavoriteUseCase(),
        getFromFavoriteUseCase: injectGetFromFavoriteUseCase(),
        addToFavoriteUseCase: injectAddToFavoriteUseCase()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // final String route;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ApplicationTheme.appTheme,
          title: "E_Commerce",
          initialRoute: PageRouteName.initial,
          onGenerateRoute: Routes.onGeneratedRoute,
          // navigatorKey: navigatorKey,
          builder: EasyLoading.init(builder: BotToastInit()),
        );
      },
    );
  }
}
