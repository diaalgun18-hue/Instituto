# Educación Río Cuarto — App Web Instalable (PWA)

Esta carpeta ya está lista para subir a GitHub y funcionar como una app instalable
en PC y celulares (Android/iOS), sin pasar por ninguna tienda de aplicaciones.

## Archivos
- `index.html` — la app (ya con manifest, íconos y service worker conectados)
- `manifest.json` — metadatos de la app (nombre, colores, íconos)
- `sw.js` — service worker (permite que funcione offline / instalada)
- `icons/icon-192.png`, `icons/icon-512.png` — íconos de la app

## 1. Subir a GitHub

```bash
git init
git add .
git commit -m "Primera versión de la app"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/TU_REPO.git
git push -u origin main
```

## 2. Activar GitHub Pages

1. En tu repo de GitHub, andá a **Settings → Pages**.
2. En "Source", elegí la rama `main` y la carpeta `/ (root)`.
3. Guardá. En unos minutos tu app quedará online en:
   `https://TU_USUARIO.github.io/TU_REPO/`

⚠️ Importante: GitHub Pages sirve por **HTTPS**, lo cual es obligatorio para que
el service worker y la instalación como app funcionen. No uses `http://`.

## 3. Instalar la app

### En celular (Android, Chrome)
1. Abrí el link de tu GitHub Pages en Chrome.
2. Tocá el menú (⋮) → **"Instalar app"** o **"Agregar a pantalla de inicio"**.
3. Quedará como un ícono más, se abre en su propia ventana sin la barra del navegador.

### En iPhone (Safari)
1. Abrí el link en Safari (tiene que ser Safari, no Chrome).
2. Tocá el ícono de compartir (cuadrado con flecha hacia arriba).
3. Elegí **"Agregar a pantalla de inicio"**.

### En PC (Windows/Mac, Chrome o Edge)
1. Abrí el link en Chrome o Edge.
2. En la barra de direcciones aparece un ícono de instalar (⊕ o pantalla con flecha).
3. Hacé clic → **"Instalar"**. Queda como programa en el menú de inicio / escritorio.

## Notas
- Si cambiás `index.html`, subí de nuevo con `git push`; los usuarios que ya
  instalaron la app recibirán la actualización automáticamente la próxima vez
  que la abran (el service worker refresca el caché).
- Si querés otro nombre o ícono, editá `manifest.json` (campos `name`,
  `short_name`) y reemplazá los archivos en `icons/`.
