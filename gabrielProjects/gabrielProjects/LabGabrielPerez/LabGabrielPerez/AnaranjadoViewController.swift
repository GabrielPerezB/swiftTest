//
//  AnaranjadoViewController.swift
//  LabGabrielPerez
//
//  Created by Estudiante on 14/9/16.
//  Copyright © 2016 Tecnologico de Costa Rica. All rights reserved.
//

import UIKit

class AnaranjadoViewController: UIViewController {

    @IBOutlet weak var textoUITextfield: UITextField!
    
    @IBAction func cerrarVista(sender: AnyObject) {
        
        if textoUITextfield.text?.isEmpty != true{
        
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
