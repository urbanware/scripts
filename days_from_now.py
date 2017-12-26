#!/usr/bin/env python3

from datetime import datetime
from datetime import timedelta

def days_from_now():
    """
    Display the date after a certain number of days.
    """
    temp = int(input("Enter number of days: "))
    date = (datetime.now() + timedelta(days=temp))
    print(date.strftime("%A %B %d %Y"))


days_from_now()
