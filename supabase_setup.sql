-- =========================================================
-- 1) Crear la tabla de instituciones
-- =========================================================
create table if not exists public.instituciones (
  id uuid primary key default gen_random_uuid(),
  nombre text not null,
  tipo text,
  descripcion text,
  programas jsonb default '[]'::jsonb,
  keywords text[] default '{}',
  link text,
  lat double precision,
  lng double precision,
  created_at timestamptz default now()
);

-- =========================================================
-- 2) Activar seguridad a nivel de fila (RLS)
-- =========================================================
alter table public.instituciones enable row level security;

-- Cualquiera puede LEER (así el sitio público muestra las instituciones)
create policy "Lectura pública"
  on public.instituciones
  for select
  using (true);

-- Solo usuarios autenticados (vos, logueado) pueden INSERTAR
create policy "Insertar solo admin logueado"
  on public.instituciones
  for insert
  to authenticated
  with check (true);

-- Solo usuarios autenticados pueden ACTUALIZAR
create policy "Editar solo admin logueado"
  on public.instituciones
  for update
  to authenticated
  using (true)
  with check (true);

-- Solo usuarios autenticados pueden BORRAR
create policy "Eliminar solo admin logueado"
  on public.instituciones
  for delete
  to authenticated
  using (true);

-- =========================================================
-- 3) Cargar las 3 instituciones que ya tenías (datos de ejemplo)
--    Si ya las cargaste a mano en la app, podés omitir este paso.
-- =========================================================
insert into public.instituciones (nombre, tipo, descripcion, programas, keywords, link, lat, lng)
values
(
  'Escuela de Educación Técnica N°1',
  'Escuela técnica',
  'Formación técnica de nivel secundario con orientación en construcciones y electromecánica.',
  '[
    {"nombre":"Diseño de espacios y construcciones","link":"https://www.google.com/search?q=Escuela+de+Educacion+Tecnica+Rio+Cuarto+diseno+de+espacios"},
    {"nombre":"Electricidad domiciliaria e industrial","link":"https://www.google.com/search?q=Escuela+de+Educacion+Tecnica+Rio+Cuarto+electricidad"},
    {"nombre":"Electromecánica","link":"https://www.google.com/search?q=Escuela+de+Educacion+Tecnica+Rio+Cuarto+electromecanica"}
  ]'::jsonb,
  array['diseño de espacio','electricidad','construcción','electromecánica'],
  'https://www.google.com/search?q=Escuela+de+Educacion+Tecnica+Rio+Cuarto',
  -33.1198, -64.3487
),
(
  'Instituto Terciario de Enfermería',
  'Terciario',
  'Carrera de enfermería profesional con prácticas en hospitales de la zona.',
  '[
    {"nombre":"Enfermería profesional","link":"https://www.google.com/search?q=Instituto+Terciario+Enfermeria+Rio+Cuarto+enfermeria+profesional"},
    {"nombre":"Primeros auxilios","link":""},
    {"nombre":"Cuidados intensivos","link":""}
  ]'::jsonb,
  array['enfermería','salud','primeros auxilios'],
  'https://www.google.com/search?q=Instituto+Terciario+Enfermeria+Rio+Cuarto',
  -33.1276, -64.3521
),
(
  'Universidad Nacional de Río Cuarto',
  'Universidad',
  'Universidad pública con múltiples facultades y carreras de grado y posgrado.',
  '[
    {"nombre":"Ingeniería","link":"https://www.unrc.edu.ar"},
    {"nombre":"Ciencias económicas","link":"https://www.unrc.edu.ar"},
    {"nombre":"Agronomía","link":"https://www.unrc.edu.ar"},
    {"nombre":"Arte y diseño","link":"https://www.unrc.edu.ar"}
  ]'::jsonb,
  array['ingeniería','diseño','arte','agronomía','economía'],
  'https://www.unrc.edu.ar',
  -33.1355, -64.2942
)
on conflict do nothing;
