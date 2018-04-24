//
//  ViewController.swift
//  FakeImage
//
//  Created by MacMini3 on 27/02/18.
//  Copyright © 2018 MacMini3. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit
import ARVideoKit

class ViewController: UIViewController, ARSKViewDelegate{
    
    @IBOutlet var sceneView: ARSKView!
    var recorder: RecordAR?
    
    var btnStart:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Start", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        btn.center = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height*0.90)
        btn.layer.cornerRadius = btn.bounds.height/2
        btn.tag = 0
        return btn
    }()
    
    var btnPause:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Pause", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        btn.center = CGPoint(x: UIScreen.main.bounds.width*0.15, y: UIScreen.main.bounds.height*0.90)
        btn.layer.cornerRadius = btn.bounds.height/2
        btn.alpha = 0.3
        btn.isEnabled = false
        return btn
    }()
    
    //let imgView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and node count
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        // Load the SKScene from 'Scene.sks'
        if let scene = SKScene(fileNamed: "Scene") {
            sceneView.presentScene(scene)
        }
        
        // Initialize with SpriteKit scene
        recorder = RecordAR(ARSpriteKit: sceneView)
        
        // Specifiy supported orientations
        recorder?.inputViewOrientations = [.portrait, .landscapeLeft, .landscapeRight]
        
        self.view.addSubview(btnStart)
        self.view.addSubview(btnPause)
        btnStart.addTarget(self, action: #selector(btnStartAction(sender:)), for: .touchUpInside)
        btnPause.addTarget(self, action: #selector(btnPauseAction(sender:)), for: .touchUpInside)
        
    }
    
    @objc func btnStartAction(sender:UIButton) {
        
        if recorder?.status == .readyToRecord {
            
            //start the video recordig
            recorder?.record()
            
            //Change the button title
            sender.setTitle("Stop", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            
            // Enable Pause button
            btnPause.alpha = 1
            btnPause.isEnabled = true
        }
        else if recorder?.status == .recording || recorder?.status == .paused {
            
            //stop recording and export video to gallery/Photos
            recorder?.stopAndExport()
            
            // Change button title
            sender.setTitle("Start", for: .normal)
            sender.setTitleColor(.black, for: .normal)
            
            //disable Pause button
            btnPause.alpha = 0.3
            btnPause.isEnabled = false
        }
    }
    
    @objc func btnPauseAction(sender:UIButton) {
        
        if recorder?.status == .recording {
            
            //pause recoding
            recorder?.pause()
            
            //change button title
            sender.setTitle("Resume", for: .normal)
            sender.setTitleColor(.blue, for: .normal)
        }
        else if recorder?.status == .paused {
            
            //resume recoding
            recorder?.record()
            
            //change the button title
            sender.setTitle("Pause", for: .normal)
            sender.setTitleColor(.black, for: .normal)
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    //function for place object
//    func PlaceImage() {
//
//        let imgCelebrity = SKSpriteNode(imageNamed: "rajni")
//        imgCelebrity.position = CGPoint(x: 0, y: 0)
//        imgCelebrity.zPosition = -1.5
//        print("Touched")
//    }
    
    // slider deligate method
    
    // get slider values
    // check vertical or horizhandal
    
    // change y position of the node
    // chage x position of the node
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
        
        //Prepare the video recorder
        recorder?.prepare(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
        
        //rest the recorder
        recorder?.rest()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK: - ARSKViewDelegate
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        // Create and configure a node for the anchor added to the view's session.
        let imgCelebrity = SKSpriteNode(imageNamed: "rajni")
        return imgCelebrity;
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
