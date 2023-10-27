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
    )
  ], 
);
