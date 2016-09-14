//
//  Person.h
//  Very-simple-address-book
//
//  Created by 丁云川 on 16/9/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    NSString *_name;
    NSString *_phone;
}



@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phone;
@end
