import sys
import random
import datetime
 
dictionary='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ~!@#$%^*_-+{[]}:,.?/1234567890'
dictlen=len(dictionary)
 
passlen = 12
if len(sys.argv) > 1:
    passlen = int(sys.argv[1])
    if passlen < 8:
        passlen = 8
 
def genPassword():
    password1 = ''
    random.seed(241234423+datetime.datetime.now().timestamp())
    for i in range(0, passlen):
        idx = random.randint(0, dictlen - 1)
        password1 += dictionary[idx]
    return password1;
 
def isPasswordStrong(passwd):
    ok = 0b1111
    for i in passwd:
        idx = dictionary.index(i)
        if(idx >=0 and idx < 26):
            ok = ok & 0b0111
        elif(idx >= 26 and idx < 52):
            ok = ok & 0b1011
        elif (idx >= 52 and idx < 72):
            ok = ok & 0b1101
        else:
            ok = ok & 0b1110
        if(ok == 0):
            return True
    return False
 
while True:
    password = genPassword()
    if(isPasswordStrong(password)):
        print(password)
        break
