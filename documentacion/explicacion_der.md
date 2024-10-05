# Explicación del DER: Sistema de Base de Datos para **Argos**

El [**Diagrama Entidad-Relación (DER)**](DER_Argos.pdf) modela el sistema de base de datos de **Argos**, ilustrando las relaciones entre todas las entidades. Para facilitar su comprensión, hemos dividido este **DER** en **diferentes regiones**, cada una representando un **componente crítico del sistema**. Estas regiones no operan de manera aislada, sino que están interconectadas, trabajando en conjunto para lograr el funcionamiento completo y coherente de la base de datos.

## Región de Satélites

En el centro del DER se encuentra la entidad **`satelite`**, que es la pieza fundamental del sistema. Cada satélite está descrito por atributos propios, y está vinculado a tres entidades categóricas:

- **`fabricante_satelite`**: Describe quién construyó el satélite.
- **`tipo_satelite`**: Indica el tipo de satélite (comunicaciones, meteorológico, observación terrestre, científico).
- **`estado_satelite`**: Registra el estado actual del satélite (activo, inactivo, en mantenimiento).

Estas relaciones son de **muchos a uno (N:1)**, ya que varios satélites pueden compartir el mismo fabricante, tipo o estado.

## Región de Órbitas

La entidad **`historial_orbita`** registra la órbita en la que se encuentra cada satélite. Esta tabla permite una relación **uno a muchos (1:N)** entre los satélites y las órbitas, lo que significa que un satélite puede tener varias órbitas registradas a lo largo del tiempo. Esto es útil para modelar cambios de órbita, como en el caso de **satélites de observación** terrestre que pueden ajustar su órbita durante su misión.

- **Relación con `tipo_orbita`**: Cada órbita está clasificada por su tipo, que puede ser LEO, MEO, GEO, o HEO. Esta relación también es de **muchos a uno (N:1)**.

## Región de Observaciones

Cada satélite realiza **observaciones**, que se registran en la tabla **`observacion`**. La relación entre `satelite` y `observacion` es de **uno a muchos (1:N)**, ya que un satélite puede realizar múltiples observaciones a lo largo del tiempo.

- Cada observación contiene datos como la `latitud`, `longitud` y el `timestamp_observacion`.
- Las observaciones están vinculadas a la tabla **`imagen`**, donde se almacenan las imágenes capturadas por los satélites. La relación entre `observacion` e `imagen` es de **uno a uno (1:1)**, ya que 
  decidimos que cada imagen se asocie de forma única a una observación específica. La razón por la cual estas tablas están separadas es porque consideramos que una **observación** puede considerarse
  como algo abstracto en el contexto de los satélites y que una **imagen** hace alusión a algo más específico, siendo que **una imagen es una observación**. Este enfoque permite la extensibilidad del modelo
  permitiendo que a futuro se pueda incorporar una nueva tabla que modele otro tipo de observación.
 
## Región de Misiones

Los satélites también participan en **misiones**, representadas por la entidad **`mision`**. La relación entre `satelite` y `mision` es gestionada por la tabla asociativa **`mision_satelite`**, que permite una relación **muchos a muchos (N:M)**. Esto refleja que un satélite puede participar en múltiples misiones, y una misión puede involucrar varios satélites.

- Cada misión está descrita por atributos como `nombre_mision`, `fecha_inicio`, `fecha_fin` y su `objetivo`.

## Región de Estaciones Terrestres

La entidad **`estacion_terrestre`** representa las estaciones que reciben los datos de los satélites. Cada estación está vinculada a las siguientes entidades categóricas:

- **`ubicacion_estacion`**: Describe la ubicación geográfica de la estación.
- **`proposito_estacion`**: Indica el propósito o tipo de satélites que controla la estación (por ejemplo, estaciones de comunicación o de observación terrestre).
- **`estado_operacion`**: Registra el estado operativo de la estación (operativa, en mantenimiento).

La relación entre `estacion_terrestre` y `satelite` es gestionada por la tabla asociativa **`estacion_satelite`**, que permite una relación **muchos a muchos (N:M)**. Esto significa que una estación puede estar vinculada a múltiples satélites, y a su vez, un satélite puede estar conectado a varias estaciones para la recepción de datos.
