Decisiones que he tomado al hacer el examen:
-El enunciado del examen no me ha dejado claro si un cust puede tener asociado más de un newspaper (Deja claro que un newspaper tiene más de un cust, pero no si un cust puede tener varios). 
Le he visto el sentido que solo pueda tener uno asociado porque si se pudieran asociar a varios la descripcion y el titulo perdería el sentido. De la forma que lo he implementado puedes guardarlo en modo
draft con o sin newspaper asociado, pero para guardarlo en modo final te obliga a asociarle un newspaper.
-El tema de los colores tampoco me ha quedado claro, porque tal y como está en el enunciado se interpreta que todo el cust debería aparecer coloreado, pero con los colores que te dan (en especial el negro) no
se veía nada al hacer display. Es por esto que he optado a "colorear" tan solo la columna donde aparece los gauges.
-Por último para el título y las descripciones de los custs, además de los tamaños máximos citados en el enunciado (100 y 250 respectivamente) he puesto la restricción de que como mínimo tengan que ser 4 caracteres.
-Con respecto al item 5, hay 2 scripts de creación, create-acme-newspaper.sql que contiene el populate y create-acme-newspaper-purgued.sql que está "purgado" y contiene lo mínimo para lanzar el proyecto