{--
Copyright (c) 2020 Target Brands, Inc. All rights reserved.
Use of this source code is governed by the LICENSE file in this repository.
--}


port module Interop exposing (onSessionChange, onThemeChange, setFavicon, setTheme, storeSession)

import Json.Decode as Decode
import Json.Encode as Encode



-- SESSION


{-| inbound
-}
port onSessionChange : (Decode.Value -> msg) -> Sub msg


{-| outbound
-}
port storeSession : Encode.Value -> Cmd msg



-- THEME


{-| inbound
-}
port onThemeChange : (Decode.Value -> msg) -> Sub msg


{-| outbound
-}
port setTheme : Encode.Value -> Cmd msg


{-| outbound
-}
port setFavicon : Encode.Value -> Cmd msg
