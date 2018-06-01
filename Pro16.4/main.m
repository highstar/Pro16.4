//
//  main.m
//  Pro16.4
//
//  Created by Gao Xing on 2018/5/31.
//  Copyright © 2018年 Gao Xing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *path;
        NSFileManager *fm;
        NSDirectoryEnumerator *dirEnum;
        NSArray *dirArray;
        BOOL flag;
        
        // Need to create an instance of the file manager
        
        fm = [NSFileManager defaultManager];
        
        // Get current working directory path
        
        path = [fm currentDirectoryPath];
        
        // Enumerate the directory
        dirEnum = [fm enumeratorAtPath:path];
        
        NSLog(@"Contents of %@", path);
        
        while ((path = [dirEnum nextObject]) != nil) {
            NSLog(@"%@", path);
            
            [fm fileExistsAtPath:path isDirectory:&flag];
            
            if (flag == YES)
                [dirEnum skipDescendants];
        }
        
        
        // Another way to enumerate a directory
        dirArray = [fm contentsOfDirectoryAtPath:[fm currentDirectoryPath] error:NULL];
        NSLog(@"Contents using contentsOfDirectoryAtPath:error:");
        
        for (path in dirArray)
            NSLog(@"%@", path);
    }
    return 0;
}
