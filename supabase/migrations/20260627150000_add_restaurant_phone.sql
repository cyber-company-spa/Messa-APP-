-- Canal de reservas del restaurante y telefono de contacto asociado.
--   reservation_channel: 'none' (sin reservas) | 'whatsapp'. Extensible a mas
--                        canales de contacto mas adelante.
--   phone:               numero (E.164) usado cuando el canal es 'whatsapp'.
-- La policy "Admin can update own restaurant" ya cubre estas columnas nuevas,
-- no hace falta tocar RLS.

ALTER TABLE "public"."restaurants"
  ADD COLUMN IF NOT EXISTS "phone" "text",
  ADD COLUMN IF NOT EXISTS "reservation_channel" "text" NOT NULL DEFAULT 'none';
