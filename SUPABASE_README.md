# Conectar la app a Supabase — pasos finales

Ya dejé el código de la app (`index.html`) conectado a tu proyecto de Supabase.
Para terminar de activarlo, hacé esto en orden:

## 1. Crear la tabla y los permisos

1. Andá a tu proyecto en supabase.com → **SQL Editor** → **New query**.
2. Abrí el archivo `supabase_setup.sql` (está en esta misma carpeta), copiá
   todo su contenido y pegalo ahí.
3. Hacé clic en **Run**.
   - Esto crea la tabla `instituciones`.
   - Activa seguridad (RLS): cualquiera puede **leer**, pero solo un usuario
     logueado puede **agregar/editar/eliminar**.
   - Carga las 3 instituciones que ya tenías como ejemplo (si ya las habías
     tipeado a mano en la app antes, vas a tener duplicados — podés borrar
     los que sobren desde el modo edición).

## 2. Crear tu usuario de administrador

1. En Supabase, andá a **Authentication → Users**.
2. Hacé clic en **Add user** → **Create new user**.
3. Cargá tu email y una contraseña segura.
4. Importante: si aparece la opción **"Auto Confirm User"**, activala (así no
   necesitás verificar el email para poder loguearte).
5. Guardá.

Ese email + contraseña son los que vas a usar en la app para entrar al modo
edición (ya no existe más el "código" de antes).

## 3. Subir los archivos actualizados

Reemplazá en tu repo de GitHub estos archivos por los que te pasé:
- `index.html`
- `sw.js`

Y subí los cambios:
```bash
git add .
git commit -m "Conectar a Supabase, ya no usa localStorage"
git push
```

Esperá 1-2 minutos a que GitHub Pages actualice.

## 4. Probar

1. Abrí el sitio (si ya lo tenías instalado como app, primero desinstalala y
   volvé a instalarla, o limpiá el caché del sitio como hicimos la vez
   pasada — el service worker cambió de versión y se va a actualizar solo,
   pero por las dudas).
2. Tocá el ícono de admin (⚙) → ingresá con tu email y contraseña.
3. Deberías ver el banner de modo edición y el botón "+ Agregar institución".
4. Probá crear o editar una institución, y confirmá en Supabase
   (**Table Editor → instituciones**) que el dato quedó guardado ahí.
5. Abrí el sitio desde otro dispositivo (o en incógnito): las instituciones
   deberían verse igual, sin necesidad de loguearte — porque ahora los datos
   viven en la nube, no en el navegador de cada uno.

## Notas de seguridad

- La `anon key` que quedó en el código es pública a propósito — Supabase está
  diseñado para que esa key viva en el frontend. Lo que protege tus datos es
  la política de RLS: escritura solo para usuarios autenticados.
- Nunca compartas la `service_role key` (esa sí es secreta) ni la pongas en
  este archivo.
- Si en algún momento querés que más de una persona pueda editar, simplemente
  creás otro usuario en Authentication → Users con su propio email.
