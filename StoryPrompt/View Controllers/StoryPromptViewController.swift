//
//  StoryPromptViewController.swift
//  StoryPrompt
//
//  Created by Hiago Santos Martins Dias on 24/09/22.
//

import UIKit

class StoryPromptViewController: UIViewController {
    

    @IBOutlet weak var StoryPromptTextView: UITextView!
    
    var storyPrompt: StoryPromptEntry?
    var isNewStoryPrompt = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        StoryPromptTextView.text = storyPrompt?.description
        if isNewStoryPrompt {
            let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveStoryPrompt))
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelStoryPrompt))
            navigationItem.rightBarButtonItem = saveButton
            navigationItem.leftBarButtonItem = cancelButton
            
            
        }

       
    }
    
    
    

    @objc func cancelStoryPrompt() {
        performSegue(withIdentifier: "CancelStoryPrompt", sender: nil)
    }
    
    @objc func saveStoryPrompt() {
        NotificationCenter.default.post(name: .StoryPromptSaved, object:  storyPrompt)
        performSegue(withIdentifier: "SaveStoryPrompt", sender: nil)
    }
    
    

}


extension Notification.Name {
    static let StoryPromptSaved = Notification.Name("StoryPromptSave")
}
