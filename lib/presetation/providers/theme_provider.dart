
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';


//un simple bool que indica si es dark o light
final isDarkThemeProvider = StateProvider((ref) => false); // StateProvider sirve para mantener una pieza de estado



//Listado de colores inmutable

//es un provider que no cambia (const) por lo tanto se le asigna una lista de colores que no cambia (const)
final colorListProvider = Provider((ref) => colorList); 

//un simple int
final selectedColorProviderIndex = StateProvider((ref) => 0); // StateProvider sirve para mantener una pieza de estado

//un objeto de tipo AppTheme (custom)
// StateNotifierProvider sirve para mantener una pieza de estado y notificar a los consumidores cuando cambia
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier,AppTheme>(
  (ref) => ThemeNotifier(),
  );

//controler o notifier con este el mismo se pone provider o stateProvider
class ThemeNotifier extends StateNotifier<AppTheme>{
   //se inicializa con el tema por defecto es decir esa clase AppTheme es el admin, el super key
  //STATE = new AppTheme() it's the same below
  ThemeNotifier() : super(AppTheme());

  void toggleDarkAMode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex){
    state = state.copyWith(selectedColor: colorIndex);
  }

}