# Poniendo a prueba la Base de Datos

En esta sección se incluyen todos los scripts que desarrollamos **para evaluar el funcionamiento de esta base de datos**. Se parte desde operaciones simples sobre una sola tabla hasta consultas más complejas que involucran tres tablas relacionadas. Además, se muestra la definición de funcionalidades específicas para la base de datos y las pruebas realizadas sobre ellas.

Cabe aclarar que el entorno donde vive la base de datos de este proyecto es [**Supabase**](https://supabase.com/) y que por lo tanto el 
motor SQL detrás de todo el proyecto es **PostgreSQL**. La decisión de usar esta plataforma viene dada por ser una herramienta ubicada en 
**la nube** que permite la manipulación de proyectos por grupos de trabajo, facilitando así la colaboración y manteniendo una consistencia 
respecto a las operaciones realizadas sobre la base de datos.

## Contenidos

* **Operaciones sobre una tabla**
    - [Creación](operaciones_1_tabla/creacion_tabla.sql)
    - [Eliminación](operaciones_1_tabla/eliminacion_tabla.sql)
    - [Inserción](operaciones_1_tabla/insercion_tabla.sql)
    - [Actualización](operaciones_1_tabla/actualizacion_tabla.sql)
    - [Indices](operaciones_1_tabla/indice_tabla.sql)
    - [Búsqueda de una clave](operaciones_1_tabla/busqueda1clave_tabla.sql)
    - [Búsqueda de dos claves](operaciones_1_tabla/busqueda2claves_tabla.sql)
* **Operaciones sobre tres tablas relacionadas linealmente**
    - [Creación](operaciones_3_tablas/creacion_3tablas.sql)
    - [Eliminación](operaciones_3_tablas/eliminacion_3tablas.sql)
    - [Inserción](operaciones_3_tablas/insercion_3tablas.sql)
    - [Actualización](operaciones_3_tablas/actualizacion_3tablas.sql)
    - [Indices](operaciones_3_tablas/indice_3tablas.sql)
    - [Búsqueda de una clave](operaciones_3_tablas/busqueda1clave_3tablas.sql)
    - [Búsqueda de dos claves](operaciones_3_tablas/busqueda2claves_3tablas.sql)
* **Consultas sobre tres tablas relacionadas linealmente**
    - [A partir de un dato contenido en A conseguir uno de C](operaciones_3_tablas/dato_A_C.sql)
    - [A partir de un dato contenido en C conseguir uno de B](operaciones_3_tablas/dato_C_B.sql)
    - [A partir de un dato contenido en C conseguir uno de A](operaciones_3_tablas/dato_C_A.sql)
* **Funcionalidades de la base de datos**
    - [Función 1](funcionalidades/funcion1.sql)
    - [Función 2](funcionalidades/funcion2.sql)
    - [Trigger](funcionalidades/trigger.sql)




    