//
//  KeyboardScanner.m
//  Very-simple-address-book
//
//  Created by 丁云川 on 16/9/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "KeyboardScanner.h"

@implementation KeyboardScanner

//Read a string from the keyboard (max size: 2048 characters)
+(NSString*)readStringFromKeyboard
{
    char input[2048];
    scanf("%s", (char*)&input);
    //Convert from a char* to an NSString, using the ASCII encoding scheme.
    return [NSString stringWithCString:(const char*)&input encoding:NSASCIIStringEncoding];
}

//Read an int from the keyboard
+(int)readIntFromKeyboard
{
    int input;
    scanf("%d", &input);
    return input;
}

//Read a double from the keyboard
+(double)readDoubleFromKeyboard {
    double input;
    scanf("%lf", &input);
    return input;
}

@end
