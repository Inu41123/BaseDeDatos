# 📋 Documento de Requerimientos del Sistema

<div style="background-color:rgb(0, 0, 0); border-left: 4px solid #3498db; padding: 12px; margin: 16px 0; border-radius: 0 8px 8px 0;">

## 🔧 Funcionalidades Clave

### 📦 Gestión de Inventario
- **Alta, baja y actualización** de productos y stock (`PRODUCTO`, `INSUMO`)
- Control de entradas/salidas mediante `MOVIMIENTO`
- Control de **stock mínimo** (implícito en lógica de negocio)

### 💰 Registro de Ventas y Facturación
- Registro de `VENTA`, `DETALLEVENTA`, totales y fechas
- Asociación automática de `PROMOCION` vigentes
- Generación de **totales y subtotales** para facturación
- Facturación electrónica (opcional)

### 👥 Gestión de Clientes
- Registro completo de `CLIENTE` con datos de contacto
- Historial integrado de: ventas, quejas y entregas

### 📊 Generación de Reportes
- **Inventario**: stock actual, movimientos, productos críticos
- **Ventas**: por rango de fechas, cliente o producto
- **Compras**: órdenes a proveedores y recepciones
- **Mantenimiento**: histórico de equipos

### 🛒 Compras y Proveedores
- Generación de `ORDEN_COMPRA` y seguimiento
- Recepción registrada en `DETALLECOMPRA`
- Asociación con `PROVEEDOR` correspondiente

### 🏭 Producción
- Registro de lotes (`PRODUCCION`) con supervisión
- Descuento automático de insumos (`AFECTA`)

### 🚚 Gestión de Entregas
- Asignación de `RUTA` y `REPARTIDOR`
- Control de entregas pendientes/completadas

### 🔧 Mantenimiento
- Registro de `MANTENIMIENTO` en `EQUIPO`
- Asociación con `EMPLEADO` responsable

### 🗣️ Gestión de Quejas
- Registro de `QUEJA` con seguimiento
- Vinculación con producción/distribución
</div>

---

<div style="background-color:rgb(0, 0, 0); border-left: 4px solid #2e8b57; padding: 12px; margin: 16px 0; border-radius: 0 8px 8px 0;">

## ✅ Requerimientos Funcionales (RF)

### RF1. Clientes
- **RF1.1** Registrar, modificar y eliminar clientes  
- **RF1.2** Consultar historial completo por cliente  

### RF2. Inventario
- **RF2.1** Registrar productos/insumos con todos sus atributos  
- **RF2.2** Controlar stock actual y movimientos históricos  

### RF3. Ventas
- **RF3.1** Registrar ventas con todos los detalles requeridos  
- **RF3.2** Asociar promociones vigentes automáticamente  
- **RF3.3** Calcular totales, subtotales e impuestos  

### RF4. Compras
- **RF4.1** Generar órdenes de compa completas (`ORDEN_COMPRA`)  
- **RF4.2** Registrar recepción física de insumos (`DETALLECOMPRA`)  

### RF5. Producción
- **RF5.1** Registrar lotes de producción (`PRODUCCION`)  
- **RF5.2** Automatizar descuento de insumos utilizados (`AFECTA`)  

### RF6. Promociones
- **RF6.1** Gestionar promociones con fechas de vigencia  
- **RF6.2** Aplicar descuentos automáticos cuando corresponda  

### RF7. Entregas
- **RF7.1** Registrar rutas y repartidores disponibles  
- **RF7.2** Asignar entregas y actualizar su estado  

### RF8. Mantenimiento
- **RF8.1** Registrar mantenimientos preventivos/correctivos  
- **RF8.2** Asociar a equipos y empleados responsables  

### RF9. Quejas
- **RF9.1** Registrar quejas con descripción y gravedad  
- **RF9.2** Vincular con procesos relacionados  

### RF10. Reportes
- **RF10.1** Generar reportes personalizables (ventas/inventario)  
- **RF10.2** Exportar a PDF/CSV para análisis externo

</div>

---

<div style="background-color:rgb(0, 0, 0); border-left: 4px solid #f39c12; padding: 12px; margin: 16px 0; border-radius: 0 8px 8px 0;">

## ⚙️ Requerimientos Técnicos (RT)

### RT1. Tecnologías
- **RT1.1** MySQL como gestor de base de datos principal  
- **RT1.2** Arquitectura preparada para integración web/móvil  

### RT2. Seguridad
- **RT2.1** Sistema multiusuario con roles:  
  - Administrador  
  - Ventas  
  - Almacén  
  - Repartidor  
- **RT2.2** Autenticación segura con cifrado  

### RT3. Integración
- **RT3.1** Capacidad para integración con pasarelas de pago  
- **RT3.2** API RESTful bien documentada  

### RT4. Rendimiento
- **RT4.1** Optimizado para consultas masivas (100k+ registros)  
- **RT4.2** Mecanismos de backup y recuperación ante fallos  

</div>

---

<div style="background-color:rgb(0, 0, 0); border-left: 4px solid #9b59b6; padding: 12px; margin: 16px 0; border-radius: 0 8px 8px 0;">

## 🛡️ Requerimientos No Funcionales (RNF)

### RNF1. Usabilidad
- **RNF1.1** Interfaz intuitiva con flujos claros  
- **RNF1.2** Documentación completa para usuarios finales  

### RNF2. Fiabilidad
- **RNF2.1** Respaldos automáticos diarios verificables  
- **RNF2.2** Mecanismos de rollback para transacciones críticas  

### RNF3. Seguridad
- **RNF3.1** Protección de datos personales según normativa  
- **RNF3.2** Acceso restringido por roles y permisos  

### RNF4. Mantenibilidad
- **RNF4.1** Diseño modular con documentación técnica  
- **RNF4.2** Control de versiones para scripts y esquemas  

### RNF5. Legalidad
- **RNF5.1** Cumplimiento de LGPD/Regulaciones locales  
- **RNF5.2** Gestión explícita de consentimientos  

</div>

---

> ✨ **Notas Finales**  
> - Todas las entidades en `MAYÚSCULAS` representan tablas principales  
> - Los requisitos marcados como (opcional) son de baja prioridad 