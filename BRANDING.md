# JustTalk - Manual de Identidad Visual

## La Marca

**JustTalk** es una aplicacion de voz a texto hecha por y para devs de Latinoamerica. Nuestra mision es simple: que puedas dictar prompts, comandos y codigo en tu idioma nativo, sin friccion, sin internet, y con privacidad total.

### Posicionamiento

- **Para:** Vibe coders de LATAM que programan con IA en VS Code, Cursor, Claude Code, OpenCode y terminales
- **Que:** Una app de speech-to-text ultra rapida, 100% offline, que entiende espanol nativo
- **Por que:** Porque dictar prompts es 3x mas rapido que escribirlos, y ninguna app gringa entiende como hablamos nosotros
- **Diferencial:** Open source, zero latencia, procesamiento local, post-procesamiento con IA, disenada para el flow del dev latino

### Voz y Tono

- **Directo, sin vueltas.** Hablamos como habla un dev a otro dev. Nada de "soluciones innovadoras". Decimos "esto te ahorra tiempo".
- **En espanol neutro LATAM.** Entendible en Mexico, Argentina, Colombia, Chile, Peru, y toda la region. Sin regionalismos forzados.
- **Con actitud.** Somos la alternativa a las apps gringas. "Hecho en LATAM para LATAM" no es un slogan, es nuestra identidad.
- **Humilde pero seguro.** Sabemos lo que hacemos bien. Tambien sabemos que el open source se construye en comunidad.

### Tagline

> **Dicta tus prompts, programa con IA.**

Alt: *Tu voz, tu codigo, tu flow.*

---

## Identidad Visual

### Paleta de Colores

| Token | Hex | Uso |
|-------|-----|-----|
| `--jt-neon` | `#00E5A0` | Color primario. CTAs, acentos, interactivos |
| `--jt-neon-dim` | `#00B380` | Hover states, gradientes |
| `--jt-purple` | `#7C3AED` | Secundario. Gradientes, elementos destacados |
| `--jt-purple-glow` | `#A78BFA` | Glows, highlights sobre fondos oscuros |
| `--jt-dark` | `#0A0A0F` | Fondo principal. Deep black con un toque azul |
| `--jt-dark-card` | `#111118` | Fondos de cards, superficies elevadas |
| `--jt-dark-border` | `#1E1E2E` | Bordes, separadores |
| `--jt-muted` | `#8888A0` | Texto secundario, labels |
| `--jt-white` | `#F0F0F5` | Texto principal sobre fondos oscuros |
| `--jt-pink` | `#F9C5E8` | Acento decorativo (sparingly) |

### Gradientes

- **Primario:** `linear-gradient(135deg, #00E5A0, #7C3AED)` — CTAs y elementos hero
- **Sutil:** `linear-gradient(135deg, #00E5A0 0%, #00B380 100%)` — Botones y badges
- **Glow effect:** `radial-gradient(ellipse, rgba(0,229,160,0.15), transparent)` — Efectos de fondo

### Tipografia

- **Display / Headlines:** Inter (sans-serif) — Bold, Extrabold. Tracking: -0.02em
- **UI / Body:** Inter (sans-serif) — Regular, Medium, Semibold
- **Code:** JetBrains Mono, Fira Code, o la fuente mono del sistema. Para terminal, comandos, y snippets.
- **Fallback:** system-ui, -apple-system, sans-serif

### Logo

El logo de JustTalk es un monograma "JT" en una capsula redondeada con gradiente neon→purple, acompanado del wordmark "JustTalk" donde "Talk" va en el gradiente.

**Variantes:**
- **Logo completo:** Icono JT + "JustTalk" + tagline
- **Icono solo:** Monograma JT en capsula (para favicon, tray icon, etc.)
- **Wordmark:** "JustTalk" sin icono (para espacios angostos)

**Area de respeto:** 25% del tamano del logo en todos los lados.

### Iconografia

- **Lucide React** para iconos de UI (Settings, History, etc.)
- Estilo: outline (stroke-width: 2), colores segun contexto
- Iconos de feature: fondo con opacidad 10% del color, icono en color solido

---

## Aplicacion

### Desktop App (Tauri)

La UI de la aplicacion es un panel de settings accesible desde la bandeja del sistema. El overlay de grabacion es minimalista — un pill que aparece cuando grabas.

**Componentes clave:**
- **Sidebar:** Logo arriba, navegacion con iconos de Lucide, fondo `--jt-dark-card`
- **Settings panels:** Cards agrupadas con `SettingContainer`, `SettingsGroup`
- **Overlay de grabacion:** Minimal pill con animacion de audio, color neon
- **Onboarding:** Flow de 2 pasos (permisos → modelo), con logo grande y CTAs claros

### Landing Page

La landing page (`landing/index.html`) es una pagina estatica desplegable en cualquier host. Usa Tailwind CDN para ser completamente autonoma.

**Secciones:**
1. **Hero:** Headline en 3 lineas + terminal preview animada + CTAs
2. **Features:** Grid de 6 cards con iconos y descripciones en espanol
3. **How it works:** 4 pasos visuales (Presiona → Dicta → Procesa → Escribe)
4. **Social proof:** Testimonios de devs latinos (placeholder, reemplazar con reales)
5. **Download:** Badges de plataforma + instrucciones de build
6. **Footer:** Links minimalistas

---

## Recursos

### Archivos de diseno (a crear)

- `src-tauri/icons/` — Iconos de la app en todos los tamanos requeridos por Tauri
- `landing/` — Landing page estatica
- `src/components/icons/JustTalkTextLogo.tsx` — Logo en SVG para la app

### Assets necesarios para produccion

- [ ] Favicon (32x32, 180x180)
- [ ] OG Image (1200x630) para redes sociales
- [ ] App icons para macOS (.icns), Windows (.ico), Linux (.png)
- [ ] Screenshots de la app en uso (para landing page y GitHub)
- [ ] Video demo de 30s mostrando el flow completo

---

## Inspiracion y Referencias

La identidad visual de JustTalk toma inspiracion de:

- **Terminales modernas** (Warp, Ghostty, kitty) — Estetica oscura, tipografia mono, colores neon
- **VSCode themes** (SynthWave '84, One Dark Pro) — Gradientes, glows, contraste alto
- **Cultura tech latina** — Directa, accesible, sin pretensiones, con orgullo de lo nuestro
- **Arc Browser** — Bordes redondeados, blur effects, minimalismo funcional

---

## Notas para contribuidores

Si vas a crear assets o modificar la UI:

1. Mantene la paleta de colores. No inventes nuevos colores sin consultar.
2. El texto siempre en espanol neutro LATAM. Usa "vos" o "tu" segun el contexto.
3. Las animaciones deben ser sutiles. Nada que distraiga del uso principal.
4. Todo el copy de la landing page debe estar en `landing/index.html` (self-contained).
5. Los textos de la app van en `src/i18n/locales/es/translation.json`.
