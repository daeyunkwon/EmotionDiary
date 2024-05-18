//
//  ViewController.swift
//  EmotionDiary
//
//  Created by 권대윤 on 5/17/24.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - Properties
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button8: UIButton!
    @IBOutlet var button9: UIButton!
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var label6: UILabel!
    @IBOutlet var label7: UILabel!
    @IBOutlet var label8: UILabel!
    @IBOutlet var label9: UILabel!
    
    lazy var labels: [UILabel] = [label1, label2, label3, label4, label5, label6, label7, label8, label9]
    
    lazy var labelNames: [UILabel: String] = [label1: "label1", label2: "label2", label3: "label3", label4: "label4", label5: "label5", label6: "label6", label7: "label7", label8: "label8", label9: "label9"]
    
    var emotionTexts: [String] = ["행복해 ", "사랑해 ", "좋아해 ", "당황해 ", "속상해 ", "우울해 ", "심심해 ", "불안해 ", "좌절해 "]
    
    var labelCount: [String: Int] = ["label1": 0, "label2": 0, "label3": 0, "label4": 0, "label5": 0, "label6": 0, "label7": 0, "label8": 0, "label9": 0]
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        configureUI()
    }
    
    //MARK: - Configurations
    
    func setupNavi() {
        self.title = "감정 다이어리"
        
        let listBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: self, action: #selector(listBarButtonTapped))
        listBarButtonItem.tintColor = .black
        self.navigationItem.leftBarButtonItem = listBarButtonItem
    }
    
    func configureUI() {
        configureEmotionButton(button1, imageName: "slime1")
        configureEmotionButton(button2, imageName: "slime2")
        configureEmotionButton(button3, imageName: "slime3")
        configureEmotionButton(button4, imageName: "slime4")
        configureEmotionButton(button5, imageName: "slime5")
        configureEmotionButton(button6, imageName: "slime6")
        configureEmotionButton(button7, imageName: "slime7")
        configureEmotionButton(button8, imageName: "slime8")
        configureEmotionButton(button9, imageName: "slime9")
        
        configureLabel(label1, index: 0, labelName: "label1")
        configureLabel(label2, index: 1, labelName: "label2")
        configureLabel(label3, index: 2, labelName: "label3")
        configureLabel(label4, index: 3, labelName: "label4")
        configureLabel(label5, index: 4, labelName: "label5")
        configureLabel(label6, index: 5, labelName: "label6")
        configureLabel(label7, index: 6, labelName: "label7")
        configureLabel(label8, index: 7, labelName: "label8")
        configureLabel(label9, index: 8, labelName: "label9")
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
        
        guard var count = labelCount[labelName] else {return}
        
        var text = emotionTexts[index]
        text += String(count)
        label.text = text
    }
    
    @IBAction func emotinButtonTapped(_ sender: UIButton) {
        updateLabelText(index: sender.tag)
    }
}

