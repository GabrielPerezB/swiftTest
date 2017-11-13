//
//  JSONParser.swift
//  AlbumWS
//
//  Created by Estudiante on 7/9/16.
//  Copyright © 2016 Tecnologico de Costa Rica. All rights reserved.
//

import Foundation

class JSONParser{
    
    static func parseAlbums(data : Data)-> [Album]{
        
        var albumList = [Album]()
        
        do{
       
             let json = try JSONSerialization.jsonObject(with: data, options: [])
                // parse JSON
                
            //let json = try JSONSerialization.JSONObjectWithData( data, options: [])
            
            
            let albumsArray = json as? [AnyObject] ?? []
            for album in albumsArray{
                let albumId = album["id"] as? Int
                let albumTitle = album["title"] as? String
                let newAlbum = Album(id: albumId!, title: albumTitle!)
                albumList.append(newAlbum)
            }
        }catch{
            print("Error")
        }
        
        return albumList
    }
    
    
    
    static func parsePhotos(data : Data, albumID: Int)-> [Photo]{
        
        var photosList = [Photo]()
        
        do{
            
            let json = try JSONSerialization.jsonObject(with: data , options: [])
            //let json = try JSONSerialization.JSONObjectWithData( data, options: [])
            
            let photoArray = json as? [AnyObject] ?? []
            for photo in photoArray{
                let curentPhotoAlbumId = photo["albumId"] as! Int
        
                
                if albumID == curentPhotoAlbumId{
                    
                    let currentPhotoTitle = photo["title"] as! String
                    let currentPhotoUrl = photo["url"] as! String
                    
                    let newPhoto = Photo(title: currentPhotoTitle, url:  currentPhotoUrl)
                    photosList.append(newPhoto)
                }
            }
        }catch{
            print("Error")
        }
        
        return photosList
    }

    
}

