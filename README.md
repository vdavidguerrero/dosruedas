# Documentación.

## Métodos del webservice

    Los metodos son accedidos via un request POST, con un contet-type JSON.

### /users/new.json

    @params:


    @return: listado de objetos JSON con las ciudades que deben ser desplegadas al momento de
    crear un usuario nuevo.

    Un ejemplo de un elemento de la lista de ciudades sería:

    [
        {
            "name":[string],
            "id":[int]
        },
        {
            "name":[string],
            "id":[int]
        },
        {
            "name":[string],
            "id":[int]
        },
    ]

    donde name y id hacen referencia a un ciudad distinta.

### /users/create.json

    @params: JSON con la información ya validad de un usuario y crea el mismo en la base de datos.

    el formato que se debe enviar a este metodo es definido de la siguiente manera

    {
        name: [String, requerido],
        last_name: [String, requerido],
        email: [String, unico, con formato -> j@g.com] ,
        address: [String] ,
        password: [String, requerido, minimo 6 caracteres],
        password_confirmation: [String, requerido, minimo 6 caracteres],
        cellphone: [String,requerido, 10 caracteres],
        phone: [String, 10 caracteres],
        city_id: [int, id valido obtenido de la lista del metodo /users/new]
    }

    @return: response json

    {response: [int]}

    donde:

    1 = usuario creado sactisfactoriamente
    2 = error en formulario



## Web page to do:

1. ~~Hacer el modelo y la migracion para las ciudades.~~
2. ~~Hacer el modelo y la migracion para los usuaros.~~
3. ~~Hacer un metodo new que carge un formulario para crear un usuario.~~
4. ~~Hacer que el metodo new segun el content type retorne un JSON con las ciudades.~~
5. ~~Hacer un metodo create que reciba un hash para crear un un usuario, este hash puede ser através de un JSON o text.~~
6. Hacer un metodo view que muestre un usuario por su id.
7. Hacer que el metodo view retorne un JSON con la información de un usuario
8. hacer que el motedo create retorne y lee un json



