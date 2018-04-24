//
//  ViewController.swift
//  ImageSlider
//
//  Created by MacMini3 on 05/03/18.
//  Copyright © 2018 MacMini3. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    //var arrImage:[String] = ["Kalam","Naidu","Netaji","Vajpayee"]
    var arrImage = [UIImage]()
    var offSet: CGFloat = 0
    var arrImgCollection = [String]()
        
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // user default poc
        if !isKeyPresentInUserDefaults(key: "Test") {
            print("not available")
        } else {
            print("available")
        }
        //
        self.navigationController?.isNavigationBarHidden = true
        
        arrImage = [#imageLiteral(resourceName: "Kri"),#imageLiteral(resourceName: "Raj"),#imageLiteral(resourceName: "Sha"),#imageLiteral(resourceName: "Tri"),#imageLiteral(resourceName: "Tom")]
        scrollView.contentSize.width = self.view.frame.width * CGFloat(arrImage.count)
        self.offSet = 0
        
        for i in 0..<arrImage.count  {
            
            let imgView = UIImageView()
            imgView.image = arrImage[i]
            let xPosition = self.view.frame.width * CGFloat(i)
            imgView.frame = CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.scrollView.frame.height)
            imgView.contentMode = .scaleAspectFit
            scrollView.addSubview(imgView)
        }
        _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
        
        
//        let fm = FileManager.default
//        let path = Bundle.main.resourcePath! + "/" + "Collections"
//        //print(path)
//
//        do {
//            let items = try fm.contentsOfDirectory(atPath: path)
//            print(items)
//
//
//        } catch {
//            // failed to read directory – bad permissions, perhaps?
//        }
        
        arrImgCollection = try! FileManager.default.contentsOfDirectory(atPath: Bundle.main.bundlePath + "/" + "Collections" + "/" + "2.Celebrities")
                print(arrImgCollection)
        
        for  i in 0..<arrImgCollection.count {
            
            arrImgCollection[i] = Bundle.main.bundlePath + "/" + "Collections" + "/" + "2.Celebrities" + "/" + "\(arrImgCollection[i])"
        }
        
        print(arrImgCollection)

        
        //imageView.image = UIImage(named: Bundle.main.bundlePath + "/" + "Collections" + "/" + "2.Celebrities" + "/" + "Sachin.png")!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImgCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.imageView?.image = UIImage(named: arrImgCollection[indexPath.row])
        return cell
    }
    
    
    @objc func autoScroll() {
    let totalPossibleOffset = CGFloat(arrImage.count - 1) * self.view.bounds.size.width
    if offSet == totalPossibleOffset {
    offSet = 0 // come back to the first image after the last image
    }
    else {
    offSet += self.view.bounds.size.width
    }
    DispatchQueue.main.async() {
    UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
    self.scrollView.contentOffset.x = CGFloat(self.offSet)
    }, completion: nil)
    }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    



}

