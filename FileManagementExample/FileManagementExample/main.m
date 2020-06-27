//
//  main.m
//  FileManagementExample
//
//  Created by Megan Yu on 6/18/20.
//  Copyright © 2020 Megan Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

/* Method to get employees.plist path */
NSString* getPropertyListPath() {
    NSURL *projectsDir = [[NSURL fileURLWithPath:NSHomeDirectory()] URLByAppendingPathComponent:@"Projects/objective-c-examples/FileManagementExample/sample"];
    NSURL *plist = [projectsDir URLByAppendingPathComponent:@"employees.plist"];
    return plist.path;
}

void createAndArchiveObjects(NSString *filePath) {
    // create employee object
    Employee *bob = [[Employee alloc] init];
    [bob setFirstName:@"Bob"];
    [bob setLastName:@"Kim"];
    [bob setEmployeeNumber:12345];
    [bob setHireDate:[NSDate date]];
    
    // create another, using dot syntax for properties
    Employee *anna = [[Employee alloc] init];
    anna.firstName = @"Anna";
    anna.lastName = @"Lee";
    anna.employeeNumber = 45678;
    anna.hireDate = [NSDate date];
    
    NSLog(@"First Employee: \n%@", [bob description]);
    NSLog(@"Second Employee: \n%@", anna); // note that we didn't call description here, but it has the same output as above line. This is because description is called by default when you use %@ for an object.
    
    // create an array to hold multiple employees
    NSMutableArray *employees = [[NSMutableArray alloc] init];
    [employees addObject:bob];
    [employees addObject:anna];
    
    // archive the entire array: below is deprecated!!
    [NSKeyedArchiver archiveRootObject:employees toFile:filePath]; // saves as plist file by default
     
    // NOTE: array can only archive itself as long as all objects inside can also archive themselves
    NSLog(@"Objects created and archived!");
}

void unarchiveSavedObjects(NSString *filePath) {
    NSMutableArray *employees = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    for (Employee *e in employees) {
        NSLog(@"The unarchived, reconstitued object is %@", e);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // most file operations are done with the NSFileManager class
        NSFileManager *fileManager = [[NSFileManager alloc] init];
        NSFileManager *fileManager2 = [NSFileManager defaultManager]; // this is actually the recommended way to initialize NSFileManager, stops us from making multiple NSFileManagers and just provides a shared one
        
        NSString *simplePath = @"/Users/myu/Projects/objective-c-examples/FileManagementExample/sample/HelloWorld.txt";
        
        // check if file exists
        if ([fileManager fileExistsAtPath:simplePath]) {
            NSLog(@"That file exists");
        } else {
            NSLog(@"That file doesn't exist");
            return 1;
        }
        
        // get an NSDictionary of attributes
        NSDictionary *fileAttributes = [fileManager
                                        attributesOfItemAtPath:simplePath
                                        error:nil];
        for (NSString *key in fileAttributes) {
            NSLog(@"The attribute key is: %@ and the value is %@", key, fileAttributes[key]);
        }
        
        // the above method of specifying a file path is not great because it's specific to a particular computer's filesystem
        // better way! more sensitive to locale and different installations:
        
        NSString *homeDirectory = NSHomeDirectory();
        NSString *desktopPath = [homeDirectory stringByAppendingPathComponent:@"Desktop"];
        NSLog(@"Calling NSHomeDirectory() results in %@", homeDirectory);
        NSLog(@"Desktop path is: %@", desktopPath);
        
        // finding the URL for the Documents directory on this computer
        NSURL *documentDir = [fileManager URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        NSLog(@"The fileManager method returned: %@", documentDir);
        
        // NSURL is preferred over NSString based file paths. They're faster and have better error checking. And URLs are used in more recent and powerful classes - some classes only use URLs.
        // format --> <scheme>://<domain>/<path>
        // example --> file://localhost/Users/Megan/File.txt
        // Leaving the domain out would assuming we are on the local machine: file:///Users/Megan/File.txt (notice 3 /'s)
        
        // Converting a string to a URL
        NSURL *myURL = [NSURL fileURLWithPath:desktopPath];
        NSLog(@"Desktop URL is: %@", myURL);
        
        // Converting a URL to a string
        NSLog(@"Desktop filepath is: %@", [myURL absoluteString]);
        
        
        /* READING & WRITING STRINGS */
        
        // project files directory (specific to my setup)
        NSURL *projectsDir = [[NSURL fileURLWithPath:NSHomeDirectory()] URLByAppendingPathComponent:@"Projects/objective-c-examples/FileManagementExample/sample"];
        
        // create a full path, assuming we have a file sample.txt
        NSURL *full = [projectsDir URLByAppendingPathComponent:@"HelloWorld.txt"];
        
        // load the string
        NSMutableString *content = [[NSMutableString alloc] initWithContentsOfURL:full encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"The string is: %@", content);
        
        // new string
        [content appendString:@"CHANGED!"];
        
        // destination URL
        NSURL *saveLocation = [projectsDir URLByAppendingPathComponent:@"saved.txt"];
        
        // save to file
        [content writeToURL:saveLocation atomically:YES encoding:NSUTF8StringEncoding error:nil];
        
        
        /* ARCHIVING & UNARCHIVING OBJECTS */
        // useful classes:
        // 1. NSKeyedArchiver - encodes objects to files
        // 2. NSKeyedUnarchiver - decodes objects from files
        
        NSString *path = getPropertyListPath();
        
        // check if file exists
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            // YES, the file's there - load them in
            unarchiveSavedObjects(path);
        } else {
            // NO there's no plist file - so create it
            createAndArchiveObjects(path);
        }
    }
    return 0;
}
