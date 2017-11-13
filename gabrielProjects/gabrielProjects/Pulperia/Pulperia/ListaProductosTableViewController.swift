//
//  ListaProductosTableViewController.swift
//  Pulperia
//
//  Created by Estudiante on 17/8/16.
//  Copyright © 2016 Tecnologico de Costa Rica. All rights reserved.
//

import UIKit

class ListaProductosTableViewController: UITableViewController {

    var listaProductos = [Producto]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Productos"
        
        let producto1 = Producto(nombre: "Cafè", precio: 500, descripcion: "Cafè grano entero", cantidadDisponible: 8)
        let producto2 = Producto(nombre: "Azùcar", precio: 240, descripcion: "Azùcar morena", cantidadDisponible: 5)
        let producto3 = Producto(nombre: "Arroz", precio: 700, descripcion: "90% grano entero", cantidadDisponible: 11)
        let producto4 = Producto(nombre: "Frijoles", precio: 500, descripcion: "Frijoles Rojos", cantidadDisponible: 2)
        let producto5 = Producto(nombre: "Leche", precio: 500, descripcion: "Leche semidescremada", cantidadDisponible: 17)
        
        listaProductos.append(producto1)
        listaProductos.append(producto2)
        listaProductos.append(producto3)
        listaProductos.append(producto4)
        listaProductos.append(producto5)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "agregarProductoSegue"{
            let vistaDestino = segue.destination as! AgregarProductoViewController
            vistaDestino.delegate = self 
        }
    }
    
    
    //MARK: Manejo de datos
    func agregarProducto(_ nuevoProducto: Producto){
        listaProductos.append(nuevoProducto)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return self.listaProductos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productoCell", for: indexPath)
        
        let producto = listaProductos[(indexPath as NSIndexPath).row]
        
        
        cell.textLabel?.text = producto.nombre
        cell.detailTextLabel?.text = String(producto.precio)
        
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vista = storyboard.instantiateViewController(withIdentifier: "MostrarProductoViewController") as! MostrarProductoViewController
        
        vista.producto = listaProductos[(indexPath as NSIndexPath).row]
        self.navigationController?.pushViewController(vista, animated: true)
    }
    
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
