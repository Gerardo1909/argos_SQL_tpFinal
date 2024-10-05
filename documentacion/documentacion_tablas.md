# Documentación de las tablas de la base de datos para **Argos**

A partir del escenario propuesto para **Argos**, el siguiente paso es desarrollar una base de datos que **satisfaga sus necesidades**. Un componente fundamental para alcanzar este objetivo es documentar detalladamente todas las tablas que compondrán la base de datos, describiendo claramente el propósito de cada una. Esta documentación no solo facilitará la comprensión de la presencia y función de cada tabla en el **DER** (Diagrama Entidad-Relación), sino que también garantizará que sigamos buenas prácticas durante la implementación de la base de datos.

Para estructurar esta documentación, hemos decidido clasificar las tablas en grupos según el rol que desempeñan dentro de la base de datos. Estos grupos se dividen en: **entidades principales, entidades categóricas y entidades asociativas**.

## Dominio de los Datos para las entidades principales

Las **entidades principales** representan los objetos centrales del sistema y son aquellas tablas que contienen la **información más relevante y completa** sobre los elementos clave del modelo. Estas tablas forman la base sobre la cual se estructuran las relaciones en la base de datos y permiten almacenar datos específicos relacionados con satélites, observaciones, imágenes, misiones y estaciones terrestres. Cada entidad está diseñada para capturar la mayor cantidad de detalles significativos dentro del contexto académico en el que nos encontramos, sin perder de vista la representación de un escenario realista.

1. **Tabla: `satelite`**
   - **Dominio:** Esta tabla almacena la información esencial de cada satélite operado por la organización **Argos**. Entre los campos que posee se encuentran:
     - `id_satelite` (**PK, SERIAL**): Identificador único para cada satélite.
     - `nombre_satelite` (**VARCHAR(100)**): Nombre que identifica al satélite.
     - `fecha_lanzamiento` (**DATE**): Fecha en la que el satélite fue lanzado.
     - `id_fabricante` (**FK, INTEGER**): Clave foránea que referencia a la tabla de fabricantes.
     - `id_tipo_satelite` (**FK, INTEGER**): Clave foránea que indica el tipo de satélite (por ejemplo, comunicaciones, meteorológico).
     - `id_estado` (**FK, INTEGER**): Clave foránea que representa el estado actual del satélite (activo, inactivo, en mantenimiento).

2. **Tabla: `historial_orbita`**
   - **Dominio:** Esta tabla contiene los detalles sobre las órbitas que siguen los satélites, además se encarga de registrar cambios de posición que puedan 
       surgir en los mismos. Entre los campos que posee se encuentran:
     - `id_orbita` (**PK, SERIAL**): Identificador único para cada órbita.
     - `id_satelite` (**FK, INTEGER**): Clave foránea que conecta la órbita con un satélite específico.
     - `id_tipo_orbita` (**FK, INTEGER**): Clave foránea que identifica el tipo de órbita (LEO, MEO, GEO, HEO).
     - `altitud` (**INTEGER**): Altitud promedio de la órbita en kilómetros.
     - `inclinacion` (**DECIMAL**): Inclinación de la órbita con respecto al ecuador, medida en grados.

3. **Tabla: `imagen`**
   - **Dominio:** Almacena la información de las imágenes capturadas por los satélites en sus observaciones. Entre los campos que posee se encuentran:
     - `id_imagen` (**PK, SERIAL**): Identificador único para cada imagen.
     - `id_observacion` (**FK, INTEGER**): Clave foránea que conecta la imagen con una observación específica.
     - `url_imagen` (**VARCHAR(255)**): URL donde se almacena la imagen.
     - `resolucion` (**VARCHAR(50)**): Resolución de la imagen capturada (por ejemplo, 1080p, 4K).

4. **Tabla: `observacion`**
   - **Dominio:** Registra cada observación realizada por los instrumentos a bordo de los satélites. Entre los campos que posee se encuentran:
     - `id_observacion` (**PK, SERIAL**): Identificador único para cada observación.
     - `id_satelite` (**FK, INTEGER**): Clave foránea que conecta la observación con el satélite que la realizó.
     - `timestamp_observacion` (**TIMESTAMP**): Fecha y hora en que se realizó la observación.
     - `latitud` (**DECIMAL**): Latitud geográfica del punto observado.
     - `longitud` (**DECIMAL**): Longitud geográfica del punto observado.

5. **Tabla: `mision`**
   - **Dominio:** Contiene los detalles de las misiones asignadas a los satélites. Entre los campos que posee se encuentran:
     - `id_mision` (**PK, SERIAL**): Identificador único para cada misión.
     - `nombre_mision` (**VARCHAR(100)**): Nombre asignado a la misión.
     - `fecha_inicio` (**DATE**): Fecha de inicio de la misión.
     - `fecha_fin` (**DATE**): Fecha de finalización de la misión (si corresponde).
     - `objetivo` (**TEXT**): Descripción del objetivo de la misión.

6. **Tabla: `estacion_terrestre`**
   - **Dominio:** Almacena información sobre las estaciones terrestres que reciben los datos de los satélites. Entre los campos que posee se encuentran:
     - `id_estacion` (**PK, SERIAL**): Identificador único para cada estación terrestre.
     - `nombre_estacion` (**VARCHAR(100)**): Nombre de la estación.
     - `id_ubicacion_estacion` (**FK, INTEGER**): Clave foránea que conecta la estación con su ubicación geográfica.
     - `id_proposito_estacion` (**FK, INTEGER**): Clave foránea que describe el propósito de la estación (por ejemplo, recepción de datos de satélites de observación terrestre, comunicaciones).
     - `id_estado_operacional` (**FK, INTEGER**): Clave foránea que indica el estado operativo de la estación (operativa, en mantenimiento).


## Dominio de los Datos para las entidades asociativas

Las **entidades asociativas** son aquellas que sirven para establecer relaciones **muchos a muchos** entre las entidades principales de la base de datos. Estas tablas permiten vincular elementos como estaciones y satélites, o misiones y satélites, con el fin de modelar escenarios complejos. 

1. **Tabla: `estacion_satelite`**
   - **Dominio:** Esta tabla establece una relación **muchos a muchos** entre estaciones terrestres y satélites, permitiendo que una estación reciba datos de múltiples satélites, y que un 
       satélite pueda estar asociado con varias estaciones. Los campos clave son:
     - `id_estacion_satelite` (**PK, SERIAL**): Identificador único para la relación entre estación y satélite.
     - `id_estacion_terrestre` (**FK, INTEGER**): Clave foránea que conecta la relación con una estación terrestre.
     - `id_satelite` (**FK, INTEGER**): Clave foránea que conecta la relación con un satélite específico.

   Esta tabla refleja el hecho de que una estación terrestre puede controlar y recibir datos de varios satélites simultáneamente, mientras que un satélite puede enviar datos a diferentes 
   estaciones dependiendo de su cobertura y la misión en curso.

2. **Tabla: `mision_satelite`**
   - **Dominio:** Esta tabla representa la relación **muchos a muchos** entre misiones y satélites, permitiendo que un satélite participe en varias misiones, y que una misión pueda 
       involucrar múltiples satélites. Los campos clave son:
     - `id_mision_satelite` (**PK, SERIAL**): Identificador único para la relación entre misión y satélite.
     - `id_mision` (**FK, INTEGER**): Clave foránea que conecta la relación con una misión.
     - `id_satelite` (**FK, INTEGER**): Clave foránea que conecta la relación con un satélite.

   Este diseño permite modelar escenarios donde los satélites pueden ser reutilizados para diferentes misiones, optimizando su uso y cubriendo diversas áreas de investigación o comunicación.

## Dominio de los datos para las entidades categóricas:

Las **entidades categóricas** contienen información que organiza los datos de la base de datos en diferentes categorías. Estas tablas se crean con el objetivo de normalizar la base de datos, alcanzando la **Tercera Forma Normal (3FN)**. Esto permite que cada categoría esté almacenada de manera independiente y no dependa de otras entidades que podrían ser eliminadas, evitando así la pérdida de información relacionada.

Las categorías definidas en cada tabla fueron modeladas de la forma más representativa posible, adaptándolas al **contexto académico** en el que trabajamos. De este modo, logramos una representación que imita un escenario realista, pero con un enfoque limitado y simplificado en cuanto a la cantidad de categorías que se consideran.

1. **Tabla: `tipo_satelite`**
   - **Propósito:** Almacena los diferentes tipos de satélites operados por **Argos**. Estos tipos se utilizan para clasificar a los satélites en función de sus funciones y características principales.
   - **Campo clave:** `id_tipo_satelite` (**PK, SERIAL**)
   - **Campo categórico:** `tipo_satelite` (**VARCHAR(50)**)
   - **Valores:** 
     - *Comunicaciones*: Satélites utilizados para transmitir señales de comunicación.
     - *Meteorológico*: Satélites dedicados al monitoreo del clima y los fenómenos atmosféricos.
     - *Observación Terrestre*: Satélites que se utilizan para la captura de imágenes y datos geográficos.
     - *Científico*: Satélites destinados a la investigación científica en el espacio exterior o terrestre.

2. **Tabla: `estado_satelite`**
   - **Propósito:** Almacena los distintos estados en los que se puede encontrar un satélite en cualquier momento. Estos estados reflejan su condición operativa.
   - **Campo clave:** `id_estado_satelite` (**PK, SERIAL**)
   - **Campo categórico:** `estado_satelite` (**VARCHAR(50)**)
   - **Valores:** 
     - *Activo*: El satélite está en funcionamiento y cumpliendo su misión.
     - *Inactivo*: El satélite ya no está operativo, pero permanece en órbita.
     - *En mantenimiento*: El satélite se encuentra temporalmente fuera de servicio por mantenimiento o actualización.
     - *Retirado*: El satélite ha sido desorbitado o retirado permanentemente.

3. **Tabla: `tipo_orbita`**
   - **Propósito:** Define los diferentes tipos de órbita que siguen los satélites. Estas categorías ayudan a identificar las trayectorias específicas en las que operan los satélites.
   - **Campo clave:** `id_tipo_orbita` (**PK, SERIAL**)
   - **Campo categórico:** `tipo_orbita` (**VARCHAR(50)**)
   - **Valores:** 
     - *LEO (Low Earth Orbit)*: Órbita terrestre baja, utilizada principalmente para satélites de observación terrestre y algunos de comunicación.
     - *MEO (Medium Earth Orbit)*: Órbita media terrestre, comúnmente usada para satélites de navegación y comunicaciones.
     - *GEO (Geostationary Orbit)*: Órbita geoestacionaria, utilizada principalmente por satélites de comunicaciones.
     - *HEO (Highly Elliptical Orbit)*: Órbita altamente elíptica, utilizada para comunicaciones y monitoreo en latitudes extremas.

4. **Tabla: `proposito_estacion`**
   - **Propósito:** Indica el propósito o especialización de las estaciones terrestres, describiendo el tipo de satélites que controlan.
   - **Campo clave:** `id_proposito_estacion` (**PK, SERIAL**)
   - **Campo categórico:** `nombre_proposito` (**VARCHAR(100)**)
   - **Valores:** 
     - *Comunicación*: Estaciones diseñadas para recibir y gestionar datos de satélites de comunicación.
     - *Observación Terrestre*: Estaciones especializadas en la recepción de datos e imágenes de satélites de observación terrestre.
     - *Meteorología*: Estaciones enfocadas en el monitoreo y la recepción de datos meteorológicos.
     - *Investigación Científica*: Estaciones dedicadas a la gestión de satélites científicos y de investigación.

5. **Tabla: `estado_operacion`**
   - **Propósito:** Almacena los diferentes estados operativos de las estaciones terrestres, indicando su disponibilidad y funcionalidad.
   - **Campo clave:** `id_estado_operacion` (**PK, SERIAL**)
   - **Campo categórico:** `estado_operacion` (**VARCHAR(50)**)
   - **Valores:** 
     - *Operativa*: La estación está en pleno funcionamiento.
     - *No operativa*: La estación no está funcionando actualmente.
     - *En mantenimiento*: La estación está temporalmente fuera de servicio debido a mantenimiento.

6. **Tabla: `fabricante_satelite`**
   - **Propósito:** Almacena los diferentes fabricantes de los satélites utilizados por **Argos**. Dado nuestro contexto académico **decidimos** incluir 5 fabricantes posibles.
   - **Campo clave:** `id_fabricante_satelite` (**PK, SERIAL**)
   - **Campo categórico:** `nombre_fabricante` (**VARCHAR(100)**)
   - **Valores:** 
     - *AeroSpace Innovations*: Especializados en satélites de comunicaciones.
     - *StellarTech*: Fábrica dedicada a satélites de observación terrestre.
     - *Orbital Solutions*: Conocidos por satélites científicos.
     - *Cosmos Dynamics*: Centrados en la fabricación de satélites meteorológicos.
     - *Galactic Systems*: Fabricantes de satélites multiusos.

7. **Tabla: `ubicacion_estacion`**
   - **Propósito:** Almacena las distintas ubicaciones geográficas de las estaciones terrestres que forman parte de la red de **Argos**.
   - **Campo clave:** `id_ubicacion_estacion` (**PK, SERIAL**)
   - **Campo categórico:** `nombre_ubicacion` (**VARCHAR(100)**)
   - **Valores:** 
     - *Estación Norte*: Ubicada en una región ficticia del hemisferio norte.
     - *Estación Sur*: Situada en una región ficticia del hemisferio sur.
     - *Estación Central*: Ubicada en una región ecuatorial.
     - *Estación Este*: Situada en una región ficticia oriental.
     - *Estación Oeste*: Ubicada en una región ficticia occidental.
