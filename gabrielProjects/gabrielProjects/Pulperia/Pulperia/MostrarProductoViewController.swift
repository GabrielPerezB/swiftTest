//
//  MostrarProductoViewController.swift
//  Pulperia
//
//  Created by Estudiante on 31/8/16.
//  Copyright © 2016 Tecnologico de Costa Rica. All rights reserved.
//

import UIKit

class MostrarProductoViewController: UIViewController {

    
    @IBOutlet weak var nombreInfo: UILabel!
    @IBOutlet weak var cantidadInfo: UILabel!
    @IBOutlet weak var precioInfo: UILabel!
    @IBOutlet weak var descripcionInfo: UILabel!
    
    var producto : Producto?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nombreInfo.text = self.producto?.nombre
        let cantidad : Int=(self.producto?.cantidadDisponible)!
        self.cantidadInfo.text = String(cantidad)
        let precio : Int=(self.producto?.precio)!
        self.precioInfo.text = String(precio)
        self.descripcionInfo.text = self.producto?.descripcion
        
        self.navigationItem.title = self.producto?.nombre

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
