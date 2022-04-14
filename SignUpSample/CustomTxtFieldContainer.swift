//
//  CustomTxtFieldContainer.swift
//  SignUpSample
//
//  Created by Eido Goya on 2022/04/14.
//

import UIKit

class CustomTxtFieldContainer: UIView {
    var guideLabel: UILabel!
    var textField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        guideLabel = {
            let label = UILabel()
            return label
        }()
        textField = {
            let textField = UITextField()
            textField.placeholder = "Title *"
            textField.backgroundColor = .white
            
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            
            textField.autocorrectionType = UITextAutocorrectionType.no
            
            textField.font = UIFont.systemFont(ofSize: 13)
            
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            
            textField.clearButtonMode = UITextField.ViewMode.whileEditing;
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            
            return textField
        }()
        
        addSubview(guideLabel)
        addSubview(textField)
        
        guideLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.left.equalToSuperview().inset(10)
        }
        textField.snp.makeConstraints {
            $0.top.equalTo(guideLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().inset(10)
            $0.right.equalToSuperview().inset(10)
            $0.height.equalTo(60)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
    
}
