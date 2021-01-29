//
//  Constants.swift
//

import UIKit
enum Constants {
    static let minimumLengthName = 3
    static let maximumLengthName = 30
    static let maximumLengthNumber = 20
    static let minimumLengthNumber = 8
    static let maximumLengthText = 50
    static let minimumLengthPwd = 6
    static let maximumLengthPwd = 20
    static let maximumLengthTextView = 500
    static let networkSessionToken  = ""
    static let selectedColor = UIColor(red: 198/255, green: 0/255, blue: 37/255, alpha: 1)
    
    
    static let kWINDOW_FRAME                = UIScreen.main.bounds
    static let kSCREEN_SIZE                 = UIScreen.main.bounds.size
    static let kWINDOW_WIDTH                = UIScreen.main.bounds.size.width
    static let kWINDOW_HIEGHT               = UIScreen.main.bounds.size.height
    
    static let APP_DELEGATE                = UIApplication.shared.delegate as! AppDelegate
    static let UIWINDOW                    = UIApplication.shared.delegate!.window!
}

enum TextLength {
    
    static let defaultFieldLenght = 30
    static let emailFieldLength = 50
     static let addressFieldLength = 150
    static let numberLength = 30
    static let passwordLength = 20
    static let phoneLength = 10
}

enum FP {
    static var emailUser = ""
    static var loginGuest  = false
}

enum CurrentUser{
    static var loggedInUser : User? = nil
    static var userType : UserType = .registered
    static var userLoginType : UserLoginType = .user
    static var languageId : UserLanguage = .english
    static var deviceToken : String = "123456"
}

enum Login {
    static let isLoggedIn : String = "isLoggedIn"
    static let userData : String = "userData"
    static let token : String = "token"
}



enum ServiceCodes  {
    static let successCode : Int = 200
    static let authExpireCode : Int = 401
    static let userBlockCode : Int = 402
    static let errorCode : Int = 500
    static let errorCode400 : Int = 400
    static let emptyArrayCode : Int = 422
}
enum AppError: Error {
    case apiFailure(String)
    case unAuthorizeError(String)
}
enum UserDefaultKey {
    static let isConfigurationSaved = "isConfigurationSaved"
    static let selectedAddress = "selectedAddress"
    static let deviceToken = "deviceToken"
    static let cardData = "cardData"
    static let launchedBefore = "launchedBefore"
    static let userLoginType = "userLoginType"
    static let isSocialLogin = "isSocialLogin"
    static let languageId = "languageId"
    static let selectedCurrency = "selectedCurrency"
}

enum UserType{
    case registered
    case guest
    
}

enum UserLoginType : Int{
    case user = 1
    case celebrity = 2
    case guest = 3
    
}
enum UserLanguage : Int{
        case english = 1
        case arabic = 2
}


extension Notification.Name {
    //static let setHomeOnLeftMenu = Notification.Name(rawValue: "setHomeOnLeftMenu")
}

enum DateFormatType {
    static let defaultDisplayFormat : String = "dd, MMM yyyy"
    static let reviewDisplayFormat : String = "MMMM dd, yyyy"
    static let defaultDate : String = "yyyy-MM-dd"
    static let slashFormat : String = "dd/MM/yyyy"
    static let onlyYear : String = "yyyy"
    static let serverFormatMilliSecond : String = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    static let serverFormatSecond : String = "yyyy-MM-dd'T'HH:mm:ss"
    static let orderHistoryFormat : String = "dd-MM-yyyy"
    
}
