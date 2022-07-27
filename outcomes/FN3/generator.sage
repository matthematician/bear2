class Generator(BaseGenerator):
    def data(self):
        var('x y')
        
        clist = [r"\text{A horizontal line}", r"\text{A vertical line}", r"\text{An increasing line}", r"\text{A decreasing line}"]        
        ii = randint(0,3)
        answer = clist[ii]
        shuffle(clist)
        clist.append(r"\text{None of these}")
        
        if(ii==0):
            varh = y
            rhs = randint(1,8)*choice([-1,1])
        if(ii==1):
            varh = x
            rhs = randint(1,8)*choice([-1,1])
        if(ii==2):
            varh = y
            rhs = randint(2,8)*x + randint(1,8)*choice([-1])
        if(ii==3):
            varh = y
            rhs = randint(-8,-2)*x + randint(1,8)*choice([1])
        
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
            "var": varh,
            "expr": rhs
        }