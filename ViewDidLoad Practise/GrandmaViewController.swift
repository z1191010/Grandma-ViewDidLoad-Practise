//
//  GrandmaViewController.swift
//  ViewDidLoad Practise
//
//  Created by Kai on 2022/12/2.
//

import UIKit
import AVFoundation

class GrandmaViewController: UIViewController {
    let player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //漸層背景
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.purple.cgColor, UIColor.orange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.locations = [0, 1.1]
        view.layer.addSublayer(gradientLayer)
        
        //外婆剪影
        let grandmaImage = UIImage(named: "Grandma")
        let grandmaImageView = UIImageView(image: grandmaImage)
        grandmaImageView.frame = CGRect(x: 50, y: 500, width: 300, height: 300)
        view.addSubview(grandmaImageView)
        
        //雪
    
        let snowEmitterCell = CAEmitterCell()
        snowEmitterCell.contents = UIImage(named: "snow")?.cgImage
        snowEmitterCell.birthRate = 35
        snowEmitterCell.lifetime = 20
        snowEmitterCell.scale = 0.005
        snowEmitterCell.scaleRange = 0.02
        snowEmitterCell.velocity = 10
        snowEmitterCell.yAcceleration = 5
        snowEmitterCell.emissionRange = CGFloat.pi
        snowEmitterCell.scaleSpeed = 0
        snowEmitterCell.spin = 0.5
        snowEmitterCell.spinRange = 1
        
        let snowEmitterLayer = CAEmitterLayer()
        snowEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2, y: -50)
        snowEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        snowEmitterLayer.emitterShape = .line
        snowEmitterLayer.emitterCells = [snowEmitterCell]
        view.layer.addSublayer(snowEmitterLayer)
       
        //背景音樂
        
        let url = Bundle.main.url(forResource: "外婆", withExtension: "mp3")!
        let playItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playItem)
        player.volume = 2
        player.play()

        // Do any additional setup after loading the view.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
