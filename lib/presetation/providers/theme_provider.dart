
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';


//un simple bool que indica si es dark o light
final isDarkThemeProvider = StateProvider((ref) => false); 


//Listado de colores inmutable

//es un provider que no cambia (const) por lo tanto se le asigna una lista de colores que no cambia (const)
final colorListProvider = Provider((ref) => colorList); 

//un simple int
final selectedColorProviderIndex = StateProvider((ref) => 0);