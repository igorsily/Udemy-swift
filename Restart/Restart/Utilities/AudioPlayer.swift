//
//  AudioPlayer.swift
//  Restart
//
//  Created by Sqlink on 6/27/23.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String){
    
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path));
            audioPlayer?.play()
            
        } catch {
            print("Erro play sound")
        }
    }
    
}
