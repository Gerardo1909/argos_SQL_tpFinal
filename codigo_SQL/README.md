# Código SQL utilizado en el proyecto

En esta sección se encuentra **todo el código SQL que se escribió para este proyecto**, desde el DDL para la generación de las tablas y definición de funcionalidades dentro de la base de datos, hasta consultas para probar dichas funcionalidades y proyectar la estructura interna de las tablas.

Cabe aclarar que el entorno donde vive la base de datos de este proyecto es [**Supabase**](https://supabase.com/) y que por lo tanto el 
motor SQL detrás de todo el proyecto es **PostgreSQL**. La decisión de usar esta plataforma viene dada por ser una herramienta ubicada en 
**la nube** que permite la manipulación de proyectos por grupos de trabajo, facilitando así la colaboración y manteniendo una consistencia 
respecto a las operaciones realizadas sobre la base de datos.

## Contenidos

* **DDL**
   - [Generación de la base de datos](creacion_BD.sql)
* **Operaciones sobre una tabla**
    - [Creación](creacion_tabla.sql)
    - [Eliminación](eliminacion_tabla.sql)
    - [Inserción](insercion_tabla.sql)
    - [Actualización](actualizacion_tabla.sql)
    - [Indices](indice_tabla.sql)
    - [Búsqueda de una clave](busqueda1clave_tabla.sql)
    - [Búsqueda de dos claves](busqueda2claves_tabla.sql)
* **Operaciones sobre tres tablas relacionadas linealmente**
    - [A partir de un dato contenido en A conseguir uno de C](dato_A_C.sql)
    - [A partir de un dato contenido en C conseguir uno de B](dato_C_B.sql)
    - [A partir de un dato contenido en C conseguir uno de A](dato_C_A.sql)
* **Funcionalidades de la base de datos**
    - [Función 1](funcion1.sql)
    - [Función 2](funcion2.sql)
    - [Trigger](trigger.sql)