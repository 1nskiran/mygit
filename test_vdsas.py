def abbr_destination(str):
    destination=None
    if str=="EWR":
       destination="Newark Liberty International Airport" 
    elif str=='ORD':
       destination="Chicago O'Hare International Airport" 
    elif str=='IAH':
       destination="George Bush Intercontinental Airport" 
    elif str=='IAH':
       destination="International Trademark Association" 
    else:
       destination="Test Abbreviation" 
    
    return destination
