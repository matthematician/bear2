class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        
        funcs = ["tan", "cot", "csc", "sec"]
        angles = [0, pi/4, pi/2, 3*pi/4, pi, 5*pi/4, 3*pi/2, 7*pi/4]
        
        i = randint(0,3)
        
        clist = [1,1,1,1,1]
        
        if(i==0 or i==3): # y-axis is answer
            angles.remove(pi/2)
            angles.remove(3*pi/2)
            shuffle(angles)
            answer = choice([pi/2,3*pi/2])
            clist = angles[0:4]+[answer]
        else: # x-axis is answer
            angles.remove(0)
            angles.remove(pi)
            shuffle(angles)
            answer = choice([0,pi])
            clist = angles[0:4]+[answer]
        
        
        clist.sort()
        
        ch = [
            {'letter': 'a', 'value': clist[0]},
            {'letter': 'b', 'value': clist[1]},
            {'letter': 'c', 'value': clist[2]},
            {'letter': 'd', 'value': clist[3]},
            {'letter': 'e', 'value': clist[4]},
        ]
        
        return {
            "answer": answer,
            "choices": ch,
            "func": funcs[i]
            
        }
