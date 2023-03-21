//
//  ViewController.swift
//  CalcWithoutStoryboard
//
//  Created by Yogesh Tekwani on 3/19/23.
//

import UIKit

class ViewController: UIViewController {
    
    let mainStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.axis = .vertical
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        mainstack.translatesAutoresizingMaskIntoConstraints = false
        return mainstack
    }()
    
    let firstStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.axis = .horizontal
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        
        return mainstack
    }()
    
    let secondStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.axis = .horizontal
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        
        return mainstack
    }()
    
    let thirdStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.axis = .horizontal
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        
        
        return mainstack
    }()
    
    let fourthStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.axis = .horizontal
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        
        
        return mainstack
    }()
    
    let fifthStackView: UIStackView = {
        let mainstack = UIStackView()
        mainstack.alignment = .fill
        mainstack.distribution = .fillEqually
        mainstack.spacing = 1
        mainstack.axis = .horizontal
        
        return mainstack
    }()
    
    
    let label : UILabel = {
        let l = UILabel()
        l.text = "0"
        l.backgroundColor = .black
        l.textAlignment = .right
        l.textColor = .white
        l.font = l.font.withSize(50)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        mainStackView.addArrangedSubview(label)
        firstStackView.addArrangedSubview(createButton(title: "%", color: .gray))
        firstStackView.addArrangedSubview(createButton(title: "+/-", color: .gray))
        firstStackView.addArrangedSubview(createButton(title: "AC", color: .gray))
        firstStackView.addArrangedSubview(createButton(title: "÷", color: .orange))
        
        mainStackView.addArrangedSubview(firstStackView)
        
        secondStackView.addArrangedSubview(createButton(title: "7"))
        secondStackView.addArrangedSubview(createButton(title: "8"))
        secondStackView.addArrangedSubview(createButton(title: "9"))
        secondStackView.addArrangedSubview(createButton(title: "X", color: .orange))
        
        mainStackView.addArrangedSubview(secondStackView)
        
        thirdStackView.addArrangedSubview(createButton(title: "4"))
        thirdStackView.addArrangedSubview(createButton(title: "5"))
        thirdStackView.addArrangedSubview(createButton(title: "6"))
        thirdStackView.addArrangedSubview(createButton(title: "-", color: .orange))
        
        mainStackView.addArrangedSubview(thirdStackView)
        
        fourthStackView.addArrangedSubview(createButton(title: "1"))
        fourthStackView.addArrangedSubview(createButton(title: "2"))
        fourthStackView.addArrangedSubview(createButton(title: "3"))
        fourthStackView.addArrangedSubview(createButton(title: "+", color: .orange))
        
        mainStackView.addArrangedSubview(fourthStackView)
        
        let tempStack = UIStackView()
        tempStack.axis = .horizontal
        tempStack.alignment = .fill
        tempStack.distribution = .fillEqually
        tempStack.addArrangedSubview(createButton(title: "."))
        tempStack.addArrangedSubview(createButton(title: "=", color: .orange))
        fifthStackView.addArrangedSubview(createButton(title: "0"))
        fifthStackView.addSubview((tempStack))
        
        // Constraints
        
        self.view.addSubview(mainStackView)
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
        ])
    }

    func createButton(title:String, color:UIColor = .blue) -> UIButton{
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 33)
        return button
    }
}
