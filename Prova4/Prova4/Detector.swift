//
//  Detector.swift
//  Prova4
//
//  Created by Luigi Emanuele Zippo on 16/11/23.
//

import Foundation
import UIKit
import SwiftUI
import AVFoundation
import Vision

extension ViewController {
    
    func setupDetector() {
        let modelURL = Bundle.main.url(forResource: "YOLOv3", withExtension: "mlmodelc")
        do {
            let visionModel = try VNCoreMLModel(for: MLModel(contentsOf: modelURL!))
            let recognitions = VNCoreMLRequest(model: visionModel, completionHandler: detectionDidComplete)
            self.requests = [recognitions]
        } catch let error {
            print(error)
        }
    }
    
    func detectionDidComplete(request: VNRequest, error: Error?) {
        DispatchQueue.main.async(execute: {
            if let results = request.results {
                self.extractDetections(results)
            }
        })
    }
    
    func extractDetections(_ results: [VNObservation]) {
        detectionLayer.sublayers = nil // Remove all previous detections
     
        for observation in results where observation is VNRecognizedObjectObservation {
            guard let objectObservation = observation as? VNRecognizedObjectObservation else {  continue }
            
            let objectBounds = VNImageRectForNormalizedRect(objectObservation.boundingBox, Int(screenRect.size.width), Int(screenRect.size.height))
            let transformedBounds = CGRect(x: objectBounds.minX, y: screenRect.size.height - objectBounds.maxY, width: objectBounds.maxX - objectBounds.minX, height: objectBounds.maxY - objectBounds.minY)
      
            let boxLayer = self.drawBoundingBox(transformedBounds)
            
            detectionLayer.addSublayer(boxLayer)
        }
    }
    
    func setupLayers() {
        detectionLayer = CALayer()
        detectionLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)
        self.view.layer.addSublayer(detectionLayer)
    }
    
    func updateLayers() {
        detectionLayer?.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)
    }
    
    func drawBoundingBox(_ bounds: CGRect) -> CALayer {
        let boxLayer = CALayer()
        boxLayer.frame = bounds
        boxLayer.borderWidth = 3.0
        boxLayer.borderColor = CGColor.init(red: 7.0, green: 8.0, blue: 0.0, alpha: 1.0)
        boxLayer.cornerRadius = 4
        return boxLayer
    }
    
//    func showLabels (label: String, confidence: VNConfidence) -> CATextLayer {
//        
//        let textLayer = CATextLayer()
//        
//        let font = UIFont.systemFont(ofSize: 30)
//        
//        textLayer.backgroundColor = CGColor.init(red: 1.0, green: 00, blue: 0.0, alpha: 1.0)
//        let attribute = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: Color.white] as [NSAttributedString.Key : Any]
//            let formattedString = NSMutableAttributedString(string: String(format: "\(label) (%.2f)", confidence), attributes: attribute)
//            textLayer.string = formattedString
//            let boxWidth: CGFloat = CGFloat(formattedString.length)
//            textLayer.bounds = CGRect(x: 0, y: 0, width: boxWidth, height: 40.0)
//            textLayer.position = CGPoint(x: 50.0, y: 50.0)
//            textLayer.foregroundColor = CGColor.init(red: 0.0, green: 00, blue: 1.0, alpha: 1.0)
//            textLayer.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(0)).scaledBy(x: 1.0, y: -1.0))
//
//        return textLayer
//    }
    
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .up, options: [:])
            
        do {
            try imageRequestHandler.perform(self.requests)
        } catch {
            print(error)
        }
    }
}
