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
   I. **¿Qué pasa si tenemos @user sin nombre de usuario y llamamos a @user.valid? ¿Qué guardará @user.save**:  Si tenemos `@user` sin nombre de usuario y llamamos como dice la pregunta a `@use.valid?` El resultado que nos presentara va a ser `false`. Esto es por la razon que la validacion exige que el campo `username` no este vacio.. Si intentamos guardar @user con `@user.save` la operacion fallara y devolvera `false`, esto porque no se permite guardar registros en la Base de Datos si no cumple la validacion que se menciono.
   
   II. **Implementa username_format. Para los propósitos, un nombre de usuario comienza 	con una letra y tiene como máximo 10 caracteres de largo. Recuerda, las validaciones 	personalizadas agregan un mensaje a la colección de errores.**:  Para implementar `username_format` como me menciona, podemos añadirla con un metodo de validacion para el modelo `user` de esta manera:
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

3. **Recuerda, los filtros nos ayudan a verificar si ciertas condiciones se cumplen antes de permitir que se ejecute una acción del controlador. Para el modelo de User, digamos que queremos verificar si @user era administrador de todos los métodos en AdminController. Completa el método before_filter:check_admin a continuación que verifica si el campo de administrador en @user es verdadero. De lo contrario, redirija a la página admin_login con un mensaje que indica acceso restringido.**
```ruby
class AdminController < ApplicationController
  	        before_filter :check_admin
      # Completa el codigo
```
Agregando un metodo `check_admin` de la siguiente manera: 
```ruby
class AdminController < ApplicationController
            before_filter :check_admin
  #completar codigo
  def check_admin
    unless @user && @user.admin?
      flash[:alert] = "Acceso restringido. Debes ser un administrador para realizar esta acción."
      redirect_to admin_login_path
    end
  end
end
```
En este nuevo código:
- `before_action :check_admin` se asegura de que el mtodo `check_admin` se ejecute antes de cualquier accion en `AdminController`.
- `check_admin` es un metodo que comprueba si `@user` está presente y si el campo `admin` es verdadero. Si no es asi, se establece un mensaje de alerta en el objeto `flash` y se redirige a la página `admin_login`.  

4. AJAX (JavaScript y XML asíncronos) es un grupo de herramientas y técnicas para el desarrollo de aplicaciones web asíncronas. El objetivo de AJAX es que la comunicación entre una aplicación y el servidor de datos (es decir, solicitudes HTTP) no interfiera con la experiencia, la visualización y el comportamiento de la aplicación. A continuación, se te proporciona un formulario que simula el inicio de sesión. Comprueba si la combinación de nombre de usuario y contraseña funciona junto con la cuenta, si la hay. Para hacer eso, queremos que se realice una solicitud HTTP POST cuando se envíe este formulario. Escribe tu solución con jQuery y comenta dónde debe ubicarse la función de devolución de llamada (callback). Comprueba tus resultados.
```javascript
<form method="POST" id="foo">
<input type="text" class="user" />
<input type="password" class="pass" />
<input type="button" value="Log␣in" id="onSubmit" />
</form>
$("#onSubmit").click(function() {
# Tu codigo
})
```
5. ¿Cuándo deberías utilizar la metaprogramación basada en eval en lugar de la metaprogramación basada en bloques?.
Es preferible usar la metaprogramación basada en bloques siempre que sea posible debido a sus ventajas en términos de seguridad y legibilidad. Sin embargo, puede haber casos en los que necesites la flexibilidad adicional que ofrece eval. En esos casos, debemos asegúrarnos de manejar el código con cuidado para evitar problemas de seguridad.

## Parte 2. Pruebas
Agregamos las gemas mencionadas al `gemfile` y volvemos a mandar el `bundle install`  
![](/imagenes/7.png)  
Luego ejecutamos `rails generate rspec:install`  
![](/imagenes/8.png)  
Editamos el archivo `spec/rails_helper.rb` para incluir `require 'byebug'`  
![](/imagenes/9.png)  
Ejecuta el paquete exec guard init rspec para configurar los archivos necesarios para Guard, lo que dará como resultado la creación de un nuevo Guardfile. Agrega ese archivo a tu repositorio.  
Configura la base de datos con el comando habitual  
Ejecuta el servidor para mostrar que todo este bien.  
![](/imagenes/10.png)  

### Paso 1: Escribiendo una nueva vista

1. **Actualizar la vista `search_tmdb.html.erb`:**
   - Agregamos a la vista 
   ``` 
    <%= form_tag search_tmdb_path, method: :get, id: 'tmdb_form' do %>
        <%= label_tag :query, "Search for:" %>
        <%= text_field_tag :query, params[:query] %>
        <%= submit_tag 'Search TMDb', name: nil %>
    <% end %>

    <%= link_to 'Back to Home', movies_path %>
   ```

2. **Controlador: `MoviesController` - Método `search_tmdb`:**
   - Creamos el método `search_tmdb` en `MoviesController` para manejar la búsqueda en TMDb. Este método debe llamar a un método del modelo para realizar la búsqueda y luego renderizar la plantilla de vista correcta.

   ```ruby
   class MoviesController < ApplicationController
     def search_tmdb
       @search_results = Movie.search_tmdb(params[:search_terms])
       # Selecciona la plantilla de vista correcta para renderizar
       render 'search_tmdb_results'
     end
   end
   ```
![](/imagenes/11.png)

3. **Vista `search_tmdb_results.html.erb`:**
   - Creamos una nueva vista llamada `search_tmdb_results.html.erb` en el directorio `app/views/movies/`. Esta vista debería mostrar los resultados de la búsqueda en TMDb. 

   ```html
   <!-- Muestra los resultados de la búsqueda aquí -->
   <% @search_results.each do |result| %>
     <!-- Mostrar información relevante de cada resultado -->
   <% end %>
   ```
![](/imagenes/12.png)

4. **Especificaciones en `movies_controller_spec.rb`:**
   - Completamos las especificaciones en `movies_controller_spec.rb`. Utilizamos `get` para simular el envío de un formulario a la acción `search_tmdb`.

   ```ruby
   describe MoviesController do
     describe 'searching TMDb' do
       it 'calls the model method that performs TMDb search' do
         expect(Movie).to receive(:search_tmdb).with('search_terms')
         get :search_tmdb, params: { search_terms: 'search_terms' }
       end

       it 'selects the Search Results template for rendering' do
         # Espera que la plantilla de vista correcta sea renderizada
         get :search_tmdb
         expect(response).to render_template('search_tmdb_results')
       end

       it 'makes the TMDb search results available to that template' do
         # Verifica que los resultados de búsqueda estén disponibles en la vista
         allow(Movie).to receive(:search_tmdb).and_return(['result1', 'result2'])
         get :search_tmdb
         expect(assigns(:search_results)).to eq(['result1', 'result2'])
       end
     end
   end
   ```
![](/imagenes/13.png)
5. **Ejecutar las Pruebas:**
   - Ejecutamos las pruebas con `bundle exec rspec`.
   - Asegúrate de que todas las pruebas pasen antes de continuar con la implementación adicional.
![En este caso no agregmos ejemplos](/imagenes/14.png)  
### Paso 2: Lograr que se apruebe la primera especificación

