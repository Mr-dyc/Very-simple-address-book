//
//  Contact.h
//  Very-simple-address-book
//
//  Created by 丁云川 on 16/9/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject
{
    NSMutableDictionary *_dictionary;
}
- (void)open;
//菜单
- (void)showMenu;

@end
