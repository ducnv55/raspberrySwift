//
//  HomeViewController.swift
//  Led
//
//  Created by Nguyen Viet Duc on 2/8/17.
//  Copyright © 2017 TMH. All rights reserved.
//

import UIKit
import Alamofire
import Speech

class HomeViewController: UIViewController {
    
    // MARK: Properties
    var specificIp: String = ""
    @IBOutlet weak var voiceButton: UIButton!
    @IBOutlet weak var voiceTextLabel: UILabel!
    
    let audioEngine = AVAudioEngine()
    let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?

    override func viewDidLoad() {
        super.viewDidLoad()
        voiceTextLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ledDidPressed(_ sender: Any) {
        Alamofire.request(Constant.Url.baseUrl + specificIp + Constant.Url.tapURL).responseJSON { response in
            if let JSON = response.result.value {
                print(JSON)
            } else {
                print("Error: \(response)")
            }
        }
    }
    
    @IBAction func voiceRecognizeButtonIsClicked(_ sender: Any) {
        self.recordAndRecognizeSpeech()
    }
    
    func recordAndRecognizeSpeech() {
        guard let node = audioEngine.inputNode else { return }
        let recordingFormat = node.outputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, audioTime) in
            self.request.append(buffer)
        }
        
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            return print(error)
        }
        
        guard let myRecognizer = SFSpeechRecognizer() else {
            // recognizer is not support for this locale
            return
        }
        
        if !myRecognizer.isAvailable {
            // recognizer is available right now
            return
        }
        
        recognitionTask = speechRecognizer?.recognitionTask(with: request, resultHandler: { (result, error) in
            if let result = result {
                let bestString = result.bestTranscription.formattedString
                self.voiceTextLabel.text = bestString
            } else {
                print(error)
            }
        })
    }
}
