class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        
        b = choice([2,3,4,5,10])
        f(x) = x + randint(1,5)*choice([-1,1])
        rhs = 3 if b==2 else choice([2,3])
        
        op = "-" if f(0)>0 else "+"
        
        clist = [b^rhs - f(0),b*rhs-f(0),b*rhs+f(0),b^(rhs-f(0))]
        answer = clist[0]
        
        clist.sort()
        
        ch = [
            {'letter': 'a', 'value': clist[0]},
            {'letter': 'b', 'value': clist[1]},
            {'letter': 'c', 'value': clist[2]},
            {'letter': 'd', 'value': clist[3]},
            {'letter': 'e', 'value': r"\frac{"+str(rhs)+"}{\log_{ "+str(b)+"}} "+op+str(abs(f(0))) }
        ]
        
        return {
            "answer": answer,
            "choices": ch,
            "b": b,
            "expr": f(x),
            "rhs": rhs
        }