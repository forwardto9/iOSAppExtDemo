//
//  DocumentActionViewController.swift
//  FileProviderExUI
//
//  Created by uwei on 27/12/2017.
//  Copyright © 2017 TEG of Tencent. All rights reserved.
//

import UIKit
import FileProviderUI

class DocumentActionViewController: FPUIActionExtensionViewController {
    
    @IBOutlet weak var identifierLabel: UILabel!
    @IBOutlet weak var actionTypeLabel: UILabel!
    
    override func prepare(forAction actionIdentifier: String, itemIdentifiers: [NSFileProviderItemIdentifier]) {
        identifierLabel?.text = actionIdentifier
        actionTypeLabel?.text = "Custom action"
    }
    
    override func prepare(forError error: Error) {
        identifierLabel?.text = error.localizedDescription
        actionTypeLabel?.text = "Authenticate"
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        // Perform the action and call the completion block. If an unrecoverable error occurs you must still call the completion block with an error. Use the error code FPUIExtensionErrorCode.failed to signal the failure.
        extensionContext.completeRequest()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        extensionContext.cancelRequest(withError: NSError(domain: FPUIErrorDomain, code: Int(FPUIExtensionErrorCode.userCancelled.rawValue), userInfo: nil))
    }
    
}

