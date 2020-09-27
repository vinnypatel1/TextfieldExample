//
//  QRCodeView.swift
//  QRCodeGenerator
//
//  Created by Vin on 17/08/2020.
//  Copyright © 2020 Vin. All rights reserved.
//

import Foundation

import SwiftUI

import CoreImage.CIFilterBuiltins


struct QRCodeView : View {
    
    let context = CIContext()
    
    let filter = CIFilter.qrCodeGenerator()
    
    var url : String
    
    
    
    var body:some View{
        
        Image(uiImage: genrateQRImage(_url: url))
            
            .interpolation(.none)
            
            .resizable()
            
            .frame(width: 200, height: 200, alignment: .center)
        
    }
    
    
    
    func genrateQRImage(_url:String) -> UIImage {
        
        let data = Data(url.utf8)
        
        filter.setValue(data, forKey: "inputMessage")
        
        
        
        if let qrCodeImage = filter.outputImage {
            
            if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent){
                
                return UIImage(cgImage: qrCodeCGImage)
                
            }
            
        }
        
        return UIImage(systemName: "xmark") ?? UIImage()
        
    }
    
}



