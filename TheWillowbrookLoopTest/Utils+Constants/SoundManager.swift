//
//  SoundManager.swift
//  WillowbrookLoopTest
//
//  Created by Dan Beers on 6/21/25.
//

import AVKit
import SwiftUI

//protocol SoundControl {
//    func playMusicPlayer(data: Data)
//    func stopMusicPlayer()
//    func playEffectPlayer1(data: Data)
//    func stopEffectPlayer1()
//    func playAmbiencePlayer1(data: Data)
//    func stopAmbiencePlayer1()
//
//}

@Observable
class SoundManager
{
    var musicPlayer: AVAudioPlayer?
    var effectPlayer1: AVAudioPlayer?
    var effectPlayer2: AVAudioPlayer?
    var ambiencePlayer1: AVAudioPlayer?
    var ambiencePlayer2: AVAudioPlayer?
    
    func playMusicPlayer(data: Data)
    {
        do
        {
            musicPlayer = retrieveAVAudioPlayer(data: data)
            musicPlayer?.play()
        }
    }
    
    func stopMusicPlayer()
    {
        if musicPlayer != nil
        {
            musicPlayer!.stop()
        }
    }
    
    func playEffectPlayer1(data: Data)
    {
        do
        {
            effectPlayer1 = retrieveAVAudioPlayer(data: data)
            effectPlayer1?.play()
        }
    }
    
    func stopEffectPlayer1()
    {
        if effectPlayer1 != nil
        {
            effectPlayer1!.stop()
        }
    }
    
    func playAmbiencePlayer1(data: Data)
    {
        do
        {
            ambiencePlayer1 = retrieveAVAudioPlayer(data: data)
            ambiencePlayer1?.play()
        }
    }
    
    func stopAmbiencePlayer1()
    {
        if ambiencePlayer1 != nil
        {
            ambiencePlayer1!.stop()
        }
    }
    
    func retrieveAVAudioPlayer(data: Data) -> AVAudioPlayer? {
        do
        {
            return try AVAudioPlayer(data: data, fileTypeHint: "mp3")
            
        }
        catch
        {
            print(error.localizedDescription)
            return nil
        }
    }
}
