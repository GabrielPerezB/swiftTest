//
//  EditStudentViewController.swift
//  BDApp
//
//  Created by Dennis Valverde on 10/29/16.
//  Copyright © 2016 Tecnologico de Costa Rica. All rights reserved.
//

import UIKit

class EditStudentViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var studentNameField: UITextField!
    @IBOutlet weak var studentCareerField: UITextField!
    @IBOutlet weak var studentAgeField: UITextField!
    
    var student: Student?
    override func viewDidLoad() {
        super.viewDidLoad()

        //textfield delegate
        self.studentNameField.delegate = self
        self.studentNameField.text = student?.name
        
        self.studentCareerField.delegate = self
        self.studentCareerField.text = student?.career
        
        self.studentAgeField.delegate = self
        let age: String = String(format: "%i", (student?.age)!)
        self.studentAgeField.text = age
        self.studentAgeField.keyboardType = UIKeyboardType.decimalPad
        
        //close keyboard tapping outside
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddStudentViewController.closeKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    func closeKeyboard(){
        self.view.endEditing(true)
    }

    @IBAction func saveButtonAction(_ sender: AnyObject) {
        
        student?.name = self.studentNameField.text
        student?.career = self.studentCareerField.text
        student?.age = Int16(self.studentAgeField.text!)!
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteButtonAction(_ sender: AnyObject) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(student!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        _ = self.navigationController?.popViewController(animated: true)
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
