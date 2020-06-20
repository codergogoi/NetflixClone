//
//  VideoPlayerView.swift
//  UI_Components
//
//  Created by JAYANTA GOGOI on 5/3/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit
import AVFoundation


class VideoPlayerView: UIView {

    let indicator: UIActivityIndicatorView = {
        
        let iv = UIActivityIndicatorView(style: .large)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.startAnimating()
        return iv
    }()
    
    lazy var playToggle: UIButton = {
       
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.isHidden = true
        return button
    }()
    
    var isPlaying = false
    var player: AVPlayer?
    
    @objc func handlePause() {
        
        if isPlaying {
            player?.pause()
            playToggle.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
        }else{
            player?.play()
            playToggle.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        }
        
        isPlaying = !isPlaying
    }
    
    let controlsContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0, alpha: 1)
        return view
    }()
    
    let lblCurrentTime: UILabel = {
           let lbl = UILabel()
           lbl.text = "00:00"
           lbl.textColor = .white
           lbl.translatesAutoresizingMaskIntoConstraints = false
           lbl.font = UIFont.systemFont(ofSize: 13)
           lbl.textAlignment = .left
           return lbl
       }()
    
    let lblVideoLength: UILabel = {
        let lbl = UILabel()
        lbl.text = "00:00"
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.textAlignment = .right
        return lbl
    }()
    
    lazy var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .white
        slider.maximumTrackTintColor = .gray
        slider.setThumbImage(#imageLiteral(resourceName: "thumb"), for: .normal)
        
        slider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
        return slider
    }()
    
    var isSkiping = false
    
    
   
    @objc func onSliderValChanged(slider: UISlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            case .began:
                self.isSkiping = true
            case .moved:
                    if let duration = player?.currentItem?.duration {
                          
                          let totalSeconds = CMTimeGetSeconds(duration)
                          
                              let value = Float64(slider.value) * totalSeconds
                          
                              let seekTime = CMTime(value: Int64(value), timescale: 1)
                              
                              player?.seek(to: seekTime, completionHandler: { (completed) in
                                  
                              })
                          
                          }
            case .ended:
                self.isSkiping = false
            default:
                self.isSkiping = false
                break
            }
        }
        
      
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupPlayerView()
//        setupControlBGLayer()
        addSubview(controlsContainer)
        controlsContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        controlsContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        controlsContainer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        controlsContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        controlsContainer.addSubview(indicator)
        indicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        self.controlsContainer.addSubview(playToggle)
        playToggle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        playToggle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        playToggle.heightAnchor.constraint(equalToConstant: 100).isActive = true
        playToggle.widthAnchor.constraint(equalToConstant: 100).isActive = true
        playToggle.addTarget(self, action: #selector(handlePause), for: .touchUpInside)

        controlsContainer.addSubview(lblVideoLength)
        controlsContainer.addSubview(lblCurrentTime)
        
        lblVideoLength.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        lblVideoLength.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
        lblVideoLength.widthAnchor.constraint(equalToConstant: 60).isActive = true
        lblVideoLength.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        lblCurrentTime.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        lblCurrentTime.heightAnchor.constraint(equalToConstant: 24).isActive = true
        lblCurrentTime.widthAnchor.constraint(equalToConstant: 60).isActive = true
        lblCurrentTime.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50).isActive = true

        controlsContainer.addSubview(slider)
        slider.leadingAnchor.constraint(equalTo: lblCurrentTime.trailingAnchor).isActive = true
        slider.trailingAnchor.constraint(equalTo: lblVideoLength.leadingAnchor).isActive = true
        slider.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50).isActive = true
        self.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupControlBGLayer(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.red.cgColor]
        gradientLayer.locations = [0.7, 1.2]
        controlsContainer.layer.addSublayer(gradientLayer)
    }
    
    func setupPlayerView() {
    
        
        
        let headers: [String: String] = [
                  "Cookie": "signature=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZWM0ZGJmMDA1ZmJjMzBkZTBiYmYzYjUiLCJlbWFpbCI6InRlc3RAdGVzdC5jb20iLCJpYXQiOjE1OTI2MzkyNTIsImV4cCI6MTYwMDQxNTI1Mn0.cQMOtMAiylR1mc_fQwH3RXCmBPnkupk33rGZSbmLfmY",
                  "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZWM0ZGJmMDA1ZmJjMzBkZTBiYmYzYjUiLCJlbWFpbCI6InRlc3RAdGVzdC5jb20iLCJpYXQiOjE1OTI2MzkyNTIsImV4cCI6MTYwMDQxNTI1Mn0.cQMOtMAiylR1mc_fQwH3RXCmBPnkupk33rGZSbmLfmY"
              ]

       
        
        let movieUrl = URL(string: "http://localhost:8000/watch/movie/5ebfe470a7195425c5964625")
        
        
        if let url = movieUrl{
            
            let asset = AVURLAsset(url: url, options: ["AVURLAssetHTTPHeaderFieldsKey": headers])
            let playerItem = AVPlayerItem(asset: asset)
            self.player = AVPlayer(playerItem: playerItem)
            let playerlayer = AVPlayerLayer(player: player)
            self.layer.addSublayer(playerlayer)
            playerlayer.frame = self.frame
            player?.play()
            player?.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)
            
            let interval = CMTime(value: 1, timescale: 2)
            player?.addPeriodicTimeObserver(forInterval: interval, queue: .main, using: { (progressTime) in
                
                let seconds = CMTimeGetSeconds(progressTime)
               let secondsText = String(format: "%2d", Int(seconds) % 60)
               let minutesText = String(format: "%02d",Int(seconds) / 60)
               self.lblCurrentTime.text = "\(minutesText):\(secondsText)"
                
                if !self.isSkiping{
                    if let duration = self.player?.currentItem?.duration {
                        let durationSeconds = CMTimeGetSeconds(duration)
                        self.slider.value = Float(seconds / durationSeconds)
                    }
                }
                
            })
       }
               
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    
        if keyPath == "currentItem.loadedTimeRanges" {
            indicator.stopAnimating()
            controlsContainer.backgroundColor = .clear
            playToggle.isHidden = false
            isPlaying = true
            
            
            if let duration = player?.currentItem?.duration {
                
                let seconds = CMTimeGetSeconds(duration)
                let secondsText = Int(seconds) % 60
                let minutesText = String(format: "%02d",Int(seconds) / 60)
                self.lblVideoLength.text = "\(minutesText):\(secondsText)"
            }
            
        }
    }
    
    override func layoutSublayers(of layer: CALayer) {
        
        layer.sublayers?.forEach({ (sl) in
            sl.frame = layer.bounds
        })
    }
    
}
