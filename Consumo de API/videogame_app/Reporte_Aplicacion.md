# Reporte de Aplicación: RAWG Nexus

## Descripción de la Aplicación
**RAWG Nexus** es una aplicación móvil diseñada para los amantes de los videojuegos. Su objetivo principal es ofrecer a los usuarios una interfaz moderna, dinámica y atractiva para descubrir nuevos videojuegos, ver sus calificaciones, géneros y leer descripciones detalladas de los mismos. La aplicación utiliza un diseño con paletas de colores oscuros ("Dark Mode") y detalles en tonos neón, evocando una estética puramente "Gamer" o Cyberpunk.

## Elección de la API
Para alimentar esta aplicación, se eligió la **RAWG Video Games Database API**.
**¿Por qué RAWG?**
1. **Calidad y Cantidad de Datos:** Es la base de datos de videojuegos más grande y completa disponible públicamente.
2. **Imágenes de Alta Calidad:** Proporciona portadas y fondos en alta resolución que son fundamentales para una aplicación altamente visual.
3. **Facilidad de Uso:** Su estructura JSON es muy amigable para ser consumida e iterada mediante objetos de Dart.

## Documentación de Implementación

### Arquitectura
El proyecto Flutter se organizó usando una arquitectura basada en características y responsabilidades:

- `lib/models/game.dart`: Define el modelo de datos. Extrae y formatea el JSON proveniente de la API a objetos de Dart fuertemente tipados.
- `lib/services/api_service.dart`: Contiene la lógica central para hacer peticiones HTTP (`GET`). Maneja la autenticación mediante la clave de API y la deserialización inicial.
- `lib/screens/`:
  - `home_screen.dart`: Muestra una cuadrícula dinámica (`MasonryGridView`) de los juegos mejor valorados. Implementa manejo de estados asíncronos (`FutureBuilder`) para mostrar indicadores de carga.
  - `details_screen.dart`: Pantalla de detalle con un `CustomScrollView` y un `SliverAppBar` que incluye la imagen de fondo del juego con un degradado para fusionarlo con el contenido inferior (Efecto "Hero").
- `lib/widgets/game_card.dart`: Un widget reutilizable que encapsula el diseño individual de cada juego en la pantalla principal. Emplea `CachedNetworkImage` para el manejo eficiente de la memoria y la caché de imágenes.
- `lib/theme/app_colors.dart`: Paleta de colores centralizada que facilita el mantenimiento de los estilos visuales en toda la app.

### Tecnologías Clave Utilizadas
- **Flutter & Dart:** Para el desarrollo cross-platform.
- **http:** Para las llamadas a la API REST.
- **cached_network_image:** Para optimizar la carga de recursos gráficos de RAWG.
- **google_fonts:** Para usar las fuentes *Orbitron* (títulos) e *Inter* (cuerpo).
- **flutter_staggered_grid_view:** Para lograr el efecto tipo "Pinterest" en el listado de videojuegos.

## Organización de Carpetas y Archivos
La estructura del proyecto quedó organizada de la siguiente manera:
```text
videogame_app/
├── android/
├── ios/
├── web/
├── lib/
│   ├── models/
│   │   └── game.dart
│   ├── screens/
│   │   ├── details_screen.dart
│   │   └── home_screen.dart
│   ├── services/
│   │   └── api_service.dart
│   ├── theme/
│   │   └── app_colors.dart
│   ├── widgets/
│   │   └── game_card.dart
│   └── main.dart
├── pubspec.yaml
└── Reporte_Aplicacion.md
```

## Valoración del Proyecto (Versión Completa)
Una versión completa de esta aplicación que incluyera características de producción tales como:
- Autenticación de usuarios (Firebase/Supabase).
- Funcionalidad para marcar juegos como favoritos o "por jugar".
- Búsqueda avanzada y filtros por plataforma/género.
- Notificaciones push sobre nuevos lanzamientos.
- Modos Claro/Oscuro dinámicos.
- Despliegue en App Store y Google Play.

Teniendo en cuenta el diseño UI/UX premium, la integración de APIs, pruebas unitarias y el despliegue, el desarrollo tendría un costo estimado de **$4,500 - $6,000 USD** (Dependiendo del mercado y horas de trabajo de desarrolladores Senior).

*Nota: Por indicaciones, se omiten las capturas de pantalla, pero la interfaz puede ser visualizada compilando el proyecto con `flutter run`.*
