//
//  LoginView.m
//  TemplateFromH
//
//  Created by January on 2019/5/21.
//  Copyright © 2019 January. All rights reserved.
//

#import "LoginView.h"
#import "AppHeader.h"
@interface LoginView ()
@property (nonatomic, strong) UITextField * accountTextField;
@property (nonatomic, strong) UITextField * passwordTextField;
@property (nonatomic, strong) UIButton    * loginBtn;
@end

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = YES;
        [self initializationView];
    }
    return self;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.accountTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    
}
// 初始化界面
- (void) initializationView
{
    // 账号
    UITextField *accountTextField = [[UITextField alloc]init];
    [self addSubview:accountTextField];
    accountTextField.placeholder = @"输一下你认为对的账号";
    accountTextField.font = [UIFont systemFontOfSize:AutoFitCG(17)];
    accountTextField.backgroundColor = [UIColor clearColor];
    accountTextField.tintColor = [UIColor colorWithHex:JThemeColor];
    accountTextField.keyboardType = UIKeyboardTypePhonePad;
    accountTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _accountTextField = accountTextField;
    
    [accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(AutoFitCG(20));
        make.right.mas_equalTo(-AutoFitCG(20));
        make.bottom.mas_equalTo(AutoFitCG(-100));
        make.height.mas_equalTo(AutoFitCG(50));
    }];
    
    // 线
    UIView *accountLine = [UIView new];
    [self addSubview:accountLine];
    accountLine.backgroundColor = [UIColor colorWithHexString:JThemeColor];
    [accountLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(accountTextField.mas_bottom).offset(AutoFitCG(3));
        make.left.mas_equalTo(accountTextField.mas_left);
        make.right.mas_equalTo(accountTextField.mas_right);
        make.height.mas_equalTo(1);
    }];
    
    // 密码
    UITextField *passwordTextField = [[UITextField alloc]init];
    [self addSubview:passwordTextField];
    passwordTextField.placeholder = @"输入一下你认为对的密码";
    passwordTextField.font = [UIFont systemFontOfSize:AutoFitCG(17)];
    passwordTextField.backgroundColor =[UIColor clearColor];
    passwordTextField.tintColor = [UIColor colorWithHex:JThemeColor];
    passwordTextField.keyboardType = UIKeyboardTypeASCIICapable;
    passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwordTextField = passwordTextField;
    
    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(accountTextField.mas_left);
        make.right.mas_equalTo(accountTextField.mas_right);
        make.top.mas_equalTo(accountTextField.mas_bottom).offset(AutoFitCG(10));
        make.height.mas_equalTo(AutoFitCG(50));
    }];
    
    // 线
    UIView *passwordLine = [UIView new];
    [self addSubview:passwordLine];
    passwordLine.backgroundColor = [UIColor colorWithHexString:JThemeColor];
    [passwordLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passwordTextField.mas_bottom).offset(AutoFitCG(3));
        make.left.mas_equalTo(passwordTextField.mas_left);
        make.right.mas_equalTo(passwordTextField.mas_right);
        make.height.mas_equalTo(1);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
