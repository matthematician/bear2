class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        
        k = choice([-1,1])
        f(x) = 1.3^(k*(x-2))*cos(pi*x) + 4 
        
        if(choice([True,False])):
            extreme = "maximum"
            sign = r"\leq"
        else:
            extreme = "minimum"
            sign = r"\geq"
            
        a = randint(-3,3)
        j = randint(1,3)
        
        ticks = [a+i*j for i in [0,1,2,3]]
        
        clist = [
                str(ticks[0])+r"\text{ only }",
                str(ticks[1])+r"\text{ only }",
                str(ticks[2])+r"\text{ only }",
                str(ticks[3])+r"\text{ only }",
                str(ticks[0])+r"\text{ and }"+str(ticks[2]) if extreme=="maximum" else str(ticks[1])+r"\text{ and }"+str(ticks[3]),
                ]
        
        if(k==1): #Amplitude growing
            answer = clist[2] if extreme=="maximum" else clist[3]
        else: 
            answer = clist[0] if extreme=="maximum" else clist[1]
        
        #shuffle(clist)
        
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
            "f": choice(['f','g','h','p']),
            "expr": f(x),
            "sign": sign,
            "extreme": extreme,
            "ticks": ticks
        }
    @provide_data
    def graphics(data):
    # updated by clontz
        return {
            "graph": plot(data['expr'],(x,1.5,5.5),ticks=[[2,3,4,5],[]],tick_formatter=[data['ticks'],[]],xmin=-1, xmax=6, ymin=1,ymax=7)
            }