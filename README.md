# Documentación.

## Métodos del webservice

    Los metodos son accedidos via un request POST, con un contet-type JSON.

### /users/new

    @params:


    @return: listado de objetos JSON con las ciudades que deben ser desplegadas al momento de
    crear un usuario nuevo.

    Un ejemplo de un elemento de la lista de ciudades sería:

    [
        {"id":1,"name":"Santo Doming","created_at":"2014-05-07T14:51:04.000Z","updated_at":"2014-05-07T14:51:04.000Z"},
        {"id":2,"name":"Santiago","created_at":"2014-05-07T14:51:12.000Z","updated_at":"2014-05-07T14:51:12.000Z"},
        {"id":3,"name":"Bani","created_at":"2014-05-07T14:51:16.000Z","updated_at":"2014-05-07T14:51:16.000Z"},
        {"id":4,"name":"Puerto Plata","created_at":"2014-05-07T14:51:22.000Z","updated_at":"2014-05-07T14:51:22.000Z"},
        {"id":5,"name":"Romana","created_at":"2014-05-07T14:51:27.000Z","updated_at":"2014-05-07T14:51:27.000Z"},
        {"id":6,"name":"San Juan","created_at":"2014-05-07T14:51:31.000Z","updated_at":"2014-05-07T14:51:31.000Z"},
        {"id":7,"name":"Barahona","created_at":"2014-05-07T14:51:39.000Z","updated_at":"2014-05-07T14:51:39.000Z"},
        {"id":8,"name":"Dajabon","created_at":"2014-05-07T14:51:48.000Z","updated_at":"2014-05-07T14:51:48.000Z"}
    ]

### /users/create

    @params: JSON con la información ya validad de un usuario y crea el mismo en la base de datos.

    el formato que se debe enviar a este metodo es definido de la siguiente manera

    {
        name: [String, requerido],
        last_name: [String, requerido],
        email: [String, unico, con formato -> j@g.com] ,
        address: [String] ,
        password: [String, requerido, minimo 6 caracteres],
        cellphone: [String,requerido, 10 caracteres],
        phone: [String, 10 caracteres],
        city_id: [int, id valido obtenido de la lista del metodo /users/new]
    }

    @return: response json

    {response: [int]}

    donde:

    1 = usuario creado sactisfactoriamente
    2 = error en formulario



-------------------------------------------------------------------------------------------------------------------------

## Web page to do:

1. ~~Hacer el modelo y la migracion para las ciudades.~~
2. ~~Hacer el modelo y la migracion para los usuaros.~~
3. ~~Hacer un metodo new que carge un formulario para crear un usuario.~~
4. ~~Hacer que el metodo new segun el content type retorne un JSON con las ciudades.~~
5. hacer un metodo create que reciba un hash para crear un un usuario, este hash puede ser atrvés de un JSON o text.~~
6. hacer un metodo view que muestre un usuario por su id.
7. hacer que el motedo create retorne y lee un json



