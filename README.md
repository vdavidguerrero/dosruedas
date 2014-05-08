# Documentación.

## Métodos del webservice

    Los metodos son accedidos via un request POST, con un contet-type JSON.

### /users/new

     Retorna el listado de objetos JSON con las ciudades que deben ser desplegadas al momento de
    crear un usuario nuevo.

    Un ejemplo de un elemento de la lista de ciudades sería:

    ```javascript
    {"id":1,"name":"Santo Doming","created_at":"2014-05-07T14:51:04.000Z","updated_at":"2014-05-07T14:51:04.000Z"}
    print s
    ```

-------------------------------------------------------------------------------------------------------------------------

## Web page todo:

1. ~~Hacer el modelo y la migracion para las ciudades.~~
2. ~~Hacer el modelo y la migracion para los usuairos.~~
3. ~~Hacer un metodo new que carge un formulario para crear un usuario.~~
4. ~~Hacer que el metodo new segun el content type retorne un JSON con las ciudades.~~
5. hacer un metodo create que reciba un hash para crear un un usuario, este hash puede ser atrvés de un JSON o text.~~
6. hacer un metodo view que muestre un usuario por su id.
7. hacer que el motedo create retorne y lee un json



