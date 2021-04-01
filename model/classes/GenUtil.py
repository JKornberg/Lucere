#A LOT OF IMPORTS, probably a better way to do this
from ZODB import FileStorage, DB
from ZODB.interfaces import IBlobStorage
import BTrees.OOBTree
import transaction
import persistent
from datetime import datetime
from datetime import timezone
import numpy as np
from ZODB.blob import Blob
from PIL import Image as PImage
import os
from CameraDetails import CameraDetails
from CaptureDetails import CaptureDetails
from Result import Result
from Settings import Settings
from Trial import Trial
from User import User
from random import randint
import sys, getopt

def makeCameraDetails():
    return CameraDetails(randint(1,10),randint(1,10),randint(1,10),randint(1,10),randint(1,10),randint(1,10),randint(1,10),randint(1,10),randint(1,10),randint(1,10))
def makeCaptureDetails():
    sp = randint(500,6000)
    duration = int(randint(sp,1200000)/1000) #0 to 1200 seconds (20 mins)
    interval = int(randint(sp,duration*1000)/1000)
    count = duration/interval
    return CaptureDetails(sp,duration,interval,count)
def makeResult():
    return Result(randint(0,1),randint(500,700),randint(0,10))
def makeImage():
    A = (np.random.rand(1080,1920,3)*255).astype('uint8')
    im = PImage.fromarray(A)
    return im

def makeScanPaths(trialId,userId,count):
    return [f"data/user{userId}/trial{trialId}/scan{i}.jpg" for i in range(count)]

def makeSettings():
    return Settings(randint(0,100),randint(0,100),randint(0,100),randint(0,1600),randint(0,200000))

def makeUser(userId,name, trialIds):
    pin = 1234
    userType = randint(0,2)
    active = True
    settings = makeSettings()
    return User(userId,name,pin,active,userType, settings,trialIds)

def generateUser(userId,name,trialIds):
    return makeUser(userId,name,trialIds)

def generateTrial(trialId,userId,generateImages=False):
    #userId, dateTime, notes, scan, result, captureDetails, cameraDetails
    paths = makeScanPaths(trialId,userId,randint(1,3))
    if (generateImages):
        for path in paths:
            img = makeImage()
            if not os.path.isdir(path.split('/s')[0]):
                os.makedirs(path.split('/s')[0])
            img.save(path)
    return Trial(trialId,userId,datetime.now().astimezone(timezone.utc).timestamp(),
                 makeScanPaths(trialId,userId,randint(1,3)),str(userId) + ": Good notes",makeResult(),
                 makeCaptureDetails(),makeCameraDetails())


def main(argv):
    try:
        opts, args = getopt.getopt(argv,"hu:t:",["numberOfUsers=","trialsPerUser="])
    except getopt.GetoptError:
        print('GenUtil.py -u <numberOfUsers> -t <trialsPerUser>')
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print('GenUtil.py -u <numberOfUsers> -t <trialsPerUser>')
            sys.exit()
        elif opt in ("-u", "--users"):
            numUsers = arg
        if int(numUsers) > 5 or int(numUsers) < 1:
            print("invalid user count")
        elif opt in ("-t", "--trials"):
            numTrials = arg

    numUsers = int(numUsers)
    numTrials = int(numTrials)
    names = ["Jonah", "Vanessa", "Ciprian", "Sadie", "Atticus"]
    users = []
    trials = []
    for userId in range(numUsers):
        print(names[userId])
        trialIds = [*range(len(trials),numTrials+len(trials))]
        u = generateUser(userId,names[userId], trialIds)
        users.append(u)
        for i in trialIds:
            trials.append(generateTrial(i,userId,generateImages=False))
    for user in users:
        print(f'User:{user.userId},{user.name}: {user.userType}')
        print(user.trialIds)
        print(user.get_settings().format_settings())

    storage = FileStorage.FileStorage('LucereDummy.fs')
    db = DB(storage)
    connection = db.open()
    root = connection.root()
    root.users = BTrees.OOBTree.BTree()
    root.trials = BTrees.OOBTree.BTree()
    for u in users:
        root.users[u.userId] = u
    for t in trials:
        root.trials[t.trialId] = t
    transaction.commit()
    connection.close()

if __name__ == "__main__":
    main(sys.argv[1:])
