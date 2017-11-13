//
//  AddStudentViewController.swift
//  BDApp
//
//  Created by Dennis Valverde on 10/29/16.
//  Copyright © 2016 Tecnologico de Costa Rica. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var studentNameField: UITextField!
    @IBOutlet weak var studentCareerField: UITextField!
    @IBOutlet weak var studentAgeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //textfield delegate
        self.studentNameField.delegate = self
        self.studentCareerField.delegate = self
        self.studentAgeField.delegate = self
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

    @IBAction func addButtonAction(_ sender: AnyObject) {
        
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newStudent = Student(context: context)
        newStudent.name = self.studentNameField.text
        newStudent.age = Int16(self.studentAgeField.text!)!
        newStudent.career = self.studentCareerField.text
        newStudent.sayHello()
        
        appDelegate.saveContext()
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
