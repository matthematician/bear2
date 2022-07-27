class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        
        funcs = [x^2, x^3, sqrt(x), abs(x)]
        shuffle(funcs)
        f(x) = funcs[0]
        
        [h,k]=[0,0]
        while(abs(h)==abs(k)):
            [h,k] = [randint(1,5)*choice([-1,1]),randint(1,5)*choice([-1,1])]
        
        clist = [
            r"\text{Graph I.}",
            r"\text{Graph II.}",
            r"\text{Graph III.}",
            r"\text{Graph IV.}",
            r"\text{None of these.}"
        ]
        
        fs = [f(x+h)+k, f(x-k)+h, f(x-h)-k, f(x+k)-h, f(x-k)-h,f(x+k)+h,f(x+h)-k] # The seven incorrect choices
        shuffle(fs)
        
        fs = fs[0:3]+ [f(x-h)+k] 
        
        shuffle(fs)
        
        answer = 4
        for i in range(4):
            if( fs[i].subs({x:h})==k ):
                answer = i
                break
        
        # shuffle(clist)
        
        ch = [
            {'letter': 'a', 'value': clist[0]},
            {'letter': 'b', 'value': clist[1]},
            {'letter': 'c', 'value': clist[2]},
            {'letter': 'd', 'value': clist[3]},
            {'letter': 'e', 'value': clist[4]}
        ]
        
        return {
            "answer": clist[answer],
            "choices": ch,
            "f": f(x),
            "expr": f(x-h) + k,
            "fs": fs
            
        }
    @provide_data
    def graphics(data):
    # updated by clontz
        return {
            "graph0": plot(data['f'],(x,-10,10),ymin=-10,ymax=10,aspect_ratio=1,ticks=[[i-10 for i in range(21)],[i-10 for i in range(21)]], axes_labels=["$x$", "$y="+str(data['f'])+"$"]),
            "graph1": plot(data['fs'][0],(x,-10,10),ymin=-10,ymax=10,aspect_ratio=1,ticks=[[i-10 for i in range(21)],[i-10 for i in range(21)]]),
            "graph2": plot(data['fs'][1],(x,-10,10),ymin=-10,ymax=10,aspect_ratio=1,ticks=[[i-10 for i in range(21)],[i-10 for i in range(21)]]),
            "graph3": plot(data['fs'][2],(x,-10,10),ymin=-10,ymax=10,aspect_ratio=1,ticks=[[i-10 for i in range(21)],[i-10 for i in range(21)]]),
            "graph4": plot(data['fs'][3],(x,-10,10),ymin=-10,ymax=10,aspect_ratio=1,ticks=[[i-10 for i in range(21)],[i-10 for i in range(21)]])
            }