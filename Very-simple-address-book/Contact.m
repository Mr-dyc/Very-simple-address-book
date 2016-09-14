//
//  Contact.m
//  Very-simple-address-book
//
//  Created by 丁云川 on 16/9/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "Contact.h"
#import "KeyboardScanner.h"
#import "CManager.h"
#import "Person.h"
@implementation Contact

- (instancetype)init

{
    self = [super init];
    if (self) {
        _dictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)open{
    int display = 0;
    do {
        [self showMenu];
        display = [KeyboardScanner readIntFromKeyboard];
        switch (display) {
            case 1:
                [self addLinker];
                break;
            case 2:
                [self removeLinker];
                break;
            case 3:
                [self modifyLinker];
                break;
            case 4:
                [self showInformation];
                break;
            case 5:
                [self quitLogin];
                break;
                
            default:
                break;
        }
        if (display == 5) {
            break;
        }
    } while (1);
}

- (void)showMenu{
    
    NSLog(@"请选择以下功能：");
    NSLog(@"1、添加联系人");
    NSLog(@"2、移除联系人");
    NSLog(@"3、修改联系人信息");
    NSLog(@"4、显示联系人列表");
    NSLog(@"5、退出系统");
    
}

//添加联系人
- (void)addLinker{
    NSLog(@"请输入你的姓名：");
    NSString *name = [KeyboardScanner readStringFromKeyboard];
    //截取首字母
    NSString *firstLetter = [self cellFromName:name];
    
    BOOL flag;
    NSString *phone = @"";
    do {
        NSLog(@"请输入你的手机号码：");
        phone = [KeyboardScanner readStringFromKeyboard];
        
        flag = [CManager validateMobile:phone];
    } while (!flag);
    
    
    NSMutableArray *valueArray = [NSMutableArray arrayWithArray:_dictionary[firstLetter]];
    
    Person *person = [[Person alloc] init];
    person.name = name;
    person.phone = phone;
    
    [valueArray addObject:person];
    
    NSLog(@"value = %@",valueArray);
    [_dictionary setObject:valueArray forKey:firstLetter];
    NSLog(@"_dic = %@",_dictionary);
    
}
//移除
- (void)removeLinker{
    NSLog(@"请输入你要移除的这个人姓名：");
    NSString *removeName = [KeyboardScanner readStringFromKeyboard];
    //判断输入的人名在字典中是否有
    NSString *key = [self cellFromName:removeName];
    NSMutableArray *array = _dictionary[key];
    
    Person *person = [self searchOfName:array name:removeName];
    
    [array removeObject:person];
    
    
    [_dictionary setObject:array forKey:key];
}

//修改
- (void)modifyLinker{
    
    NSLog(@"请输入你要修改的这个人姓名：");
    NSString *modifyName = [KeyboardScanner readStringFromKeyboard];
    //判断输入的人名在字典中是否有
    NSString *key = [self cellFromName:modifyName];
    NSMutableArray *array = _dictionary[key];
    
    Person *person = [self searchOfName:array name:modifyName];
    
    [array removeObject:person];
    
    NSLog(@"input your phone number:");
    BOOL flag;
    NSString *phone = @"";
    do {
        NSLog(@"请输入你的手机号码：");
        phone = [KeyboardScanner readStringFromKeyboard];
        
        flag = [CManager validateMobile:phone];
    } while (!flag);
    
    
    Person *person1 = [[Person alloc] init];
    person1.name = modifyName;
    person1.phone = phone;
    [array addObject:person1];
    
    [_dictionary setObject:array forKey:key];
}

//退出登录
- (void)quitLogin{
    NSLog(@"quit");
}

//查询名字是否相同
- (Person *)searchOfName:(NSArray *)array name:(NSString *)removeName{
    for (int i = 0; i < array.count; i ++) {
        if ([((Person *)array[i]).name isEqualToString:removeName]) {
            return array[i];
        }
    }
    return nil;
}

//截取首字母
- (NSString *)cellFromName:(NSString *)name{
    return [[name substringToIndex:1] uppercaseString];
}

//显示通讯录
- (void)showInformation{
    if (_dictionary.count == 0) {
        NSLog(@"没有任何联系人");
        return;
    }else{
        NSLog(@"%@",_dictionary);
    }
}
@end
