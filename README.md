# Documentación.

## WebService : http://stormy-oasis-6068.herokuapp.com

## Métodos
    Los metodos son accedidos via un request GET, con un contet-type JSON.

    los metodos marcarcados con @auth: SI, necesitan que se enviado el Token único del usuario antes
    de hacer el requeremiento. Para obtener este token se necesita hace un GET al metodo /api/v1/login.

### /api/v1/users/cities
    @auth: NO

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

### /api/v1/users/create
    @auth: NO

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

    @return: String con el valor único del token

### /api/v1/users/get
    @auth: SI

    @params: JSON con el id del usuario.

    el formato que se debe enviar a este metodo es definido de la siguiente manera

    {
        id: int,
    }

    @return: Json con los datos del usuario en el siguiente formato

    {
        name: [String, requerido],
        last_name: [String, requerido],
        email: [String, unico, con formato -> j@g.com] ,
        address: [String] ,
        password: [String, requerido, minimo 6 caracteres],
        password_confirmation: [String, requerido, minimo 6 caracteres],
        cellphone: [String,requerido, 10 caracteres],
        phone: [String, 10 caracteres],
        city: [Json,{"name":[string], "id":[int]}]
        id: [int]
    }

### /api/v1/users/login
     @auth: NO

     @params: JSON con el con el usuario y la contraseñe.

    el formato que se debe enviar a este metodo es definido de la siguiente manera

    {
        email: [String],
        password: [String]
    }

    @return: String con el valor único del token

### /api/v1/users/update
    @auth: SI

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

    @return: Json con los datos del usuario en el siguiente formato

     {
        name: [String, requerido],
        last_name: [String, requerido],
        email: [String, unico, con formato -> j@g.com] ,
        address: [String] ,
        password: [String, requerido, minimo 6 caracteres],
        password_confirmation: [String, requerido, minimo 6 caracteres],
        cellphone: [String,requerido, 10 caracteres],
        phone: [String, 10 caracteres],
        city: [Json,{"name":[string], "id":[int]}]
        id: [int]
     }

