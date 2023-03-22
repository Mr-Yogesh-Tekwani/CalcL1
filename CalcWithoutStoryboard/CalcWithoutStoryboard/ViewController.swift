//
//  ViewController.swift
//  CalcWithoutStoryboard
//
//  Created by Yogesh Tekwani on 3/19/23.
//

import UIKit

enum Operations{
    case add
    case divide
    case sub
    case multiply
}

class ViewController: UIViewController {
    
    var savedOperation : Operations?
    var storedButtonValue = 0
    var operationPressed: Bool = false
    
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
        firstStackView.addArrangedSubview(createButton(title: "%", color: .gray, action: #selector(operationAction)))
        firstStackView.addArrangedSubview(createButton(title: "+/-", color: .gray, action: #selector(operationAction)))
        firstStackView.addArrangedSubview(createButton(title: "AC", color: .gray, action: #selector(operationAction)))
        firstStackView.addArrangedSubview(createButton(title: "÷", color: .orange, action: #selector(operationAction)))
        
        mainStackView.addArrangedSubview(firstStackView)
        
        secondStackView.addArrangedSubview(createButton(title: "7"))
        secondStackView.addArrangedSubview(createButton(title: "8"))
        secondStackView.addArrangedSubview(createButton(title: "9"))
        secondStackView.addArrangedSubview(createButton(title: "X", color: .orange, action: #selector(operationAction)))
        
        mainStackView.addArrangedSubview(secondStackView)
        
        thirdStackView.addArrangedSubview(createButton(title: "4"))
        thirdStackView.addArrangedSubview(createButton(title: "5"))
        thirdStackView.addArrangedSubview(createButton(title: "6"))
        thirdStackView.addArrangedSubview(createButton(title: "-", color: .orange, action: #selector(operationAction)))
        
        mainStackView.addArrangedSubview(thirdStackView)
        
        fourthStackView.addArrangedSubview(createButton(title: "1"))
        fourthStackView.addArrangedSubview(createButton(title: "2"))
        fourthStackView.addArrangedSubview(createButton(title: "3"))
        fourthStackView.addArrangedSubview(createButton(title: "+", color: .orange, action: #selector(operationAction)))
        
        mainStackView.addArrangedSubview(fourthStackView)
        
        let tempStack = UIStackView()
        tempStack.axis = .horizontal
        tempStack.alignment = .fill
        tempStack.distribution = .fillEqually
        tempStack.addArrangedSubview(createButton(title: "."))
        tempStack.addArrangedSubview(createButton(title: "=", color: .orange, action: #selector(operationAction)))
        fifthStackView.addArrangedSubview(createButton(title: "0"))
        fifthStackView.addArrangedSubview(tempStack)
        
        mainStackView.addArrangedSubview(fifthStackView)
        
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

    func createButton(title:String,
                      color:UIColor = .blue,
                      action: Selector = #selector(numPadAction)) -> UIButton{
        
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 33)
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    
    @objc func numPadAction(_ sender: UIButton){
        
        if operationPressed{
            operationPressed = false
            label.text = "0"
        }
        
        let prevVal = label.text == "0" ? "" : (label.text ?? "")
        label.text = prevVal + (sender.titleLabel?.text ?? "")
        
    }
    
    
    
    @objc func operationAction(_ sender: UIButton){
        guard let text = sender.titleLabel?.text,
              let firstValueString = label.text,
              let firstValueInt = Int(firstValueString)
        
        else{return}
        
        switch text{
        case "+":
            savedOperation = .add
            storedButtonValue = firstValueInt
            operationPressed = true
            
        case "-":
            savedOperation = .sub
            storedButtonValue = firstValueInt
            operationPressed = true
            
        case "X":
            savedOperation = .multiply
            storedButtonValue = firstValueInt
            operationPressed = true
            
        case "÷":
            savedOperation = .divide
            storedButtonValue = firstValueInt
            operationPressed = true
            
        case "+/-":
            label.text = String(firstValueInt * -1)
            
        case "%":
            label.text = String(firstValueInt * 1/100)
            
            
        case "AC":
            label.text = "0"
            
        case "=":
            handleResult(secondValueInt: firstValueInt, firstValueInt: storedButtonValue)
            
        default:
            return
        }
        operationPressed = true
    }
    
    
    func handleResult(secondValueInt: Int,firstValueInt : Int){
    guard let savedOperation = savedOperation else {return}
    
        switch savedOperation {
        case .add:
            label.text = String(describing: firstValueInt+secondValueInt)
        case .divide:
            label.text = String(describing: firstValueInt/secondValueInt)
        case .sub:
            label.text = String(describing: firstValueInt-secondValueInt)
        case .multiply:
            label.text = String(describing: firstValueInt*secondValueInt)
        }
        
        print(firstValueInt)
        print(savedOperation)
        print(secondValueInt)
    
        storedButtonValue = 0
        
    }
    
}
