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
                
                var displayText = ""
                
//                for result in results.prefix(5) {
//                    displayText += "\(Int(result.confidence * 100))%" + result.description + "\n"
//                            }
                
                guard let label = self.labels.first else { return }
                
                displayText = "\(label.identifier)"
                
                print(displayText)
                
                let isHighContrastEnabled = UIAccessibility.isDarkerSystemColorsEnabled
                
                self.yourLabel.text = displayText
                self.yourLabel.adjustsFontForContentSizeCategory = true
                self.yourLabel.font = UIFont.preferredFont(forTextStyle: .extraLargeTitle)
                self.yourLabel.textAlignment = .center
                self.yourLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
                if isHighContrastEnabled {
                    self.yourLabel.textColor = UIColor.white
                    self.yourLabel.backgroundColor = UIColor.black
                }
                else {
                    self.yourLabel.textColor = UIColor(white: 1.0, alpha: 0.8)
                }
                
//                displayText.textColor(UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0))
                    

                
//                var resultLabel = UILabel()
//                resultLabel.text = ""
//                resultLabel.frame = CGRect(x: 30, y: UIScreen.main.bounds.height - 290, width: UIScreen.main.bounds.width - 60, height: 80)
//               
//                resultLabel.textColor = UIColor.black
//                resultLabel.textAlignment = NSTextAlignment.center
//                resultLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
//                resultLabel.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.7)
//                
//                self.addSubview(resultLabel)
//                resultLabel.layer.cornerRadius = 25
//                resultLabel.layer.masksToBounds = true
            }
        })
    }
    
    func extractDetections(_ results: [VNObservation]) {
        detectionLayer.sublayers = nil // Remove all previous detections
     
        for observation in results where observation is VNRecognizedObjectObservation {
            guard let objectObservation = observation as? VNRecognizedObjectObservation else {  continue }
            
            labels = objectObservation.labels
            
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
        
        yourLabel = UILabel(frame: CGRect(x: 0, y: 0, width: screenRect.size.width, height: 155))
        yourLabel.text = "Initial Text"
        yourLabel.layer.zPosition = 100
        self.view.addSubview(yourLabel)
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
