//
//  ViewController.swift
//  TVAppAR
//
//  Created by MacMini3 on 01/03/18.
//  Copyright © 2018 MacMini3. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import SpriteKit
import AVFoundation

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        sceneView.isPlaying = true
        
        //1.Create spritekit video node and tell which video has to play
        let spriteKitScene = SKScene(size: CGSize(width: sceneView.frame.width, height:sceneView.frame.height))
        spriteKitScene.scaleMode = .aspectFit
        
        //create video player which will repsoible to play a video
        let videoPath = Bundle.main.url(forResource: "AVASOFT", withExtension: "mp4")!
        let videoPlayer = AVPlayer(url: videoPath)
        
        //Create spritekit viddeo node containing video player
        let videoSpriteKiteNode = SKVideoNode(avPlayer: videoPlayer)
        videoSpriteKiteNode.position = CGPoint(x: spriteKitScene.size.width/2.0, y: spriteKitScene.size.width/2.0)
        videoSpriteKiteNode.size = spriteKitScene.size
        videoSpriteKiteNode.yScale = -1.0
        videoSpriteKiteNode.play()
        spriteKitScene.addChild(videoSpriteKiteNode)
        
        //2.Create scenekit plane and add spritekit as its material
        let background = SCNPlane(width: CGFloat(0.288*2), height: CGFloat(0.18*2))
        background.firstMaterial?.diffuse.contents = spriteKitScene
        let backGroundNode = SCNNode(geometry: background)
        backGroundNode.position = SCNVector3(0, 0, -1)
        
        let backGroundBox = SCNBox(width: 0.288*2*1.1, height: 0.18*2*1.1, length: 0.025, chamferRadius: 0)
        backGroundBox.firstMaterial?.diffuse.contents = UIColor.darkGray
        let backGroundBoxNode = SCNNode(geometry: backGroundBox)
        backGroundBoxNode.position = SCNVector3(0, 0, -1.013)
        
        
        //3.Add tv to our scene
        scene.rootNode.addChildNode(backGroundNode)
        scene.rootNode.addChildNode(backGroundBoxNode)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}
