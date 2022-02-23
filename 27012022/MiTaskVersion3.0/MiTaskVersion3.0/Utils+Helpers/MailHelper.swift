//
//  MailHelper.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 23/2/22.
//

import Foundation
import MessageUI

class MailHelper {
    static func configuracionMailCompose(delegate: MFMailComposeViewControllerDelegate, emailBody: String) -> MFMailComposeViewController{
        let mailCompo = MFMailComposeViewController()
        mailCompo.mailComposeDelegate = delegate
        mailCompo.setToRecipients(["info@mail.com", "masinfo@mail.com"])
        mailCompo.setSubject("Asunto del mensaje")
        mailCompo.setMessageBody(emailBody, isHTML: false)
        return mailCompo
    }
    
    static func configuracionMailCompose(delegate: MFMailComposeViewControllerDelegate, contactData: Contact?) -> MFMailComposeViewController{
        let mailCompo = MFMailComposeViewController()
        mailCompo.mailComposeDelegate = delegate
        mailCompo.setToRecipients(["info@mail.com", "masinfo@mail.com"])
        mailCompo.setSubject("Asunto del mensaje")
        let emailBody = getMailBodyFromContact(contactData: contactData)
        mailCompo.setMessageBody(emailBody, isHTML: false)
        return mailCompo
    }
    
    static func getMailBodyFromContact(contactData: Contact?) -> String {
        return "Datos: \n " +
        "Nombre: \(contactData?.firstName ?? "") \n" +
        "Apellido: \(contactData?.lastName ?? "") \n" +
        "Twitter: \(contactData?.usernameTwitter ?? "") \n" +
        "CV: \(contactData?.descriptionCV ?? "")"
    }
}
