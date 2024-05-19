//
//  ViewController.swift
//  EmotionDiary
//
//  Created by 권대윤 on 5/17/24.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - Properties
    
    @IBOutlet var backImageView: UIImageView!
    
    @IBOutlet var happyButton: UIButton!
    @IBOutlet var loveButton: UIButton!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var embarrassedButton: UIButton!
    @IBOutlet var upsetButton: UIButton!
    @IBOutlet var depressedButton: UIButton!
    @IBOutlet var boredButton: UIButton!
    @IBOutlet var anxiousButton: UIButton!
    @IBOutlet var frustratedButton: UIButton!
    
    @IBOutlet var happyLabel: UILabel!
    @IBOutlet var loveLabel: UILabel!
    @IBOutlet var likeLabel: UILabel!
    @IBOutlet var embarrassedLabel: UILabel!
    @IBOutlet var upsetLabel: UILabel!
    @IBOutlet var depressedLabel: UILabel!
    @IBOutlet var boredLabel: UILabel!
    @IBOutlet var anxiousLabel: UILabel!
    @IBOutlet var frustratedLabel: UILabel!
    
    lazy var labels: [UILabel] = [happyLabel, loveLabel, likeLabel, embarrassedLabel, upsetLabel, depressedLabel, boredLabel, anxiousLabel, frustratedLabel]
    
    lazy var labelNames: [UILabel: String] = [happyLabel: "happyLabel", loveLabel: "loveLabel", likeLabel: "likeLabel", embarrassedLabel: "embarrassedLabel", upsetLabel: "upsetLabel", depressedLabel: "depressedLabel", boredLabel: "boredLabel", anxiousLabel: "anxiousLabel", frustratedLabel: "frustratedLabel"]
    
    var emotionTexts: [String] = ["행복해 ", "사랑해 ", "좋아해 ", "당황해 ", "속상해 ", "우울해 ", "심심해 ", "불안해 ", "좌절해 "]
    
    var labelCount: [String: Int] = ["happyLabel": 0, "loveLabel": 0, "likeLabel": 0, "embarrassedLabel": 0, "upsetLabel": 0, "depressedLabel": 0, "boredLabel": 0, "anxiousLabel": 0, "frustratedLabel": 0]
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Configurations
    
    func configureUI() {
        setupUIImageView()
        setupNavi()
        setupUIButton()
        setupUILabel()
    }
    
    func setupUIImageView() {
        backImageView.image = UIImage(named: "background")
        backImageView.contentMode = .scaleAspectFill
    }
    
    func setupNavi() {
        self.title = "감정 다이어리"
        
        let listBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(listBarButtonTapped))
        listBarButtonItem.tintColor = .label
        self.navigationItem.leftBarButtonItem = listBarButtonItem
    }
    
    func setupUIButton() {
        configureEmotionButton(happyButton, imageName: "slime1")
        configureEmotionButton(loveButton, imageName: "slime2")
        configureEmotionButton(likeButton, imageName: "slime3")
        configureEmotionButton(embarrassedButton, imageName: "slime4")
        configureEmotionButton(upsetButton, imageName: "slime5")
        configureEmotionButton(depressedButton, imageName: "slime6")
        configureEmotionButton(boredButton, imageName: "slime7")
        configureEmotionButton(anxiousButton, imageName: "slime8")
        configureEmotionButton(frustratedButton, imageName: "slime9")
    }
    
    func setupUILabel() {
        configureLabel(happyLabel, index: 0, labelName: "happyLabel")
        configureLabel(loveLabel, index: 1, labelName: "loveLabel")
        configureLabel(likeLabel, index: 2, labelName: "likeLabel")
        configureLabel(embarrassedLabel, index: 3, labelName: "embarrassedLabel")
        configureLabel(upsetLabel, index: 4, labelName: "upsetLabel")
        configureLabel(depressedLabel, index: 5, labelName: "depressedLabel")
        configureLabel(boredLabel, index: 6, labelName: "boredLabel")
        configureLabel(anxiousLabel, index: 7, labelName: "anxiousLabel")
        configureLabel(frustratedLabel, index: 8, labelName: "frustratedLabel")
    }
    
    func configureEmotionButton(_ button: UIButton, imageName: String) {
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    func configureLabel(_ label: UILabel, index: Int, labelName: String) {
        label.text = emotionTexts[index] + String(labelCount[labelName] ?? 0)
        label.textAlignment = .center
    }
    
    //MARK: - Functions
    
    @objc func listBarButtonTapped() {
        print(#function)
    }
    
    func updateLabelCount(labelName: String) {
        guard var count = labelCount[labelName] else {return}
        
        count += 1
        labelCount[labelName] = count
    }
    
    func updateLabelText(index: Int) {
        let label = labels[index]
        
        guard let labelName = labelNames[label] else {return}
        
        updateLabelCount(labelName: labelName)
        
        guard let count = labelCount[labelName] else {return}
        
        var text = emotionTexts[index]
        text += String(count)
        label.text = text
    }
    
    @IBAction func emotinButtonTapped(_ sender: UIButton) {
        updateLabelText(index: sender.tag)
    }
}

