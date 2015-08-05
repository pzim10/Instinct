//
//  Settings.m
//  Instinct
//
//  Created by Peter Zimmerman on 7/31/15.
//  Copyright (c) 2015 Peter Zimmerman. All rights reserved.
//

#import "Settings.h"

@interface Settings ()

@end

@implementation Settings

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.settings = @[@"Receive Notifications", @"Help", @"About Us", @"Contact us"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"setting"];
    
    cell.textLabel.text = self.settings[indexPath.row];
/*
Not Ready for notifications
    if ([cell.textLabel.text isEqualToString:self.settings[0]]) {
        UISwitch *notify = [[UISwitch alloc] initWithFrame:CGRectMake(tableView.frame.size.width - 55, 5, 0, 0)];
        notify.on = NO;
        [cell addSubview:notify];
    }
*/
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.settings.count >4) {
        return [self.settings count];
    } else return 4;
}

@end
