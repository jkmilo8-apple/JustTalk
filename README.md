# JustTalk

[![MIT License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE)
[![Tauri](https://img.shields.io/badge/Tauri-2.x-7C3AED?logo=tauri)](https://tauri.app)
[![Rust](https://img.shields.io/badge/Rust-1.80+-black?logo=rust)](https://rustup.rs)

**Dicta tus prompts, programa con IA.**

JustTalk es una app de voz a texto gratuita, open source y 100% offline. Hecha por devs para devs. Presiona un atajo, habla, y tu texto aparece donde estas escribiendo — sin clouds, sin trackers, sin vueltas.

## Por que JustTalk?

Si programas con IA, sabes que escribir prompts largos es un cuello de botella. JustTalk lo resuelve:

- **Dicta en espanol, ingles, o lo que quieras** — Entiende 90+ idiomas con code-switching real. Decis "dame un useEffect que llame a la API" y lo captura perfecto.
- **Zero latencia** — Procesamiento local con Whisper + Parakeet. Tu voz se convierte en texto en milisegundos, sin internet.
- **100% privado** — Tu voz nunca sale de tu maquina. Sin servidores. Sin telemetria forzada. Sin que una empresa gringa escuche lo que decis.
- **Open source de verdad** — MIT license. Forkealo, extendelo, hacelo tuyo. Hecho para la comunidad.
- **Post-procesamiento con IA** — Conecta tu API key de OpenAI, Claude o Gemini y JustTalk te formatea y mejora automaticamente lo que dictas.

JustTalk no es "otra app de dictado". Es tu copiloto de voz para el flow del vibe coder.

## Como funciona

1. **Presiona** Ctrl+Space (configurable) para empezar a grabar
2. **Habla** tu prompt, comando, o lo que necesites
3. **Solta** y JustTalk procesa tu voz con Whisper
4. **Listo** — el texto aparece donde estabas escribiendo

Todo 100% local:

- El silencio se filtra con VAD (Voice Activity Detection) usando Silero
- La transcripcion usa los modelos que elijas:
  - **Whisper** (Small/Medium/Turbo/Large) con aceleracion GPU donde este disponible
  - **Parakeet V3** — Optimizado para CPU, ~5x velocidad real, deteccion automatica de idioma
- Funciona en Windows, macOS y Linux

## Arranque rapido

### Instalacion

```bash
# Clona el repo
git clone https://github.com/justtalk-app/JustTalk.git
cd JustTalk

# Instala dependencias (necesitas Bun)
bun install

# Corre en dev
bun run tauri dev

# Build para produccion
bun run tauri build
```

### Requisitos

- [Rust](https://rustup.rs/) (latest stable)
- [Bun](https://bun.sh/) package manager
- [Modelo Silero VAD](https://blob.handy.computer/silero_vad_v4.onnx) en `src-tauri/resources/models/`

Para instrucciones detalladas por plataforma, mira [BUILD.md](BUILD.md).

### Descarga el modelo VAD

```bash
mkdir -p src-tauri/resources/models
curl -o src-tauri/resources/models/silero_vad_v4.onnx https://blob.handy.computer/silero_vad_v4.onnx
```

## Arquitectura

JustTalk esta construido como una app Tauri 2.x:

- **Frontend:** React + TypeScript + Tailwind CSS
- **Backend:** Rust para integracion con el sistema, audio y ML
- **Core libs:**
  - `transcribe-cpp` — Reconocimiento de voz local con modelos Whisper (GGML/GGUF)
  - `transcribe-rs` — Reconocimiento CPU-optimizado con Parakeet via ONNX
  - `cpal` — Audio I/O cross-platform
  - `vad-rs` — Voice Activity Detection
  - `rdev` — Shortcuts globales de teclado
  - `rubato` — Resampling de audio

## Parametros CLI

```bash
justtalk --toggle-transcription    # Toggle grabacion on/off
justtalk --toggle-post-process     # Toggle grabacion con post-procesamiento
justtalk --cancel                  # Cancela la operacion actual
justtalk --start-hidden            # Inicia sin mostrar la ventana
justtalk --no-tray                 # Inicia sin icono en la bandeja
justtalk --debug                   # Modo debug con logging verbose
```

## Plataformas soportadas

- **macOS** (Apple Silicon + Intel)
- **Windows** (x64, Windows 10/11)
- **Linux** (x64, Ubuntu 22.04+)

## Comandos de desarrollo

```bash
bun install          # Instalar dependencias
bun run tauri dev    # Modo desarrollo
bun run tauri build  # Build produccion
bun run dev          # Solo frontend (Vite)
bun run lint         # ESLint
bun run lint:fix     # ESLint con auto-fix
bun run format       # Prettier + cargo fmt
bun run format:check # Verificar formato sin cambios
```

## Roadmap

- [ ] Instaladores oficiales para Windows (.exe), macOS (.dmg) y Linux (.AppImage)
- [ ] Pagina web en [justtalk.app](https://justtalk.app)
- [ ] Soporte para shortcuts con la tecla Globe en macOS
- [ ] Analytics opt-in con enfoque privacy-first
- [ ] Refactor del sistema de settings
- [ ] Integracion con Raycast
- [ ] Comunidad en Discord para devs de LATAM

## Como contribuir

1. Mira los [issues abiertos](https://github.com/justtalk-app/JustTalk/issues)
2. Forkea el repo y crea un feature branch
3. Testea bien en tu plataforma
4. Mandate un PR con una descripcion clara
5. Sumate a la comunidad

Para guias detalladas, mira [CONTRIBUTING.md](CONTRIBUTING.md).

## Solucion de problemas

### El modelo Whisper crashea

- Ocurre en algunas configuraciones de Windows y Linux
- No afecta a todos los sistemas
- Si sos dev y te pasa, manda logs para ayudar a debuggear

### Linux: Wayland

- Soporte limitado para Wayland
- Necesitas `wtype` o `dotool` para que el texto se pegue correctamente

### Linux: gtk-layer-shell

Si ves `error while loading shared libraries: libgtk-layer-shell.so.0`:

```bash
# Ubuntu/Debian
sudo apt install libgtk-layer-shell0

# Fedora
sudo dnf install gtk-layer-shell

# Arch
sudo pacman -S gtk-layer-shell
```

Para mas detalles, mira [BUILD.md](BUILD.md).

## Licencia

MIT License — mira [LICENSE](LICENSE).

JustTalk es software open source. El nombre, logo, icono y assets de marca de JustTalk no son open source. Forks, rewrites y redistribuciones no oficiales deben usar su propio branding.

## Agradecimientos

- **Whisper** by OpenAI — El modelo de reconocimiento de voz
- **ggml / transcribe.cpp** — Inferencia cross-platform con aceleracion GPU
- **Silero** — VAD liviano y eficiente
- **Tauri** — El framework Rust que hace esto posible
- **Handy** by [@cjpais](https://github.com/cjpais) — El proyecto original del que JustTalk es fork
- **La comunidad dev de LATAM** — Ustedes son el motivo por el que esto existe

---

Hecho con <span style="color: #00E5A0;">♥</span> en Latinoamerica.
