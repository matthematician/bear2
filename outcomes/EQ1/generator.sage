class Generator(BaseGenerator):
    def data(self):
        vars = ['a', 'b', 'h', 'k', 'm', 'n', 'p', 'r', 't', 'u', 'x', 'y']
        shuffle(vars)
        x = var(vars[0])
        
        f(x) = x + randint(1,8)*choice([-1,1])
        
        signs = [r"\leq", r"<", r">", r"\geq"]
        i= randint(0,3)
        sign = signs[i]
        osign = signs[3-i]
        
        b = f(0)
        while(b == f(0)):
            b = randint(1,12)
        
        c1 = -b-f(0)
        c2 = b-f(0)
        
        rsign = ''
        if(i<=1):
            rsign = sign
        if(i==2):
            rsign = r"<"
        if(i==3):
            rsign = r"\leq"
        
        clist = [
            str(x)+sign+" "+str(b),
            str(x)+osign+" "+str(b),
            str(c1)+rsign+" "+str(x)+" "+rsign+str(c2),
            str(-b)+rsign+" "+str(x)+" "+rsign+str(b),
            str(x)+osign+" "+str(c1)+r" \text{ or }"+str(x)+sign+" "+str(c2)
        ]
        if(i<=1): # Bounded interval
            answer = clist[2]
        else: # Union of unbounded intervals
            answer = clist[4]
       
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
            "sign": sign,
            "rhs": b
        }