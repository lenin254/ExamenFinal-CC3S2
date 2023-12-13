# Examen Final
## Parte 1
1. **Produce un conflicto de fusión (merge) en algún repositorio de tus actividades realizadas. Establece los pasos y comandos que usas para resolver un conflicto de fusión en Git. Si intentas git push y falla con un mensaje como : Non-fast-forward (error): failed to push some refs esto significa que algún archivo contiene un conflicto de fusión entre la versión de tu repositorio y la versión del repositorio origen. Para este ejercicio debes presentar el conflicto dado, los pasos y comandos para resolver el problema y las solución.**
Para este caso voy a usar mi primer repositorio del curso (https://github.com/lenin254/DesarrolloDeSoftware.git) para hacer el conflicto de fusion.  
primero hacemos un git clone al repositorio con `git clone https://github.com/lenin254/DesarrolloDeSoftware.git` y nos vamos a la carpeta donde se descargo.  
![](/imagenes/1.png)
- Creamos y cambiamos a una nueva rama.
     ```bash
     git checkout -b rama
     ```
- Realizamos cambios en el mismo archivo.
     ```bash
     echo "Cambios en mi rama" >> archivo.txt
     git add archivo.txt
     git commit -m "Cambios en mi rama rama jaja"
    ```
![](/imagenes/2.png)
- Cambiamos de vuelta a la rama "main".
     ```bash
     git checkout main
     ```
- Realizamos cambios en el mismo archivo.
     ```bash
     echo "Cambios en main " >> archivo.txt
     git add archivo.txt
     git commit -m "Cambios en main "
     ```
![](/imagenes/3.png)
- Cambiamos de nuevo a nuestra rama y tratamos de fusionar los cambios de la rama "main".
     ```bash
     git checkout rama
     git merge main
     ```
- Aquí es donde Git debería detectar un conflicto.
![](/imagenes/4.png)
- Y si miramos el archivo txt podremos observar esto:
![](/imagenes/5.png)
- Editamos conservando el que queremo que se guarde
- Después de editar el archivo, marca el conflicto como resuelto.
     ```bash
     git add archivo.txt
     ```
- Completa la fusión con el siguiente comando:
     ```bash
     git merge 
     ```
![](/imagenes/6.png)

2. **Digamos que nos dan el modelo de User de la siguiente manera:**
``` ruby
class User < ActiveRecord::Base
    validates :username, :presence => true
    validate :username_format
end
```
