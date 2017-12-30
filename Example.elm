import PostgRest as PG
    exposing
        ( Attribute
        , Request
        , Schema
        , Selection
        )


getArticles : Request (List String)
getArticles =
    PG.readAll articleSchema articleSelection


articleSelection :
    Selection
        { attributes
            | title : Attribute String
        }
        String
articleSelection =
    PG.field .title


articleSchema :
    Schema x
        { title : Attribute String
        , body : Attribute String
        , favoritesCount : Attribute Int
        }
articleSchema =
    PG.schema "articles"
        { title = PG.string "title"
        , body = PG.string "body"
        , favoritesCount = PG.int "favorites_count"
        }
