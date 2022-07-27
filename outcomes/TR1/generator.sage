class Generator(BaseGenerator):
    def data(self):
        
        funcs = ["sin", "cos"]
        angles = [0, pi/6, pi/3, pi/2, 2*pi/3, 5*pi/6, pi, 7*pi/6, 4*pi/3, 3*pi/2, 5*pi/3, 11*pi/6]
        sins = [0, QQ(1/2), sqrt(3)/2, 1, sqrt(3)/2, QQ(1/2), 0, QQ(-1/2), -sqrt(3)/2, -1, -sqrt(3)/2, QQ(-1/2)]
        coss = [1, sqrt(3)/2, QQ(1/2), 0, QQ(-1/2), -sqrt(3)/2, -1, -sqrt(3)/2, QQ(-1/2),0, QQ(1/2), sqrt(3)/2 ]
        
        if(choice([True,False])):
            func = funcs[0] # sin
        else:
            func = funcs[1] # cos
        
        i = randint(0,11)
        t = angles[i]
        sint = sins[i]
        cost = coss[i]
        
        clist = [ sint,cost,-1*sint,-1*cost, choice([0,-1,1])]
        answer = clist[0] if func == "sin" else clist[1]
        if(len(set(clist))<5): #Something's zero
            if(sint == 0):
                clist = [sint, cost, -1*cost, QQ(1/2), QQ(-1/2)]
            else:
                clist = [sint, cost, -1*sint, QQ(1/2), QQ(-1/2)]
                
        clist.sort()
        
        ch = [
            {'letter': 'a', 'value': clist[0]},
            {'letter': 'b', 'value': clist[1]},
            {'letter': 'c', 'value': clist[2]},
            {'letter': 'd', 'value': clist[3]},
            {'letter': 'e', 'value': clist[4]}
        ]
        
        return {
            "answer": answer,
            "choices": ch,
            "func": str(func),
            "angle": t
            
        }