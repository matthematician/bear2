class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        y = var('y')
        A = choice([-2,-1,-1/2,1/2,1,2])
        [h,k]=[1,2]
        while(abs(h-k)==1):
            h = randint(-4,4)
            k = randint(-2,2)
        f(x) = A*(x-h)^2 + k
        
        if(choice([True,False])):
            typ = "unbounded_left"
            xmin = -5
            xmax = h+1
            domain = r"(-\infty,"+str(xmax)+r"]"
            wdomain = r"(-\infty,"+str(xmax)+r")"
            ptx = xmax
            pty = f(xmax)
            if(A > 0): #Range unbounded above
                rang = r"["+str(k)+r",\infty)"
                wrang = r"["+str(pty)+r",\infty)"
            else:
                rang = r"(-\infty,"+str(k)+r"]"
                wrang = r"(-\infty,"+str(pty)+r"]"
            if(abs(f(-5))<=5): #Arrow at left side of graph
                ax = -5
                ay = f(-5)
                adx = -0.05
                ady = -0.05*f(x).derivative(x).subs({x:-5})
            else: #Arrow at top or bottom
                if(A < 0): # Bottom
                    ax = solve(f(x)==-5,x)[0].rhs()
                    ay = -5
                    adx = -0.05
                    ady = -0.05*f(x).derivative(x).subs({x:ax})
                else: # Top
                    ax = solve(f(x)==5,x)[0].rhs()
                    ay = 5
                    adx = -0.05
                    ady = -0.05*f(x).derivative(x).subs({x:ax})
        else:
            typ = "unbounded_right"
            xmin = h-1
            xmax = 5
            domain = r"["+str(xmin)+r",\infty)"
            wdomain = r"("+str(xmin)+r",\infty)"
            ptx = xmin
            pty = f(xmin)
            if(A > 0): #Range unbounded above
                rang = r"["+str(k)+r",\infty)"
                wrang = r"["+str(pty)+r",\infty)"
            else:
                rang = r"(-\infty,"+str(k)+r"]"
                wrang = r"(-\infty,"+str(pty)+r"]"
            if(abs(f(5))<=5): #Arrow at right side of graph
                ax = 5
                ay = f(5)
                adx = -0.05
                ady = -0.05*f(x).derivative(x).subs({x:5})
            else: #Arrow at top or bottom
                if(A < 0): # Bottom
                    ax = solve(f(x)==-5,x)[1].rhs()
                    ay = -5
                    adx = 0.05
                    ady = 0.05*f(x).derivative(x).subs({x:ax})
                else: # Top
                    ax = solve(f(x)==5,x)[1].rhs()
                    ay = 5
                    adx = 0.05
                    ady = 0.05*f(x).derivative(x).subs({x:ax})
        
        
        
       
        
        clist = [
                r"\text{Domain: }"+domain+r"\text{ Range: }"+rang,
                r"\text{Domain: }"+domain+r"\text{ Range: }"+wrang,
                r"\text{Domain: }"+wdomain+r"\text{ Range: }"+rang,
                r"\text{Domain: }"+wdomain+r"\text{ Range: }"+wrang,
                r"\text{Domain: }"+wrang+r"\text{ Range: }"+domain
                ]
        answer = clist[0]
        
        shuffle(clist)
        
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
            "f": f(x),
            "xmin": xmin,
            "xmax": xmax,
            "ptx": ptx,
            "pty": pty,
            "ax": ax,
            "ay": ay,
            "adx": adx,
            "ady": ady
            
        }
    @provide_data
    def graphics(data):
    # updated by clontz
        return {
            "graph": plot(data['f'],(x,data['xmin'],data['xmax']),xmin=-5, xmax=5,ymin=-5.1,ymax=5.1,ticks=[[i-5 for i in range(11)],[i-5 for i in range(11)]],aspect_ratio=1,thickness=2)+point([(-5.1,0),(5.1,0)],size=1,color='black')+point([(data['ptx'],data['pty'])],size=48, color='blue')+arrow((data['ax'],data['ay']),(data['ax']+data['adx'],data['ay']+data['ady']),color='blue')
            }