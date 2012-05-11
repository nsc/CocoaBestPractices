#import "MySuperClass.h"

// observation context for super class
static int kChangingValueContext;
static NSString *kChangingValueObservationKey = @"changingValue";


@implementation MySuperClass
@synthesize observee = _observee;
- (id)initWithObservee:(Observee *)observee
{
    self = [super init];
    
    if (self != nil)
    {
        self.observee = observee;
    }
    
    return self;
}



- (void)dealloc
{
    // set observee to nil explicitly, so our setter is triggered and
    // our observation removed
    self.observee = nil;
}



// setup our observation in the setter, so it's removed properly from old observees
- (void)setObservee:(Observee *)observee
{
    // remove observation from old observee
    if (_observee) {
        [_observee removeObserver:self forKeyPath:kChangingValueObservationKey context:&kChangingValueContext];
    }
    
    _observee = observee;
    
    // setup observation for new observee
    if (_observee) {
        [_observee addObserver:self forKeyPath:kChangingValueObservationKey options:0 context:&kChangingValueContext];
    }
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == &kChangingValueContext) {
        NSLog(@"super class: value has changed");
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
