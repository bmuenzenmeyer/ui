{--
Copyright (c) 2020 Target Brands, Inc. All rights reserved.
Use of this source code is governed by the LICENSE file in this repository.
--}


module Pages.Build.Model exposing (GetLogs, Msg(..), PartialModel)

import Browser.Navigation as Navigation
import RemoteData exposing (WebData)
import Time exposing (Posix)
import Vela
    exposing
        ( Build
        , BuildNumber
        , FocusFragment
        , Logs
        , Org
        , Repo
        , StepNumber
        , Steps
        )



-- MODEL


{-| PartialModel : an abbreviated version of the main model
-}
type alias PartialModel a =
    { a
        | navigationKey : Navigation.Key
        , time : Posix
        , build : WebData Build
        , steps : WebData Steps
        , logs : Logs
        , shift : Bool
        , follow : Int
        , expand : Bool
    }



-- TYPES


type Msg
    = ExpandStep Org Repo BuildNumber StepNumber
    | FocusLogs String
    | FollowStep Int
    | FollowSteps Org Repo BuildNumber Bool
    | ExpandAllSteps Org Repo BuildNumber
    | CollapseAllSteps
    | FocusOn String


type alias GetStepLogs a msg =
    PartialModel a -> Org -> Repo -> BuildNumber -> StepNumber -> FocusFragment -> Bool -> Cmd msg


type alias GetStepsLogs a msg =
    PartialModel a -> Org -> Repo -> BuildNumber -> Steps -> FocusFragment -> Bool -> Cmd msg


type alias GetLogs a msg =
    ( GetStepLogs a msg, GetStepsLogs a msg )
