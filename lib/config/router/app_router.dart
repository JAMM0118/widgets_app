import 'package:go_router/go_router.dart';
import 'package:widgets_app/presetation/screens/screens.dart';

//GoRouter configuracion

//gueva don't cry

final appRouter = GoRouter(
  initialLocation: '/',
  routes:[


    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen(),
    ),
     
     GoRoute(
      path: "/buttons",
      builder: (context, state) => const ButtonsScreen(),
    ), 
    
    GoRoute(
      path: "/cards",
      builder: (context, state) => const CardsScreen(),
    ), 
    
    GoRoute(
      path: "/nice",
      builder: (context, state) => const NiceScreen(),
    ),
     
    GoRoute(
      path: "/progress",
      builder: (context, state) => const ProgressScreen(),
    ),

     GoRoute(
      path: "/snackbar",
      builder: (context, state) => const SnackBarScreen(),
    ),
    
    GoRoute(
      path: "/animated",
      builder: (context, state) => const AnimatedScreen(),
    ),
    GoRoute(
      path: "/ui_controls",
      builder: (context, state) => const UiControlsScreen(),
    ),
     GoRoute(
      path: "/app_tutorial",
      builder: (context, state) => const AppTutorialScreen(),
    ),
     GoRoute(
      path: "/infinite",
      builder: (context, state) => const InfiniteScrollScreen(),
    ),
    GoRoute(
      path: "/counter-riverpod",
      builder: (context, state) => const CounterScreen(),
    ),
    GoRoute(
      path: "/theme-changer",
      builder: (context, state) => const ThemeChangerScreen(),
    )
  ], 
);
