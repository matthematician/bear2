class Generator(BaseGenerator):
    def data(self):
        funcs = ["sin", "cos", "tan"]
        xmins = [-pi, -pi/2, 0, pi/2, pi]
        
        i = randint(0,2)
        xmin = xmins[randint(0,4)]
        xmax = xmin + pi
        
        clist=["Graph I", "Graph II", "Graph III", "Graph IV", "Graph V", "Graph VI" ]
        
        if(i==0): # sin
            if(xmin == pi or xmin == -pi):
                answer = "Graph V"
            if(xmin == -pi/2):
                answer = "Graph I"
            if(xmin == 0):
                answer = "Graph II"
            if(xmin == pi/2):
                answer = "Graph IV"
        if(i==1): # cos
            if(xmin == pi/2):
                answer = "Graph V"
            if(xmin == pi or xmin == -pi):
                answer = "Graph I"
            if(xmin == -pi/2):
                answer = "Graph II"
            if(xmin == 0):
                answer = "Graph IV"
        if(i==2): # tan
            if(xmin == -pi/2 or xmin == pi/2):
                answer = "Graph III"
            else:
                answer = "Graph VI"
                
                
        
        clist.remove(answer)
        shuffle(clist)
        
        clist = clist[0:4]+[answer]
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
            "func": funcs[i],
            "xmin": xmin,
            "xmax": xmax            
        }
