import SwiftUI

enum Constants {
    enum CornerRadius {
        static let general: CGFloat = 12.0
        static let button: CGFloat = 4.0
        static let six: CGFloat = 6.0
    }

    enum Colors {
        // black scales
        static let black10 = Color("black10")
        static let black20 = Color("black20")
        static let black30 = Color("black30")
        static let black40 = Color("black40")
        static let black50 = Color("black50")
        static let black60 = Color("black60")
        static let black70 = Color("black70")
        static let black80 = Color("black80")
        static let black90 = Color("black90")
        static let black = Color("kBlack")

        // background
        static let backgroundMain = Color("mainBg")
        static let backgroundDim = Color("dimBg")
        static let backgroundNavbar = Color("navbarBg")
        static let backgroundTopbar = Color("topbarBg")
        static let backgroundDisabled = Color("disabledBg")

        // main color (primary)
        static let main = Color("main")
        static let mainLight = Color("mainLight")
        static let mainStrong = Color("mainStrong")
        static let mainSub = Color("mainSub")

        // status
        static let statusDestructive = Color("destructive")
        static let statusDisabled = Color("disabled")
        static let statusUpdateNotification = Color("updateNotification")
        static let statusWithdrawal = Color("withdrawal")

        // tags
        static let calendarHospital = Color("calendar_hospital")
        static let calendarEtc = Color("calendar_etc")
        static let calendarPillca = Color("calendar_pillca")

        // border
        static let disabledBorder = Color("disabledBorder")
    }
}
