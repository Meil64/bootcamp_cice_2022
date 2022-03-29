//
//  LocalizedKeys.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 23/3/22.
//

import Foundation

struct LocalizedKeys {
    
    struct General {
        static let accept = "general_accept".localized
        static let cancel = "general_cancel".localized
    }
    
    struct Login {
        static let successTitle = "title_my_alert_login_success".localized
        static let successMessage = "message_my_alert_login_success".localized
        static let failureTitle = "title_my_alert_login_failure".localized
        static let failureMessage = "message_my_alert_login_failure".localized
    }
    
    struct Mail {
        static let successTitle = "title_my_alert_mail_success".localized
        static let successMessage = "message_my_alert_mail_success".localized
        static let failureTitle = "title_my_alert_mail_failure".localized
        static let failureMessage = "message_my_alert_mail_failure".localized
    }
    
    struct WebView {
        static let webViewTitle = "title_my_alert_webview".localized
        static let webViewMessage = "message_my_alert_webview".localized
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
