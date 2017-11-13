//
//  AgregarProductoViewController.swift
//  Pulperia
//
//  Created by Estudiante on 17/8/16.
//  Copyright © 2016 Tecnologico de Costa Rica. All rights reserved.
//

import UIKit

class AgregarProductoViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Logica
    @IBAction func cerrarVista(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func guardarProducto(_ sender: AnyObject) {
        
        if validarDatos(){
            
            let precio : Int! = Int(self.precioTextField.text!)
            let cantidad : Int! = Int(self.cantidadTextField.text!)
            
            let producto = Producto(nombre: self.nombreTextField.text!, precio : precio,descripcion : self.descripcionTextField.text!, cantidadDisponible : cantidad)
            
            self.delegate?.agregarProducto(producto)
            //mandar a insertar a la otra vista
            //cerrar la vista actual
            self.dismiss(animated: true, completion: nil)
            
        }else{
            let alert = UIAlertController(title: "Alerta", message: "Todos los campos son requeridos", preferredStyle: .alert)
            
            let accion = UIAlertAction(title: "ok", style: .default){
                (action) -> Void  in print("Hola")
            }
            alert.addAction(accion)
            self.present(alert,animated:true,completion: nil)
        }
        
        
    }
    
    func validarDatos()-> Bool {
        
        if self.cantidadTextField.text == "" || self.nombreTextField.text == "" || self.precioTextField.text == "" || self.descripcionTextField.text == ""{
            
                return false
        }
        return true
    }
    
    
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var precioTextField: UITextField!
    @IBOutlet weak var cantidadTextField: UITextField!
    @IBOutlet weak var descripcionTextField: UITextField!
    
    weak var delegate : ListaProductosTableViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.precioTextField.keyboardType = UIKeyboardType.decimalPad
        self.cantidadTextField.keyboardType = UIKeyboardType.decimalPad
        
        self.nombreTextField.delegate = self
        self.descripcionTextField.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
