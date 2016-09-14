//
//  main.m
//  Very-simple-address-book
//
//  Created by 丁云川 on 16/9/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*
         模拟一个通讯录过程；
         @"请选择以下功能："
         1、添加联系人"
         2、移除联系人"
         3、修改联系人信息
         4、显示联系人列表"
         5、退出系统"
         要求：创建一个联系人类，其实现过程，在实例方法中，不能将过程写在main函数中；
         提示：用字典实现，输入联系人姓名使用英文；将首字母作为key，将联系人作为value进行存储；
         */
        
        Contact *contact = [[Contact alloc] init];
        [contact open];
        
        
        
        
      
        
    }
    return 0;
}
