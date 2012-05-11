#import <Foundation/Foundation.h>

#import "Observee.h"
#import "MySubClass.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Observee *observee = [[Observee alloc] init];
        
        MySubClass *a = [[MySubClass alloc] initWithObservee:observee];
        
        // trigger a change
        observee.changingValue = 1;
        
        
        
        
        // do something to a just to keep the compiler quiet. Nothing to see here. Move on!
        a = a;
    }
    return 0;
}

