module Helper exposing (..)

import Html
import Html.Attributes


add2 : Int -> Int -> Int
add2 int1 int2 =
    int1 + int2


add3 : Float -> Float -> Float -> Float
add3 int1 int2 int3 =
    int1 + int2 + int3


calc : Int -> Int -> (Int -> Int -> Int) -> Int
calc int1 int2 operator =
    operator int1 int2



--records


mit : { name : String, age : Int, email : String }
mit =
    { name = "Andrea"
    , age = 21
    , email = "andreasurdez@gmail.com"
    }


getEmail : { name : String, age : Int, email : String } -> String
getEmail p =
    .email p



--Helper.getEmail Helper.mit
--List.map : (Record -> Int) -> List Record -> List Int
--List.map .age [mit,mit,mit]
--ejercicio 1


ej1 : List { name : String, releaseYear : Int, currentVersion : String }
ej1 =
    [ { name = "ELM"
      , releaseYear = 2022
      , currentVersion = "1.1.1"
      }
    , { name = "Java"
      , releaseYear = 2008
      , currentVersion = "3.2"
      }
    ]


languageNames : List { name : String, releaseYear : Int, currentVersion : String } -> List String
languageNames lang =
    List.map .name lang



--se corre en terminal con Helper.languageNames Helper.ej1
--ejercicio 2


type alias SoP =
    { name : String, uType : String }


ej2 : List SoP
ej2 =
    [ { name = "Andrea"
      , uType = "Student"
      }
    , { name = "Mitsiu"
      , uType = "Professor"
      }
    ]


onlyStudents : List SoP -> List String
onlyStudents list =
    List.map
        (\n ->
            if n.uType == "Professor" then
                ""

            else if n.uType == "Student" then
                n.name

            else
                "ERROR"
        )
        list



--Helper.onlyStudents Helper.ej2
--ejercicio 3


type alias Videogame =
    { title : String, releaseYear : Int, available : Bool, downloads : Int, genres : List String }


ej3 : List Videogame
ej3 =
    [ { title = "Call of Duty"
      , releaseYear = 2021
      , available = True
      , downloads = 3000
      , genres = [ "Comedy", "Suspense" ]
      }
    , { title = "Fortnite"
      , releaseYear = 2022
      , available = True
      , downloads = 200
      , genres = [ "Mystery", "Familiar" ]
      }
    ]


getVideogameGenres : List Videogame -> List (List String)
getVideogameGenres videogame =
    List.map (\n -> n.genres) videogame



--Helper.getVideogameGenres Helper.ej3
--ejercicio de tarea


type alias Computer =
    { ram : String, model : String, brand : String, screenSize : String }


myLaptop : Computer
myLaptop =
    { ram = "512", model = "GF63 Thin", brand = "MSI", screenSize = "1600 x 800" }


main : Html.Html msg
main =
    Html.div
        []
        [ Html.h1
            []
            [ Html.text "My Laptop"
            , Html.div
                []
                [ Html.ul
                    []
                    [ Html.li [] [ Html.text ("Ram: " ++ myLaptop.ram) ], Html.li [] [ Html.text ("Modelo: " ++ myLaptop.model) ], Html.li [] [ Html.text ("Marca: " ++ myLaptop.brand) ], Html.li [] [ Html.text ("Pulgadas: " ++ myLaptop.screenSize) ] ]
                ]
            ]
        ]



--ejercicios para practicar
-- 1.1 Define un record llamado "libro" con estos campos:
--     titulo : String
--     paginas : Int
--     autor : String
-- 1.2 Accede al campo "titulo" de dos formas diferentes:
--     a) usando libro.titulo
--     b) usando .titulo libro


libro : { titulo : String, paginas : Int, autor : String }
libro =
    { titulo = "Libro sin Titulo", paginas = 332, autor = "Andrea Surdez" }



--se escribe Helper.libro.titulo y .titulo Helper.libro .... asi imprime el puro titulo


persona : { nombre : String, edad : Int, ciudad : String }
persona =
    { nombre = "Ana", edad = 25, ciudad = "Madrid" }



-- 2.1 Crea una NUEVA variable llamada "persona2" que sea igual a "persona"
--     pero con la ciudad cambiada a "Barcelona".
--     Recuerda: "persona" NO debe cambiar, debes crear un nuevo record.


persona2 : { nombre : String, edad : Int, ciudad : String }
persona2 =
    { persona | ciudad = "Barcelona" }



--correr Helper.persona2 .... imprime los atributos pero ahora en vez de Madrid dice Barcelona
--la linea esa es para copiar atributos y cambiar los que queramos
-----------------------------------
-- 3.1 Define un type alias llamado "Producto" con estos campos:
--     nombre : String
--     precio : Int
--     enStock : Bool
-- 3.2 Crea una variable "miProducto" de tipo Producto con datos de tu elección.


type alias Producto =
    { nombre : String, precio : Int, enStock : Bool }


miProducto : Producto
miProducto =
    { nombre = "pizza", precio = 99, enStock = True }



------------------------------


type alias Persona =
    { nombre : String, edad : Int }


gente : List Persona
gente =
    [ { nombre = "Luis", edad = 30 }
    , { nombre = "María", edad = 22 }
    , { nombre = "Carlos", edad = 45 }
    ]



-- 4.1 Usa List.map para obtener una lista SOLO con los nombres:
--     Resultado esperado: ["Luis", "María", "Carlos"]


listNombres : List Persona -> List String
listNombres names =
    List.map .nombre names



--Helper.listNombres Helper.gente
-- 4.2 Usa List.map para obtener una lista SOLO con las edades:
--     Resultado esperado: [30, 22, 45]


listEdades : List Persona -> List Int
listEdades ages =
    List.map .edad ages



--Helper.listEdades Helper.gente
------------------------------


type alias Pelicula =
    { titulo : String
    , año : Int
    , calificacion : Int -- de 1 a 10
    }


peliculas : List Pelicula
peliculas =
    [ { titulo = "Inception", año = 2010, calificacion = 9 }
    , { titulo = "Toy Story", año = 1995, calificacion = 10 }
    ]



-- 5.1 Crea una función "titulos" que reciba una lista de Pelicula
--     y devuelva una lista de String con solo los títulos.


titulos : List Pelicula -> List String
titulos listPeli =
    List.map .titulo listPeli



-- Helper.titulos Helper.peliculas
-- 5.2 Crea una NUEVA lista "peliculasMejoradas" donde todas las películas
--     tengan calificación 10 (usa la sintaxis { record | campo = valor }).


peliculasMejoradas : List Pelicula
peliculasMejoradas =
    List.map (\n -> { n | calificacion = 10 }) peliculas



--pongo Helper.titulos Helper.peliculas
------------------


type alias Products =
    { nombre : String
    , precio : Float
    , enOferta : Bool
    }


carrito : List Products
carrito =
    [ { nombre = "Laptop", precio = 800.0, enOferta = False }
    , { nombre = "Mouse", precio = 25.5, enOferta = True }
    , { nombre = "Teclado", precio = 45.0, enOferta = False }
    ]



-- A.1 Crea una función "aplicarDescuento" que reciba una lista de Producto
--     y devuelva una NUEVA lista donde todos los productos tengan un 10% de descuento
--     (es decir: precio * 0.9)
--     Tip: usa List.map y { producto | precio = ... }


aplicarDescuento : List Products -> List Products
aplicarDescuento productos =
    List.map (\n -> { n | precio = n.precio * 0.9 }) productos
