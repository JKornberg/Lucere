from ZODB import FileStorage, DB
import persistent
import BTrees.OOBTree
import Settings

class User(persistent.Persistent):
    #User types: 0-guest, 1-technician, 2-admin
    #Guest: always has default settings, name is guest, no pin
    #technician: can change name, pin, personal settings, can reset to guest settings (aka default)
    #admin: Has all prior permissions & can set default settings
    def __init__(self,userId, name, pin=None, active=True,userType=1, settings=None, trialIds=[]):
        self.userType = userType
        self.userId = userId
        self.name = 'guest' if(userType == 0) else name
        self.pin = None if (userType == 0) else pin
        self.active = active
        self.settings = settings
        self.trialIds=trialIds
        
    def change_pin(self, pin):
        if (self.userType >= 1):
            self.pin = pin
            self._p_changed = True
        
    def change_type(self, userType):
        #Don't allow users to use this unless admin
        self.userType = userType
        self._p_changed = True
        
    def activate(self):
        self.active = True
        self._p_changed = True
        
    def deactivate(self):
        self.active = False
        self._p_changed = True
        
    def change_name(self, name):
        if (self.userType >= 1):
            self.name = name
            self._p_changed = True
    
    def change_settings(self,settings):
        if (self.userType >= 1):
            self.settings=settings
            self._p_changed = True
            
    def change_defaults(self,settings):
        if (self.userType == 2):
            self.settings=settings
            self._p_changed = True
            
    def get_settings(self):
        return self.settings

    def add_trial(self,trialId):
        self.trials.append(trialId)
        self._p_changed = True