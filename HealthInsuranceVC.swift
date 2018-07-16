//
//  HealthInsuranceVC.swift
//  MIT GSL
//
//  Created by Leonardo Oliveira on 15/07/2018.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HealthInsuranceVC: UIViewController {

    var fullName: String!
    var email: String!
    var birthDate: String!
    var birthCountry: String!
    var city: String!
    var id: String!
    var phoneNumber: String!
    var emergencyContact: String!
    var gender: String!
    var height: String!
    var weight: String!
    var bloodType: String!
    var diseases: String!
    var allergies: String!
    var company: String!
    var plan: String!
    var hospital: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    
    fileprivate func saveProfileIntoFirebase(){
        
        
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let dictionaryValues = ["name": self.fullName,
                                "email": self.email,
                                "birth date": self.birthDate,
                                "birth country": self.birthCountry,
                                "city": self.city,
                                "id": self.id,
                                "phone number": self.phoneNumber,
                                "emergency contact": self.emergencyContact,
                                "gender": self.gender,
                                "height": self.height,
                                "weight": self.weight,
                                "blood type": self.bloodType,
                                "diseases": self.diseases,
                                "allergies": self.allergies,
                                "company": self.company,
                                "plan": self.plan,
                                "hospital": self.hospital]
        
        let values = [uid: dictionaryValues]
        
        Database.database().reference().child("users").updateChildValues(values) { (error, reference) in
            
            if let error = error{
                print(error)
                return
            }
            
            print("Success: saved into FIrebase")
            
            // peform segue
        }
    }
    
}
