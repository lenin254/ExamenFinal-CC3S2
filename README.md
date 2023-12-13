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
   1. **¿Qué pasa si tenemos @user sin nombre de usuario y llamamos a @user.valid? ¿Qué guardará @user.save**:  Si tenemos `@user` sin nombre de usuario y llamamos como dice la pregunta a `@use.valid?` El resultado que nos presentara va a ser `false`. Esto es por la razon que la validacion exige que el campo `username` no este vacio.. Si intentamos guardar @user con `@user.save` la operacion fallara y devolvera `false`, esto porque no se permite guardar registros en la Base de Datos si no cumple la validacion que se menciono.
   
   2. **Implementa username_format. Para los propósitos, un nombre de usuario comienza 	con una letra y tiene como máximo 10 caracteres de largo. Recuerda, las validaciones 	personalizadas agregan un mensaje a la colección de errores.**:  Para implementar `username_format` como me menciona, podemos añadirla con un metodo de validacion para el modelo `user` de esta manera:
   ```ruby
    class User < ActiveRecord::Base
    validates :username, presence: true
    validate :username_format

    def username_format
        if username.present? && (username.length > 10 || !username.match(/\A[A-Za-z]/))
        errors.add(:username, "debe iniciar con una letra y tener como max 10 caracteres")
        end
    end
    end
   ```
   Aqui podemos ver como se implemento el metodo ademas que verifica si `username` esta presente y cumpla los reuqisitos que me indico en la pregunta.  
   Si no cumple se agrega un mensaje de error que tiene una descripcion sobre porque fallo la validacion.


