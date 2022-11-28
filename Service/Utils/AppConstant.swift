//
//  NHConstants.swift
//  Loop
//
//  Created by mac 2019 on 2/10/22.
//

import Foundation
import UIKit

struct AppConstants {
    static let globeClickEventKey = "clicked_post_id"
    static let globeZoomEventKey = "zoom_in_action_center"
    
    static let kUserDefaultSecreteTokenKey = "kSecreteTokenKey"
    static let kUserDefaultUserNameKey = "kUserNameKey"
    static let kUserDefaultPasswordKey = "kUserPasswordKey"
    static let kUserDefaultMusicKey = "kUserMusicKey"
    static let kUserDefaultSounddKey = "kUserSoundKey"
    static let kUserDefaultVibrationKey = "kUserVibrationKey"
    static let kUserDefaultBiometricsKey = "kBiometricsKey"
    static let kUserDefaultDarkModeKey = "kDarkModeKey"
    static let kUserDefaultRememberKey = "kRememberKey"
    static let kUserDefaultLanguageKey = "kLanguageKey"
    static let kUserDefaultIsShowingBadgeKey = "kIsShowingBadgeKey"
    static let kUserDefaultOnboardShowKey = "kOnboardShowKey"
}

struct Defaults {
    static func savePost(_ isCheck:Bool) {
        UserDefaults.standard.set(isCheck, forKey: "FIRST_POST_CHECK")
        UserDefaults.standard.synchronize()
    }
    
    static func hasPost() -> Bool{
       return UserDefaults.standard.bool(forKey: "FIRST_POST_CHECK")
    }
    
    static func saveIsCheckPost(_ isCheck:Bool) {
        UserDefaults.standard.set(isCheck, forKey: "IS_CHECK_POST")
        UserDefaults.standard.synchronize()
    }
    
    static func getIsCheckPost() -> Bool {
        return UserDefaults.standard.bool(forKey: "IS_CHECK_POST")
    }
    
    static func setPostCount(_ count:Int) {
        UserDefaults.standard.set(count, forKey: "COUNT_POST")
        UserDefaults.standard.synchronize()
    }
    
    static func incrementPostCount() {
        UserDefaults.standard.set(getPostCount() + 1, forKey: "COUNT_POST")
        UserDefaults.standard.synchronize()
    }
    
    static func getPostCount() -> Int {
        return UserDefaults.standard.integer(forKey: "COUNT_POST")
    }
}

struct AppFonts {
    
    static func InterRegular(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-Regular", size: ofSize)!
    }
    
    static func InterLight(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-Light", size: ofSize)!
    }
    
    static func InterMedium(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-Medium", size: ofSize)!
    }
    
    static func InterSemiBold(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-SemiBold", size: ofSize)!
    }
    
    static func InterBold(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-Bold", size: ofSize)!
    }
    
    static func InterExtraBold(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Inter-ExtraBold", size: ofSize)!
    }
    
    static func RobotoRegular(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: ofSize)!
    }
    
    static func HiraginoSansW3(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "HiraginoSans-W3", size: ofSize)!
    }
    
    static func HiraginoSansW6(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "HiraginoSans-W6", size: ofSize)!
    }
    
    static func HiraginoSansW7(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "HiraginoSans-W7", size: ofSize)!
    }
    
    static func BarlowMedium(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Barlow-Medium", size: ofSize)!
    }
    
}

struct AppColors {
    static let white = UIColor(rgb: 0xFFFFFF)
    static let transparent = UIColor.clear
    static let red = UIColor(red: 255.0/255.0, green: 0.0, blue: 0.0, alpha: 1.0)
    static let gray = UIColor.gray
    static let blueText = UIColor.init(hexString: "#3385FF")
    static let grayText = UIColor.init(hexString: "#BBBBBB")
    static let grayText33 = UIColor.init(hexString: "#333333")
    static let grayText95 = UIColor.init(hexString: "#959595")
    static let gray9d = UIColor.init(hexString: "#9D9D9D")
    static let graye8 = UIColor.init(hexString: "#E8E8E8")
    static let grayc4 = UIColor.init(hexString: "#C4C4C4")
    
    static let app_red      = UIColor.init(hexString: "#F22F2F")
    static let blue         = UIColor.init(hexString: "#316CFF")
    static let app_gray     = UIColor.init(hexString: "#F5F5F5")
    static let app_grayD0   = UIColor.init(hexString: "#D0D0D0")
    static let gray_normal  = UIColor.init(hexString: "#E8E8E8")
    static let yellow       = UIColor.init(hexString: "#EFCE24")
    static let app_black    = UIColor.init(hexString: "#333333")
    static let placeholder  = UIColor.init(hexString: "#CECECE")
    static let gray_text    = UIColor.init(hexString: "#9D9D9D")
    static let light_red    = UIColor.init(hexString: "#EC7252")
    static let light_cyan   = UIColor.init(hexString: "#54B6D4")
    static let light_green  = UIColor.init(hexString: "#85BD7C")
    static let light_purple = UIColor.init(hexString: "#9071D3")
    static let dark_gray    = UIColor.init(hexString: "#8D8D8D")
    static let grayA6       = UIColor.init(hexString: "#A6A6A6")
    static let grayB0       = UIColor.init(hexString: "#B0B0B0")
    static let grayA3       = UIColor.init(hexString: "#A3A3A3")
    static let grayD5       = UIColor.init(hexString: "#D5D5D5")
    static let gray33Alpha  = UIColor.init(hexString: "#333333", alpha: 0.8)
    static let grayE6       = UIColor.init(hexString: "#E6E6E6")
    static let gray09       = UIColor.init(hexString: "#091B3F")
    
    
    static let tagColors    = [yellow,light_cyan,light_green,light_purple,light_red]
    
    static let black = UIColor.black
    static let green = UIColor.green
    static let background = UIColor(named: "Background") ?? UIColor.clear
    static let a4a4 = UIColor(named: "A4A4") ?? UIColor.clear
    static let gray99 = UIColor(named: "Gray99") ?? UIColor.clear
    static let e2C6 = UIColor(named: "E2C6") ?? UIColor.clear
    
    static let weekViewRowColor = UIColor.init(hexString: "#E4E4E4")
    static let emotionTag1      = UIColor(hexString: "#EFCF24")
    static let emotionTag2      = UIColor(hexString: "#EC7252")
    static let emotionTag3      = UIColor(hexString: "#54B6D4")
    static let emotionTag4      = UIColor(hexString: "#85BD7C")
    static let emotionTag5      = UIColor(hexString: "#9071D3")
    
    static let weekViewTextColor = UIColor.init(hexString: "#316CFF")
    static let topBarGrayColor   = UIColor.init(hexString: "#D0D0D0")

}

enum AppTexts: String {
    // Jamil translate_id_0001 - translate_id_1000
    case translate_id_0001
    case translate_id_0002
    case translate_id_0003
    case translate_id_0004
    case translate_id_0005
    case translate_id_0006
    case translate_id_0007
    case translate_id_0008
    case translate_id_0009
    case translate_id_0010
    case translate_id_0011
    case translate_id_0012
    case translate_id_0013
    case translate_id_0014
    case translate_id_0015
    case translate_id_0016
    case translate_id_0017
    case translate_id_0018
    case translate_id_0019
    case translate_id_0020
    case translate_id_0021
    case translate_id_0022
    case translate_id_0023
    case translate_id_0024
    case translate_id_0025
    case translate_id_0026
    case translate_id_0027
    case translate_id_0028
    case translate_id_0029
    case translate_id_0030
    case translate_id_0031
    case translate_id_0032
    case translate_id_0033
    case translate_id_0034
    case translate_id_0035
    case translate_id_0036
    case translate_id_0037
    case translate_id_0038
    case translate_id_0039
    case translate_id_0040
    case translate_id_0041
    case translate_id_0042
    case translate_id_0043
    case translate_id_0044
    case translate_id_0045
    case translate_id_0046
    case translate_id_0047
    case translate_id_0048
    case translate_id_0049
    case translate_id_0050
    
    case translate_id_0051
    case translate_id_0052
    case translate_id_0053
    case translate_id_0054
    case translate_id_0055
    case translate_id_0056
    case translate_id_0057
    case translate_id_0058
    case translate_id_0059
    case translate_id_0060
    
    case translate_id_0061
    case translate_id_0062
    case translate_id_0063
    case translate_id_0064
    case translate_id_0065
    case translate_id_0066
    case translate_id_0067
    case translate_id_0068
    case translate_id_0069
    case translate_id_0070
    
    case translate_id_0071
    case translate_id_0072
    case translate_id_0073
    case translate_id_0074
    case translate_id_0075
    case translate_id_0076
    case translate_id_0077
    case translate_id_0078
    case translate_id_0079
    case translate_id_0080
    
    case translate_id_0081
    case translate_id_0082
    case translate_id_0083
    case translate_id_0084
    case translate_id_0085
    case translate_id_0086
    case translate_id_0087
    case translate_id_0088
    case translate_id_0089
    case translate_id_0090
    
    case translate_id_0091
    case translate_id_0092
    case translate_id_0093
    case translate_id_0094
    case translate_id_0095
    case translate_id_0096
    case translate_id_0097
    case translate_id_0098
    case translate_id_0099
    case translate_id_0100
    
    case translate_id_0101
    case translate_id_0102
    case translate_id_0103
    case translate_id_0104
    case translate_id_0105
    case translate_id_0106
    case translate_id_0107
    case translate_id_0108
    case translate_id_0109
    case translate_id_0110
    
    case translate_id_0111
    case translate_id_0112
    case translate_id_0113
    case translate_id_0114
    case translate_id_0115
    case translate_id_0116
    case translate_id_0117
    case translate_id_0118
    case translate_id_0119
    case translate_id_0120
    
    case translate_id_0121
    case translate_id_0122
    case translate_id_0123
    case translate_id_0124
    case translate_id_0125
    case translate_id_0126
    case translate_id_0127
    case translate_id_0128
    case translate_id_0129
    case translate_id_0130
    
    case translate_id_0131
    case translate_id_0132
    case translate_id_0133
    case translate_id_0134
    case translate_id_0135
    case translate_id_0136
    case translate_id_0137
    case translate_id_0138
    case translate_id_0139
    case translate_id_0140
    
    
    
    
    
    // Nirob translate_id_1001 - translate_id_2000
    case translate_id_1001
    case translate_id_1002
    case translate_id_1003
    case translate_id_1004
    case translate_id_1005
    case translate_id_1006
    case translate_id_1007
    case translate_id_1008
    case translate_id_1009
    case translate_id_1010
    case translate_id_1011
    case translate_id_1012
    case translate_id_1013
    case translate_id_1014
    case translate_id_1015
    case translate_id_1016
    case translate_id_1017
    case translate_id_1018
    case translate_id_1019
    case translate_id_1020
    case translate_id_1021
    case translate_id_1022
    case translate_id_1023
    case translate_id_1024
    case translate_id_1025
    case translate_id_1026
    case translate_id_1027
    case translate_id_1028
    case translate_id_1029
    case translate_id_1030
    case translate_id_1031
    case translate_id_1032
    case translate_id_1033
    case translate_id_1034
    case translate_id_1035
    case translate_id_1036
    case translate_id_1037
    case translate_id_1038
    case translate_id_1038_2
    case translate_id_1039
    case translate_id_1040
    case translate_id_1041
    case translate_id_1042
    case translate_id_1043
    case translate_id_1044
    case translate_id_1045
    case translate_id_1046
    case translate_id_1047
    case translate_id_1048
    case translate_id_1049
    case translate_id_1050
    case translate_id_1051
    case translate_id_1052
    case translate_id_1053
    case translate_id_1054
    case translate_id_1055
    case translate_id_1056
    case translate_id_1057
    case translate_id_1058
    case translate_id_1059
    case translate_id_1060
    case translate_id_1061
    case translate_id_1062
    case translate_id_1063
    case translate_id_1064
    case translate_id_1065
    case translate_id_1066
    case translate_id_1067
    case translate_id_1068
    case translate_id_1069
    case translate_id_1070
    
    
    // Talha translate_id_2001 - translate_id_3000
    case translate_id_2001
    case translate_id_2002
    case translate_id_2003
    case translate_id_2004
    case translate_id_2005
    case translate_id_2006
    case translate_id_2007
    case translate_id_2008
    case translate_id_2009
    case translate_id_2010
    case translate_id_2011
    
    // Shishir translate_id_3001 - translate_id_4000
    case translate_id_3001
    case translate_id_3002
    case translate_id_3003
    case translate_id_3004
    case translate_id_3005
    case translate_id_3006
    case translate_id_3007
    case translate_id_3008
    case translate_id_3009
    case translate_id_3010
    case translate_id_3011
    case translate_id_3012
    case translate_id_3013
    case translate_id_3014
    case translate_id_3015
    case translate_id_3016
    case translate_id_3017
    case translate_id_3018
    case translate_id_3019
    case translate_id_3020
    case translate_id_3021
    case translate_id_3022
    case translate_id_3023
    case translate_id_3024
    case translate_id_3025
    case translate_id_3026
    case translate_id_3027
    
    //Filter translate id
    
    case translate_id_0219
    case translate_id_0220
    case translate_id_0221
    case translate_id_0222
    case translate_id_0216
    
    //sadiq translate id
    
    case translate_id_4001
}

enum AppImages: String {
    //common
    case defaultProfile = "default_profile"
    // Login
    case logo = "Logo"
    case arrowBack = "ArrowBack"
    case backBlack = "back"
    case combinedLogo = "CombinedLogo"
    case appBG = "AppBG"
    //post
    case player_bg      = "player_bg"
    case icon_3dot      = "icon_3dot"
    case icon_3bar      = "icon_3bar"
    case icon_cross     = "icon_cross"
    case icon_favourite = "icon_favourite"
    case icon_user      = "icon_user"
    case music_artwork  = "music_artwork"
    case progress_line  = "progress_line"
    case icon_white_blue_tick = "icon_white_blue_tick"
    case awarness       = "awarness"
    case spotify_logo   = "spotify_logo"
    case blue_tick      = "blue_tick"
    case post_edit_bg   = "post_edit_bg"
    case back_white     = "back_white"
    case switch_on      = "switch_on"
    case switch_off     = "switch_off"
    case ques_bg        = "ques_bg"
    case dig_me_bg      = "dig_me_bg"
    case green_light    = "green_light"
    case icon_trans     = "icon_trans"
    case icon_pause     = "icon_pause"
    case first_post     = "first_post"
    case icon_check     = "icon_check"
    case icon_uncheck   = "icon_uncheck"
    case post_image     = "post_image"
    case icon_message   = "icon_message"
    
    //Bannar
    case bnr_bg         = "bnr_bg"
    case bnr_2          = "bnr_2"
    case bnr3           = "bnr3"
    case bnr_4          = "bnr_4"
    case bnr_5          = "bnr_5"
    case bnr_6          = "bnr_6"
    case bnr_7          = "bnr_7"
    case bnr_8          = "bnr_8"
    case bnr2_subview   = "bnr2_subview"
    
    case bannar_bg1     = "bannar_bg1"
    case bannar_bg2     = "bannar_bg2"
    case bannar_bg3     = "bannar_bg3"
    case bannar_bg4     = "bannar_bg4"
    case bannar_bg5     = "bannar_bg5"
    case bannar_bg6     = "bannar_bg6"
    case bannar_bg7     = "bannar_bg7"
    case bannar_bg8     = "bannar_bg8"
    case black_cross    = "black_cross"
    
    case firstOnboardIndicator = "FirstOnboardIndicator"
    case secondOnboardIndicator = "SecondOnboardIndicator"
    case thirdOnboardIndicator = "ThirdOnboardIndicator"
    case fourthOnboardIndicator = "FourthOnboardIndicator"
    case firstOnboardCenter = "FirstOnboardCenter"
    case secondOnboardCenter = "SecondOnboardCenter"
    case thirdOnboardCenter = "ThirdOnboardCenter"
    case fourthOnboardCenter = "FourthOnboardCenter"
    
    //Calendar
    case singleNote = "single_note"
    case doubleNote = "double_note"
    case tripleNote = "triple_note"
    case singleDoubleNote = "single_double_note"
    case weekEmptyNote = "week_empty_note"
    case weekNoteYellow = "week_note_yellow"
    
    //Profile
    case emotionPlaceHolderImage = "emotion_image"
    case highlightAddIconRoundButton = "icon_round_button"
    case profile = "profile_avatar"

    case earth = "Earth"
    case circle1 = "Circle1"
    case circle2 = "Circle2"
    case circle3 = "Circle3"
    case line1 = "Line1"
    case line2 = "Line2"
    case line3 = "Line3"
    case rectancle1 = "Rectangle1"
    case rectancle2 = "Rectangle2"
    
    //Settings
    case edit = "edit"
    case settingsIcon = "settings_icon"
    case grayTick = "gray_tick"
    case downArrowBlack = "down_arrow_black"
    case rightArrowBlack = "right_arrow_black"
    case question = "question"
    
    //Filter
    case squareBlueTick = "square_blue_tick"
    case squareBlueUnTick = "square_blue_untick"
    case yellowSmiley = "yellow_smiley"
    case greenFrustrated = "green_frustrated"
    case purpleAnxiety = "purple_anxiety"
    case redAngry = "red_angry"
    case blueSad = "blue_sad"
    case commonFilter = "common_filter"
}

struct APIConstants {
    static let bearerKey = "Authorization"
    static let mapboxKey = "pk.eyJ1Ijoia2pjMDcyOCIsImEiOiJja3RpZnRycGgxMXU5MnZxbnZ0cmpsa2M1In0.o0yX7q_3aKkT7Of5SZW5iQ"
    static let webviewUrl = "https://ikigai-dev.kjcommons.com/beats/"

    static let baseUrl = "https://dev.thebeats.app/"
    static let loginEndPoint = "login"
    static let tokenEndPoint = "authorization/validateToken"
    static let forgetPassEndPoint = "forget-password"
    static let passReissueEndPoint = "password-reissue"
    static let userUpdateEndPoint = "users/update"
    static let postSearchEndPoint = "posts/search"
    static let reportsCreateEndPoint = "reports/create"
    static let deletePostEndPoint = "posts/delete/"
    static let postDetailEndPoint = "posts/detail/"
    static let postUpdateEndPoint = "posts/update"
    static let postCreateEndPoint = "posts/create"
    static let insightNoteCreateEndPoint = "insight_notes/create"
    static let insightNoteUpdateEndPoint = "insight_notes/update"
    static let homePostEndPoint = "posts/home"
    static let awarenessListEndPoint = "awarness/list"
    static let awarenessCardListEndPoint = "awarness_card/list"
    static let followsCreate = "follows/create"
    static let followsDelete = "follows/deleteAll"
    static let postFeelsList = "post_feels/list"
    static let postFeelsCreate = "post_feels/create"
    static let postFeelsUpdate = "post_feels/update"
    
}

struct DateFormatConstants {
    static let yyyy_MM_dd_T_HH_mm_ss_mmm_z = "yyyy-MM-dd'T'HH:mm:ss.mmmZ"
    static let yyyy_MM_dd_T_HH_mm_ss_z = "yyyy-MM-dd'T'HH:mm:ssZ"
    static let yyyy_MM_dd_HH_mm_ss = "yyyy-MM-dd HH:mm:ss"
    static let dd_MMM_yyyy = "dd MMM yyyy"
    static let MMM_dd_yyyy = "MMM dd, yyyy"
    static let yyyy_mm_dd = "yyyy-MM-dd"
    static let yyyy = "yyyy"
    static let dd_mmm = "dd MMM"
    static let hh_mm_a = "hh:mm a"
}
