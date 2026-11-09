# ChronoSoft — Kit Oficial de Identidad Visual (`branding/`)

Este directorio contiene el rediseño vectorial limpio y de alta resolución del logo de **ChronoSoft**, conservando la geometría exacta del monograma entrelazado **"CS"** original, eliminando por completo los bordes pixelados/artefactos de recorte y aplicando la paleta oficial del ecosistema (**Sky Cyan `#38BDF8`**, **Chrono Primary Blue `#0284C7`**, **Deep Ocean `#0369A1`**, **Slate Indigo `#0F172A`** y **Champagne Gold `#EABA70 → #D49448`**).

> 💡 **Catálogo Interactivo:** Abre [`index.html`](./index.html) en cualquier navegador para previsualizar todas las variantes sobre fondos claros, oscuros y cuadrícula transparente, y descargar cada formato con un clic.

---

## Estructura de Carpetas

### 1. [`svg/`](./svg/) — Vectores Maestros Escalables
Ideales para web moderna, impresión de gran formato y edición en Illustrator/Figma:
- `chronosoft-icon-color.svg` / `favicon.svg` — Isotipo "CS" corto a color.
- `chronosoft-icon-mono-dark.svg` / `chronosoft-icon-mono-white.svg` — Isotipo monocromático (`#0F172A` y `#FFFFFF`).
- `chronosoft-stacked-light.svg` / `chronosoft-stacked-dark.svg` — Logo vertical clásico (`2263×1321`).
- `chronosoft-stacked-bicolor-light.svg` / `chronosoft-stacked-bicolor-dark.svg` — Logo vertical bicolor (`Chrono` + `Soft` en azul/cian).
- `chronosoft-horizontal-light.svg` / `chronosoft-horizontal-dark.svg` — Logo largo horizontal (`2400×680`).
- `chronosoft-horizontal-bicolor-light.svg` / `chronosoft-horizontal-bicolor-dark.svg` — Logo largo horizontal bicolor (`2400×680`).
- `chronosoft-avatar-dark.svg` — Avatar app icon vectorial (`1024×1024`).

### 2. [`png/`](./png/) — PNG Transparentes (Renderizados con Supersampling 4x)
- **Vertical / Apilado (`2263×1321`)**:
  - `chronosoft-vertical-light.png` (para fondos claros)
  - `chronosoft-vertical-dark.png` (para fondos oscuros, texto blanco puro sin halo)
  - `chronosoft-vertical-bicolor-light.png`
  - `chronosoft-vertical-bicolor-dark.png`
- **Largo / Horizontal (`2400×680`)**:
  - `chronosoft-largo-light.png`
  - `chronosoft-largo-dark.png`
  - `chronosoft-largo-bicolor-light.png`
  - `chronosoft-largo-bicolor-dark.png`
  - `chronosoft-largo-mono-dark.png`
  - `chronosoft-largo-mono-white.png`
- **Corto / Isotipo (`1024×840`)**:
  - `chronosoft-corto-color.png`
  - `chronosoft-corto-mono-dark.png`
  - `chronosoft-corto-mono-white.png`
  - `chronosoft-corto-mono-black.png`
- **Banners HD (`1920×1080`)**:
  - `chronosoft-banner-dark-1920x1080.png`
  - `chronosoft-banner-light-1920x1080.png`

### 3. [`jpg/`](./jpg/) — JPG de Alta Calidad (Calidad 98%)
Versiones listas para plataformas que no admiten transparencia, sobre fondo Blanco (`#FFFFFF`) o Índigo Nocturno (`#090D16`):
- `chronosoft-vertical-light.jpg` / `chronosoft-vertical-dark.jpg`
- `chronosoft-vertical-bicolor-light.jpg` / `chronosoft-vertical-bicolor-dark.jpg`
- `chronosoft-largo-light.jpg` / `chronosoft-largo-dark.jpg`
- `chronosoft-largo-bicolor-light.jpg` / `chronosoft-largo-bicolor-dark.jpg`
- `chronosoft-largo-mono-dark.jpg` / `chronosoft-largo-mono-white.jpg`
- `chronosoft-corto-light.jpg` / `chronosoft-corto-dark.jpg`
- `chronosoft-avatar-dark.jpg` / `chronosoft-avatar-light.jpg` / `chronosoft-avatar-gradient.jpg`
- `chronosoft-banner-dark-1920x1080.jpg` / `chronosoft-banner-light-1920x1080.jpg`

### 4. [`avatar/`](./avatar/) — Avatares y App Icons (`1024×1024` y `512×512`)
Tres temas (`dark`, `light`, `gradient`) en tres recortes geométricos (`square`, `rounded` estilo iOS/Android, `circle`):
- `chronosoft-avatar-dark-square-1024.png` / `-rounded-1024.png` / `-circle-1024.png` (y versiones `-512.png`)
- `chronosoft-avatar-light-square-1024.png` / `-rounded-1024.png` / `-circle-1024.png` (y versiones `-512.png`)
- `chronosoft-avatar-gradient-square-1024.png` / `-rounded-1024.png` / `-circle-1024.png` (y versiones `-512.png`)

### 5. [`ico/`](./ico/) — Favicons e Iconos de Sistema Windows/Web
Contenedores `.ico` reales con **6 resoluciones embebidas** (`16×16`, `32×32`, `48×48`, `64×64`, `128×128`, `256×256`):
- `favicon.ico` — Monograma "CS" con fondo transparente.
- `chronosoft-badge-dark.ico` — Icono de aplicación con fondo oscuro redondeado.
- `chronosoft-badge-light.ico` — Icono de aplicación con fondo claro redondeado.
- `favicon-16x16.png`, `favicon-32x32.png`, `favicon-48x48.png`, `favicon-64x64.png`, `apple-touch-icon.png` (`180×180`), `android-chrome-192x192.png`, `android-chrome-512x512.png`.

### 6. [`thermal-ticket/`](./thermal-ticket/) — Impresoras Térmicas ESC/POS (58mm y 80mm)
Optimizados en negro puro (`#000000`) sin grises intermedios y con peso **~4 KB** (muy por debajo del tope de `30 KB` del PR/backend):
- `chronosoft-ticket-logo.png` (`400×227`, reemplazo exacto para `backend-parking/prisma/seed/assets/chronosoft-ticket-logo.png`).
- `chronosoft-ticket-horizontal.png` (`384×110`, versión compacta horizontal que ahorra la mitad del papel vertical en cada tirilla).

### 7. [`compat/`](./compat/) — Nombres Exactos para Reemplazo Directo (Drop-in)
Copias con los nombres exactos que usan actualmente los proyectos del workspace:
- `BLACK_LOGO.png`
- `WHITE_LOGO.png`
- `DARK_LOGO.png`
- `chronosoft-ticket-logo.png`
- `favicon.ico`
