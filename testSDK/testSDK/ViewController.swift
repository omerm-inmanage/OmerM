//
//  ViewController.swift
//  testSDK
//
//  Created by Omer Cohen on 29/06/2021.
//

import UIKit
import OmerM

class ViewController: UIViewController, MeshulamDelegate {
    func setBitPaymentSuccess(_ transactionId: String) {
        
    }
    
    func settleSuspendedTransactionSuccess(response: String) {
        
    }
    
    func createPaymentProccesSuccess(_ processId: String, _ processToken: String) {
        
    }
    
    func getPaymentProcessInfoSuccess(response: String) {
        
    }
    
    func onFailure(_ error: String) {
        
    }
    
    func onCancel() {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func didTap(_ sender: Any) {
        Meshulam.shared().createPaymentProcess(pageCode: "e439ab93f4b2",
                                    apiKey: "lrgkjslkjfsd",
                                    userId: "24002fc104f101c0fef",
                                    fullName: "Amit Azulay",
                                    phoneNumber: "0542533691",
                                    sum: "1",
                                    delegate: self)
    }
    
}
//
//
//extension ViewController: MeshulamDelegate {
//}
